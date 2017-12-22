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
    
</xsl:stylesheet>