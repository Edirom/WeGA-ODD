<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:wega="https://weber-gesamtausgabe.de/"
    xpath-default-namespace="http://www.music-encoding.org/ns/mei"
    xmlns="http://www.music-encoding.org/ns/mei"
    exclude-result-prefixes="xs wega"
    version="2.0">
    
    <xsl:param name="current-mei-version" as="xs:string">3.0.0</xsl:param>
    
    <xsl:output media-type="application/tei+xml" encoding="UTF-8" indent="no" method="xml"/>
    <xsl:preserve-space elements="*"/>
    
    <xsl:variable name="duplicatesWrapper" as="element()">
        <mei xmlns="http://www.music-encoding.org/ns/mei" meiversion="3.0.0">
            <meiHead>
                <fileDesc>
                    <titleStmt xml:id="titleStmt">
                        <title>Duplikat</title>
                    </titleStmt>
                    <pubStmt>
                        <respStmt n="WeGA">
                            <persName role="edt">Veit, Joachim</persName>
                        </respStmt>
                        <address>
                            <addrLine>Hornsche Str. 39</addrLine>
                            <addrLine>32756</addrLine>
                            <addrLine>Detmold</addrLine>
                            <addrLine>Germany</addrLine>
                        </address>
                        <availability>
                            <useRestrict>This work is available under a Creative Commons Attribution 4.0 International (CC BY 4.0) license.</useRestrict>
                        </availability>
                    </pubStmt>
                </fileDesc>
            </meiHead>
            <music/>
        </mei>
    </xsl:variable>
    
    <xsl:template match="node() | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="processing-instruction()" priority="1"/>
    
    <xsl:template match="document-node()">
        <xsl:call-template name="inject-schema-references">
            <xsl:with-param name="schema-URL">https://music-encoding.org/schema/<xsl:value-of select="$current-mei-version"/>/mei-all.rng</xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="mei[ref]" priority="10">
        <xsl:apply-templates select="$duplicatesWrapper"/>
    </xsl:template>
    
    <xsl:template match="@meiversion">
        <xsl:attribute name="meiversion" select="$current-mei-version"/>
    </xsl:template>
    
    <xsl:template match="@dbkey[matches(., 'A[A-F0-9]{6}')]" mode="#all">
        <xsl:attribute name="authURI">https://weber-gesamtausgabe.de/</xsl:attribute>
        <xsl:attribute name="codedval" select="."/>
    </xsl:template>
    
    <xsl:template name="inject-schema-references">
        <xsl:param name="schema-URL" as="xs:string"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:processing-instruction name="xml-model">href="<xsl:value-of select="$schema-URL"/>" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
        <xsl:text>&#10;</xsl:text>
        <xsl:processing-instruction name="xml-model">href="<xsl:value-of select="$schema-URL"/>" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>