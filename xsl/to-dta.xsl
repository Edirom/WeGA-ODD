<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:teix="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output media-type="application/tei+xml" encoding="UTF-8" indent="no" method="xml"/>
    <xsl:preserve-space elements="*"/>
    
    <xsl:include href="to-tei_all.xsl"/>
    
    <xsl:template match="document-node()" priority="1">
        <xsl:call-template name="inject-schema-references">
            <xsl:with-param name="schema-URL">http://www.deutschestextarchiv.de/basisformat.rng</xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:variable name="tagsDecl_dta" as="element()">
        <tagsDecl>
            <rendition xml:id="latintype" scheme="css">font-style: italic;</rendition>
            <rendition xml:id="italic" scheme="css">font-style: italic;</rendition>
            <rendition xml:id="underline" scheme="css">text-decoration: underline;</rendition>
            <rendition xml:id="superscript" scheme="css">vertical-align: super; font-size: 0.8em; line-height: 0.7em;</rendition>
            <rendition xml:id="subscript" scheme="css">vertical-align: sub; font-size: 0.8em; line-height: 0.7em;</rendition>
            <rendition xml:id="center" scheme="css">display: block; text-align: center;</rendition>
            <rendition xml:id="right" scheme="css">display: block; text-align: right;</rendition>
            <rendition xml:id="antiqua" scheme="css">font-style: italic;</rendition>
            <rendition xml:id="left" scheme="css">display: block; text-align: left;</rendition>
            <rendition xml:id="spaced_out" scheme="css">letter-spacing: 0.15em;</rendition>
            <rendition xml:id="bold" scheme="css">font-weight: bold;</rendition>
            <rendition xml:id="small-caps" scheme="css">font-variant: small-caps;</rendition>
        </tagsDecl>
    </xsl:variable>
    
    <xsl:template match="TEI[@xml:id]">
        <xsl:copy>
            <xsl:apply-templates select="@* except @xml:id | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="teiHeader" priority="1">
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="encodingDesc">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="node() except revisionDesc"/>
                    <xsl:element name="encodingDesc">
                        <xsl:apply-templates select="$tagsDecl_dta"/>
                    </xsl:element>
                    <xsl:apply-templates select="revisionDesc"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="encodingDesc" priority="1">
        <xsl:copy>
            <xsl:apply-templates/>
            <xsl:apply-templates select="$tagsDecl_dta"/>
        </xsl:copy>
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
    
    <!-- TODO: need to flesh out the bibliographic reference-->
    <xsl:template match="biblStruct">
        <xsl:element name="bibl">
            <!--<xsl:apply-templates select="analytic/node() | monogr/node() except monogr/imprint | monogr/imprint/node()"/>-->
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="author[@sameAs]">
        <xsl:variable name="lookup" select="id(substring(@sameAs, 2))"/>
        <xsl:copy>
            <xsl:apply-templates select="$lookup/node() | $lookup/@* except $lookup/@xml:id"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="note[@type=('summary', 'incipit', 'commentary', 'textConst')]">
        <xsl:copy>
            <xsl:attribute name="type">editorial</xsl:attribute>
            <xsl:apply-templates select="@* except @type | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="text">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="settlement">
        <xsl:element name="placeName">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="placeName[settlement][count(node()) eq 1]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Hmm, what about projects without images? -->
    <xsl:template match="pb[not(@facs)]">
        <xsl:copy>
            <xsl:attribute name="facs">#</xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="rs">
        <xsl:choose>
            <xsl:when test="@key">
                <xsl:element name="ref">
                    <xsl:attribute name="target" select="replace(@key, '(A[A-F0-9]{6})', 'https://weber-gesamtausgabe.de/$1')"/>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="characterName" mode="#all" priority="1">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Hmm, no desc nor graphic is supported within figures -->
    <xsl:template match="notatedMusic">
        <xsl:element name="figure">
            <xsl:attribute name="type">notatedMusic</xsl:attribute>
            <xsl:comment>
                <xsl:apply-templates/>
            </xsl:comment>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="figure">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="cb|lb">
        <xsl:if test="@type='inWord'">
            <xsl:text>&#x002D;</xsl:text>
        </xsl:if>
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="seg[@rend]">
        <xsl:element name="hi">
            <xsl:attribute name="rendition">
                <xsl:choose>
                    <xsl:when test="@rend='center'">#c</xsl:when>
                    <xsl:when test="@rend='right'">#right</xsl:when>
                </xsl:choose>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="space">
        <xsl:copy>
            <xsl:attribute name="dim">horizontal</xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
    <!-- TODO: need to keep the <quote> element -->
    <xsl:template match="quote[@rend] | q">
        <xsl:call-template name="enquote">
            <xsl:with-param name="double" select="@rend='double-quotes' or self::q"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="@level[parent::title][ancestor::titleStmt]">
        <xsl:choose>
            <xsl:when test=".= 's'">
                <xsl:attribute name="type">volume</xsl:attribute>
            </xsl:when>
            <xsl:when test=".= 'a'">
                <xsl:attribute name="type">main</xsl:attribute>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@type[.='WeGA'][parent::idno][ancestor::publicationStmt]">
        <xsl:attribute name="type">URLWeb</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@rend" priority="1">
        <xsl:attribute name="rendition">
            <xsl:choose>
                <xsl:when test=".='italic'">#i</xsl:when>
                <xsl:when test=".='bold'">#b</xsl:when>
                <xsl:when test=".='underline'">#u</xsl:when>
                <xsl:when test=".='spaced_out'">#g</xsl:when>
                <xsl:when test=".='latintype'">#i</xsl:when>
                <xsl:when test=".='antiqua'">#aq</xsl:when>
                <xsl:when test=".='superscript'">#sup</xsl:when>
                <xsl:when test=".='subscript'">#sub</xsl:when>
                <!--<xsl:when test="ends-with(., 'quotes')">
                <xsl:attribute name="rendition" select="concat('#',.,'-before #', ., '-after')"/>
            </xsl:when>-->
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@reason[.='outOfScope']">
        <xsl:attribute name="reason">insignificant</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="projectDesc"/>
    <xsl:template match="revisionDesc"/>
    <!-- prevent empty notesStmt -->
    <xsl:template match="notesStmt[count(* except note[@type='part']) = 0]"/>
    <xsl:template match="note[@type=('part', 'fontUsage')]"/>
    <xsl:template match="@xml:id[parent::author]"/>
    <xsl:template match="@key[parent::author]" priority="1"/>
    <xsl:template match="@type[parent::head]"/>
    <xsl:template match="@type[parent::date]"/>
    
    <xsl:template name="enquote">
        <xsl:param name="double" select="true()"/>
        <xsl:param name="lang" select="'de'"/>
        <xsl:choose>
            <!-- German double quotation marks -->
            <xsl:when test="$lang eq 'de' and $double">
                <xsl:text>„</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>“</xsl:text>
            </xsl:when>
            <xsl:when test="$lang eq 'en' and $double">
                <xsl:text>“</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>”</xsl:text>
            </xsl:when>
            <!-- German single quotation marks -->
            <xsl:when test="$lang eq 'de' and not($double)">
                <xsl:text>‚</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>‘</xsl:text>
            </xsl:when>
            <xsl:when test="$lang eq 'en' and not($double)">
                <xsl:text>‘</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>’</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text>
                <xsl:apply-templates mode="#current"/>
                <xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>