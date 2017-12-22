<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:wega="https://weber-gesamtausgabe.de/"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs wega teix"
    version="2.0">
    
    <xsl:output media-type="application/tei+xml" encoding="UTF-8" indent="no" method="xml"/>
    <xsl:preserve-space elements="*"/>
    
    <xsl:include href="to-tei_all.xsl"/>
    
    <xsl:template match="document-node()" priority="1">
        <xsl:call-template name="inject-schema-references">
            <xsl:with-param name="schema-URL">http://www.tei-c.org/Vault/P5/<xsl:value-of select="$current-tei-version"/>/xml/tei/custom/schema/relaxng/tei_simplePrint.rng</xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="address[*][not(addrLine)]" mode="#all">
        <xsl:copy>
            <xsl:for-each select="*">
                <xsl:element name="addrLine">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="placeName|settlement|country|region|geogName" mode="#all">
        <xsl:element name="name">
            <xsl:attribute name="type">place</xsl:attribute>
            <xsl:apply-templates select="@* except @type | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="persName">
        <xsl:element name="name">
            <xsl:attribute name="type">person</xsl:attribute>
            <xsl:apply-templates select="@* except @type | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="orgName">
        <xsl:element name="name">
            <xsl:attribute name="type">org</xsl:attribute>
            <xsl:apply-templates select="@* except @type | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="workName|characterName|name[@type='work']" priority="1">
        <xsl:element name="name">
            <xsl:apply-templates select="@* except @type | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="genName|roleName|addName">
        <xsl:element name="name">
            <xsl:attribute name="type" select="concat('person', upper-case(substring(local-name(), 1, 1)), substring(local-name(), 2))"/>
            <xsl:apply-templates select="@* except @type | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="forename|surname|nameLink">
        <xsl:element name="name">
            <xsl:attribute name="type" select="local-name()"/>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="placeName[parent::place]" priority="1">
        <xsl:element name="label">
            <xsl:apply-templates select="@* except @type | node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="location" mode="#all">
        <xsl:element name="note">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="person" mode="persons" priority="1">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:element name="ab">
                <xsl:apply-templates select="$curNode/node() except $curNode/ref" mode="#default"/>
            </xsl:element>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="event">
        <xsl:element name="list">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="p[parent::event]">
        <xsl:element name="item">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="list[parent::event]" priority="1">
        <xsl:element name="item">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="msDesc" mode="#all">
        <xsl:element name="p">
            <xsl:value-of select="string-join(msIdentifier/*, '; ')"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="biblStruct">
        <xsl:element name="bibl">
            <xsl:apply-templates select="analytic/node() | monogr/node() except monogr/imprint | monogr/imprint/node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="biblStruct" mode="biblio" priority="1">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:element name="bibl">
            <xsl:apply-templates select="$curNode/analytic/node() | $curNode/monogr/node() except $curNode/monogr/imprint | $curNode/monogr/imprint/node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="author[@sameAs]">
        <xsl:variable name="lookup" select="id(substring(@sameAs, 2))"/>
        <xsl:copy>
            <xsl:apply-templates select="$lookup/node() | $lookup/@* except $lookup/@xml:id"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="listWit">
        <xsl:element name="list">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="witness">
        <xsl:element name="item">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="damage">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="notatedMusic">
        <xsl:element name="figure">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="app">
        <xsl:apply-templates select="(lem,rdg)[1]"/>
    </xsl:template>
    
    <xsl:template match="lem|rdg">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="mentioned">
        <xsl:element name="hi">
            <xsl:attribute name="rendition">#bold</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ptr">
        <xsl:element name="ref">
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="@target"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="sex"/>
    <xsl:template match="birth"/>
    <xsl:template match="death"/>
    <xsl:template match="occupation"/>
    <xsl:template match="residence"/>
    <xsl:template match="affiliation"/>
    <xsl:template match="correspDesc"/>
    <xsl:template match="divGen"/>
    <xsl:template match="space"/>
    <xsl:template match="addSpan"/>
    <xsl:template match="delSpan"/>
    <xsl:template match="handNotes"/>
    <xsl:template match="handShift"/>
    <xsl:template match="eg"/>
    <xsl:template match="teix:egXML"/>
    <xsl:template match="ptr[starts-with(@target, '#')]"/>
    <xsl:template match="@rend[parent::del or parent::closer]" priority="1"/>
    <xsl:template match="@place[.='mixed']"/>
    <xsl:template match="@decls"/>
    
</xsl:stylesheet>