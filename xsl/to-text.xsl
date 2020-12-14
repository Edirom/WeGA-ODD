<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="no" encoding="UTF-8" media-type="plain/text" method="text"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="//tei:body"/>
    </xsl:template>
    
    <xsl:template match="tei:body|tei:div">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <xsl:apply-templates select="*"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:p|tei:opener|tei:closer">
        <xsl:variable name="content">
            <xsl:apply-templates/>
        </xsl:variable>
        <xsl:value-of select="replace(normalize-space($content), '\s*#lb#\s*', '&#10;')"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:dateline|tei:signed|tei:lb|tei:cb">
        <xsl:text>#lb#</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:gap">
        <xsl:text>[…]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:supplied">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <xsl:text> | </xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <xsl:text>* </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:sic|tei:unclear[1]"/>
    </xsl:template>
    
    <xsl:template match="tei:subst">
        <xsl:apply-templates select="node() except tei:del"/>
    </xsl:template>
    
    <xsl:template match="tei:note"/>
    
    <xsl:template match="tei:q">
        <!-- Always(!) surround with quotation marks -->
        <xsl:variable name="doubleQuotes" select="(count(ancestor::tei:q | ancestor::tei:quote) mod 2) = 0"/>
        <xsl:call-template name="enquote">
            <xsl:with-param name="double" select="$doubleQuotes"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="tei:quote">
        <xsl:choose>
            <!-- Surround with quotation marks if @rend is set -->
            <xsl:when test="@rend">
                <xsl:call-template name="enquote">
                    <xsl:with-param name="double" select="@rend='double-quotes'"/>
                </xsl:call-template>
            </xsl:when>
            <!-- no quotation marks as default -->
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="enquote">
        <xsl:param name="double" select="true()"/>
        <xsl:choose>
            <!-- German double quotation marks -->
            <xsl:when test="$double">
                <xsl:text>„</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>“</xsl:text>
            </xsl:when>
            <!-- German single quotation marks -->
            <xsl:when test="not($double)">
                <xsl:text>‚</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>‘</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
