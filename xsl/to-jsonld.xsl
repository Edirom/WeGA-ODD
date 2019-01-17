<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:wega="http://weber-gesamtausgabe.de"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:param name="purl-root" select="'http://weber-gesamtausgabe.de/'"/>
    
    <xsl:output media-type="application/ld+json" method="json" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@* | node()"/>
    
    <xsl:template name="common-entries">
        <xsl:map-entry key="'@context'" select="'http://schema.org'"/>
        <xsl:map-entry key="'@id'" select="concat($purl-root, @xml:id)"/>
        <xsl:map-entry key="'url'" select="concat($purl-root, @xml:id)"/>
    </xsl:template>
    
    <xsl:template match="tei:TEI | tei:ab[@status]">
        <xsl:map>
            <xsl:map-entry key="'@type'" select="wega:infer-type(.)"/>
            <xsl:map-entry key="'publisher'">
                <xsl:map>
                    <xsl:map-entry key="'@type'" select="'Organization'"/>
                    <xsl:map-entry key="'name'" select="'Carl-Maria-von-Weber-Gesamtausgabe'"/>
                    <xsl:map-entry key="'url'" select="'http://weber-gesamtausgabe.de'"/>
                </xsl:map>
            </xsl:map-entry>
            <xsl:map-entry key="'funder'">
                <xsl:map>
                    <xsl:map-entry key="'@type'" select="'Organization'"/>
                    <xsl:map-entry key="'name'" select="'Akademie der Wissenschaften und der Literatur, Mainz'"/>
                    <xsl:map-entry key="'url'" select="'http://adwmainz.de'"/>
                </xsl:map>
            </xsl:map-entry>
            <xsl:map-entry key="'license'" select="'http://creativecommons.org/licenses/by/4.0/'"/>
            <xsl:map-entry key="'dateCreated'" select="wega:dateCreated(.)"/>
            <xsl:call-template name="common-entries"/>
            <xsl:apply-templates/>
            <xsl:if test=".//tei:text//tei:persName 
                | .//tei:correspDesc//tei:persName 
                | .//tei:text//tei:settlement 
                | .//tei:correspDesc//tei:settlement
                | ./self::tei:ab//tei:persName
                | ./self::tei:ab//tei:settlement">
                <xsl:variable name="mentioned-persNames" as="element()*">
                    <xsl:for-each-group select=".//tei:text//tei:persName | .//tei:correspDesc//tei:persName | ./self::tei:ab//tei:persName" group-by="@key">
                        <xsl:sequence select="current-group()[1]"/>
                    </xsl:for-each-group>
                </xsl:variable>
                <xsl:variable name="mentioned-placeNames" as="element()*">
                    <xsl:for-each-group select=".//tei:text//tei:settlement | .//tei:correspDesc//tei:settlement | ./self::tei:ab//tei:settlement" group-by="@key">
                        <xsl:sequence select="current-group()[1]"/>
                    </xsl:for-each-group>
                </xsl:variable>
                <xsl:map-entry key="'mentions'" select="array {
                    for $persName in $mentioned-persNames
                    return wega:persName($persName),
                    for $placeName in $mentioned-placeNames
                    return wega:place($placeName)
                    }"/>
            </xsl:if>
        </xsl:map>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <xsl:map>
            <xsl:map-entry key="'@type'" select="'Person'"/>
            <xsl:call-template name="common-entries"/>
            <xsl:apply-templates/>
        </xsl:map>
    </xsl:template>
    
    <xsl:template match="tei:org">
        <xsl:map>
            <xsl:map-entry key="'@type'" select="'Organization'"/>
            <xsl:call-template name="common-entries"/>
            <xsl:apply-templates/>
        </xsl:map>
    </xsl:template>
    
    <xsl:template match="tei:place">
        <xsl:map>
            <xsl:map-entry key="'@type'" select="'Place'"/>
            <xsl:call-template name="common-entries"/>
            <xsl:apply-templates/>
        </xsl:map>
    </xsl:template>
    
    <!--<xsl:template match="tei:ab[@status]">
        <xsl:map>
            <xsl:map-entry key="'@type'" select="'CreativeWork'"/>
            <xsl:call-template name="common-entries"/>
            <xsl:apply-templates/>
        </xsl:map>
    </xsl:template>-->
    
    <xsl:template match="tei:*[@type='reg'] | tei:title[@level='a'][1]">
        <xsl:map-entry key="'name'" select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="tei:*[@type=('alt', 'modern')][1]">
        <xsl:map-entry key="'alternateName'" select="array {
            for $name in (., ./following-sibling::tei:*[@type=('alt', 'modern')]) 
            return normalize-space($name)
            }"/>
    </xsl:template>
    
    <xsl:template match="tei:idno[@type=('gnd', 'viaf', 'geonames')][1]">
        <xsl:map-entry key="'sameAs'" select="array{
            for $id in (., ./following-sibling::tei:idno[@type=('gnd', 'viaf', 'geonames')])
            return concat(
                if($id/@type='gnd') then 'http://d-nb.info/gnd/'
                else if($id/@type='viaf') then 'http://viaf.org'
                else 'http://geonames.org/',
                normalize-space($id))
            }"/>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader">
        <xsl:apply-templates select="tei:fileDesc/tei:titleStmt/*"/>
    </xsl:template>
    
    <xsl:template match="tei:birth | tei:death">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:date[@when][parent::tei:birth or parent::tei:death][1]">
        <xsl:map-entry key="concat(local-name(./parent::*), 'Date')" select="string(@when)"/>
    </xsl:template>
    
    <xsl:template match="tei:settlement[parent::tei:birth or parent::tei:death][1]">
        <xsl:map-entry key="concat(local-name(./parent::*), 'Place')" select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="tei:sex[.=('f','m')]">
        <xsl:map-entry key="'gender'" select="if(.='f') then 'Female' else 'Male'"/>
    </xsl:template>
    
    <xsl:template match="tei:state[tei:label='Ort'][1]">
        <xsl:map-entry key="'location'" select="array{
            for $state in (., ./following-sibling::tei:state[tei:label='Ort'])
            return wega:place($state/tei:desc/tei:settlement)
            }"/>
    </xsl:template>
    
    <xsl:template match="tei:occupation[1]">
        <xsl:map-entry key="'hasOccupation'" select="array{
            for $occ in (., ./following-sibling::tei:occupation)
            return wega:occupation($occ)
            }"/>
    </xsl:template>
    
    <xsl:template match="tei:residence[tei:settlement][1]">
        <xsl:map-entry key="'homeLocation'" select="array{
            for $residence in (., ./following-sibling::tei:residence[tei:settlement])
            return wega:place($residence/tei:settlement)
            }"/>
    </xsl:template>
    
    <xsl:template match="tei:location">
        <xsl:map-entry key="'geo'">
            <xsl:map>
                <xsl:map-entry key="'@type'" select="'GeoCoordinates'"/>
                <xsl:map-entry key="'latitude'" select="tokenize(tei:geo, '\s+')[1]"/>
                <xsl:map-entry key="'longitude'" select="tokenize(tei:geo, '\s+')[2]"/>
            </xsl:map>
        </xsl:map-entry>
    </xsl:template>
    
    <xsl:template match="tei:author[1]">
        <xsl:map-entry key="'author'" select="array{
            for $author in (., ./following-sibling::tei:author)
            return wega:persName($author)
            }"/>
    </xsl:template>
    
    <xsl:template match="tei:editor[1]">
        <xsl:map-entry key="'editor'" select="array{
            for $editor in (., ./following-sibling::tei:editor)
            return wega:persName($editor)
            }"/>
    </xsl:template>
    
    <xsl:function name="wega:place">
        <xsl:param name="node"/>
        <xsl:map>
            <xsl:map-entry key="'@type'" select="'Place'"/>
            <xsl:map-entry key="'name'" select="normalize-space($node)"/>
            <xsl:if test="$node/@key">
                <xsl:map-entry key="'url'" select="concat($purl-root, $node/@key)"/>
            </xsl:if>
        </xsl:map>
    </xsl:function>
    
    <xsl:function name="wega:occupation">
        <xsl:param name="node"/>
        <xsl:map>
            <xsl:map-entry key="'@type'" select="'Occupation'"/>
            <xsl:map-entry key="'name'" select="normalize-space($node)"/>
        </xsl:map>
    </xsl:function>
    
    <xsl:function name="wega:persName">
        <xsl:param name="node"/>
        <xsl:map>
            <xsl:map-entry key="'@type'" select="'Person'"/>
            <xsl:map-entry key="'name'" select="normalize-space($node)"/>
            <xsl:if test="$node/@key">
                <xsl:map-entry key="'url'" select="concat($purl-root, $node/@key)"/>
                <xsl:map-entry key="'@id'" select="concat($purl-root, $node/@key)"/>
            </xsl:if>
        </xsl:map>
    </xsl:function>
    
    <xsl:function name="wega:infer-type" as="xs:string">
        <xsl:param name="doc" as="element()"/>
        <xsl:choose>
            <xsl:when test="starts-with($doc/@xml:id, 'A05')">NewsArticle</xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A09')">Article</xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A12')">Article</xsl:when>
            <xsl:otherwise>CreativeWork</xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="wega:dateCreated" as="xs:string">
        <xsl:param name="doc" as="element()"/>
        <xsl:choose>
            <xsl:when test="starts-with($doc/@xml:id, 'A03')">
                <xsl:value-of select="$doc//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date/string((@notBefore, @when, @from))"/>
            </xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A04')">
                <xsl:value-of select="$doc//tei:correspAction[@type='sent']/tei:date/string((@notBefore, @when, @from))"/>
            </xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A05')">
                <xsl:value-of select="$doc//tei:publicationStmt/tei:date/string(@when)"/>
            </xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A06')">
                <xsl:value-of select="$doc/string(@n)"/>
            </xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A09')">
                <xsl:value-of select="$doc//tei:revisionDesc/tei:change[last()]/string(@when)"/>
            </xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A10')">
                <xsl:value-of select="$doc//tei:creation/tei:date/string((@notBefore, @when, @from))"/>
            </xsl:when>
            <xsl:when test="starts-with($doc/@xml:id, 'A12')">
                <xsl:value-of select="$doc//tei:revisionDesc/tei:change[last()]/string(@when)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>