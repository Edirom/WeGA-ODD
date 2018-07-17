<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:wega="https://weber-gesamtausgabe.de/"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs wega"
    version="2.0">
    
    <xsl:param name="current-tei-version" as="xs:string">3.3.0</xsl:param>
    
    <xsl:output media-type="application/tei+xml" encoding="UTF-8" indent="no" method="xml"/>
    <xsl:preserve-space elements="*"/>
    
    <xsl:variable name="biblioWrapper" as="element()">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title level="s">WeGA, Bibliographie, Digitale Edition</title>
                        <title level='a'>Title</title>
                        <editor>Veit, Joachim</editor>
                        <editor>Stadler, Peter</editor>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>
                            <name>Carl-Maria-von-Weber-Gesamtausgabe</name>
                            <address>
                                <street>Hornsche Str. 39</street>
                                <postCode>32756</postCode>
                                <placeName>
                                    <country>D</country>
                                    <settlement>Detmold</settlement>
                                </placeName>
                            </address>
                        </publisher>
                        <availability>
                            <licence target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International (CC BY 4.0)</licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Born digital</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <listBibl>
                        <biblStruct></biblStruct>
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:variable>
    
    <xsl:variable name="diariesWrapper" as="element()">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title level="s">WeGA, Tagebücher, Digitale Edition</title>
                        <title level='a'>Title</title>
                        <author ref="https://weber-gesamtausgabe.de/A002068">Weber, Carl Maria von</author>
                        <editor>Veit, Joachim</editor>
                        <editor>Stadler, Peter</editor>
                        <respStmt>
                            <resp>Übertragung</resp>
                            <name>Dagmar Beck</name>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>
                            <name>Carl-Maria-von-Weber-Gesamtausgabe</name>
                            <address>
                                <street>Hornsche Str. 39</street>
                                <postCode>32756</postCode>
                                <placeName>
                                    <country>D</country>
                                    <settlement>Detmold</settlement>
                                </placeName>
                            </address>
                        </publisher>
                        <availability>
                            <licence target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International (CC BY 4.0)</licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <msDesc>
                            <msIdentifier>
                                <country>D</country>
                                <settlement>Berlin</settlement>
                                <repository n="D-B">Staatsbibliothek zu Berlin – Preußischer Kulturbesitz</repository>
                                <idno>Mus. ms. autogr. theor. C. M. v. Weber WFN 1</idno>
                            </msIdentifier>
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <projectDesc>
                        <p>Carl-Maria-von-Weber-Gesamtausgabe</p>
                    </projectDesc>
                    <editorialDecl>
                        <p>The Transcription of the correspondence material follows the editorial principles of the Carl-Maria-von-Weber-Complete-Edition. For complete guidelines compare <ref target="http://weber-gesamtausgabe.de/de/Editionsrichtlinien">http://weber-gesamtausgabe.de/de/Editionsrichtlinien</ref>.
                        </p>
                    </editorialDecl>
                </encodingDesc>
            </teiHeader>
            <text>
                <body>
                    <ab></ab>
                </body>
            </text>
        </TEI>
    </xsl:variable>
    
    <xsl:variable name="personsWrapper" as="element()">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title level="s">WeGA, Personenbiogramme, Digitale Edition</title>
                        <title level='a'>Title</title>
                        <editor>Veit, Joachim</editor>
                        <editor>Stadler, Peter</editor>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>
                            <name>Carl-Maria-von-Weber-Gesamtausgabe</name>
                            <address>
                                <street>Hornsche Str. 39</street>
                                <postCode>32756</postCode>
                                <placeName>
                                    <country>D</country>
                                    <settlement>Detmold</settlement>
                                </placeName>
                            </address>
                        </publisher>
                        <availability>
                            <licence target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International (CC BY 4.0)</licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Born digital</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <listPerson>
                        <person></person>
                    </listPerson>
                </body>
            </text>
        </TEI>
    </xsl:variable>
    
    <xsl:variable name="orgsWrapper" as="element()">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title level="s">WeGA, Kurzbeschreibungen von Körperschaften, Digitale Edition</title>
                        <title level='a'>Title</title>
                        <editor>Veit, Joachim</editor>
                        <editor>Stadler, Peter</editor>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>
                            <name>Carl-Maria-von-Weber-Gesamtausgabe</name>
                            <address>
                                <street>Hornsche Str. 39</street>
                                <postCode>32756</postCode>
                                <placeName>
                                    <country>D</country>
                                    <settlement>Detmold</settlement>
                                </placeName>
                            </address>
                        </publisher>
                        <availability>
                            <licence target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International (CC BY 4.0)</licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Born digital</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <listOrg>
                        <org></org>
                    </listOrg>
                </body>
            </text>
        </TEI>
    </xsl:variable>
    
    <xsl:variable name="placesWrapper" as="element()">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title level="s">WeGA, Kurzbeschreibungen von Orten, Digitale Edition</title>
                        <title level='a'>Title</title>
                        <editor>Veit, Joachim</editor>
                        <editor>Stadler, Peter</editor>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>
                            <name>Carl-Maria-von-Weber-Gesamtausgabe</name>
                            <address>
                                <street>Hornsche Str. 39</street>
                                <postCode>32756</postCode>
                                <placeName>
                                    <country>D</country>
                                    <settlement>Detmold</settlement>
                                </placeName>
                            </address>
                        </publisher>
                        <availability>
                            <licence target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International (CC BY 4.0)</licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Born digital</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <listPlace>
                        <place></place>
                    </listPlace>
                </body>
            </text>
        </TEI>
    </xsl:variable>
    
    <xsl:variable name="duplicatesWrapper" as="element()">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title level="s">WeGA, Digitale Edition</title>
                        <title level='a'>Duplikat</title>
                        <editor>Veit, Joachim</editor>
                        <editor>Stadler, Peter</editor>
                    </titleStmt>
                    <publicationStmt>
                        <publisher>
                            <name>Carl-Maria-von-Weber-Gesamtausgabe</name>
                            <address>
                                <street>Hornsche Str. 39</street>
                                <postCode>32756</postCode>
                                <placeName>
                                    <country>D</country>
                                    <settlement>Detmold</settlement>
                                </placeName>
                            </address>
                        </publisher>
                        <availability>
                            <licence target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International (CC BY 4.0)</licence>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <p>born digital</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <p>Dies ist ein Duplikat!</p>
                </body>
            </text>
        </TEI>
    </xsl:variable>
    
    <xsl:variable name="tagsDecl" as="element()">
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
            <rendition xml:id="double-quotes-before" scheme="css" scope="before">content: '&quot;'</rendition>
            <rendition xml:id="double-quotes-after" scheme="css" scope="after">content: '&quot;'</rendition>
            <rendition xml:id="single-quotes-before" scheme="css" scope="before">content: "&apos;";</rendition>
            <rendition xml:id="single-quotes-after" scheme="css" scope="after">content: "&apos;";</rendition>
        </tagsDecl>
    </xsl:variable>
    
    <xsl:template match="node() | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="processing-instruction()" priority="1"/>
    
    <xsl:template match="workName" mode="#all">
        <xsl:element name="name">
            <xsl:attribute name="type">artificialWork</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="characterName" mode="#all">
        <xsl:element name="name">
            <xsl:attribute name="type">character</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="footNote" mode="#all">
        <xsl:element name="note">
            <xsl:attribute name="type">original</xsl:attribute>
            <xsl:attribute name="place">bottom</xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="
        q[ancestor::rs or ancestor::persName or ancestor::placeName or ancestor::settlement or ancestor::country or ancestor::region or ancestor::workName or ancestor::characterName] | 
        quote[ancestor::rs or ancestor::persName or ancestor::placeName or ancestor::settlement or ancestor::country or ancestor::region or ancestor::workName or ancestor::characterName]
        " mode="#all">
        <xsl:element name="hi">
            <xsl:choose>
                <xsl:when test="@rend"/>
                <xsl:otherwise>
                    <xsl:attribute name="rendition">#double-quotes-before #double-quotes-after</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="address[parent::div]" mode="#all">
        <xsl:element name="ab">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="date[parent::publicationStmt]">
        <xsl:element name="p">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ab[parent::document-node()]" mode="#default">
        <xsl:apply-templates select="$diariesWrapper" mode="diaries">
            <xsl:with-param name="curNode" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="person[parent::document-node()]" mode="#default">
        <xsl:apply-templates select="$personsWrapper" mode="persons">
            <xsl:with-param name="curNode" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="org[parent::document-node()]" mode="#default">
        <xsl:apply-templates select="$orgsWrapper" mode="orgs">
            <xsl:with-param name="curNode" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="place[parent::document-node()]" mode="#default">
        <xsl:apply-templates select="$placesWrapper" mode="places">
            <xsl:with-param name="curNode" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="biblStruct[parent::document-node()]" mode="#default">
        <xsl:choose>
            <xsl:when test="ref">
                <xsl:apply-templates select="$duplicatesWrapper"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$biblioWrapper" mode="biblio">
                    <xsl:with-param name="curNode" select="." tunnel="yes"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="document-node()">
        <xsl:call-template name="inject-schema-references">
            <xsl:with-param name="schema-URL">http://www.tei-c.org/Vault/P5/<xsl:value-of select="$current-tei-version"/>/xml/tei/custom/schema/relaxng/tei_all.rng</xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="TEI" mode="biblio diaries persons orgs places">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="$curNode/@xml:id"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="TEI[ref]" priority="10">
        <xsl:apply-templates select="$duplicatesWrapper"/>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="encodingDesc">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="node() except revisionDesc"/>
                    <xsl:element name="encodingDesc">
                        <xsl:apply-templates select="$tagsDecl"/>
                    </xsl:element>
                    <xsl:apply-templates select="revisionDesc"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="encodingDesc">
        <xsl:copy>
            <xsl:apply-templates/>
            <xsl:apply-templates select="$tagsDecl"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="title[@level='a']" mode="biblio diaries persons orgs places">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="@level" mode="#default"/>
            <xsl:choose>
                <xsl:when test="$curNode/self::ab">
                    <xsl:value-of select="concat('Tagebucheintrag vom ', format-date($curNode/@n cast as xs:date, '[D]. [MNn] [Y]', 'de', (), ()))"/>
                </xsl:when>
                <xsl:when test="$curNode/self::person">
                    <xsl:value-of select="concat('Personeneintrag für ', normalize-space($curNode//persName[@type='reg']))"/>
                </xsl:when>
                <xsl:when test="$curNode/self::org">
                    <xsl:value-of select="concat('Kurzbeschreibung für ', normalize-space($curNode//orgName[@type='reg']))"/>
                </xsl:when>
                <xsl:when test="$curNode/self::place">
                    <xsl:value-of select="concat('Kurzbeschreibung für ', normalize-space($curNode//placeName[@type='reg']))"/>
                </xsl:when>
                <xsl:when test="$curNode/self::biblStruct">
                    <xsl:value-of select="'Bibliographieeintrag'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ab" mode="diaries">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="$curNode/@n | $curNode/node()  except $curNode/ref" mode="#default"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="person" mode="persons">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="$curNode/node() except $curNode/ref" mode="#default"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="org" mode="orgs">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="$curNode/node() except $curNode/ref" mode="#default"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="place" mode="places">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="$curNode/node() except $curNode/ref" mode="#default"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="biblStruct" mode="biblio">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="$curNode/node() except $curNode/ref" mode="#default"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="list[parent::event]">
        <xsl:element name="p">
            <xsl:copy>
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="@rend">
        <xsl:choose>
            <xsl:when test="ends-with(., 'quotes')">
                <xsl:attribute name="rendition" select="concat('#',.,'-before #', ., '-after')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="rendition" select="concat('#',.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@key[matches(., 'A[A-F0-9]{6}')]" mode="#all">
        <xsl:attribute name="ref" select="replace(., '(A[A-F0-9]{6})', 'https://weber-gesamtausgabe.de/$1')"/>
    </xsl:template>
    
    <xsl:template match="@ref[matches(., 'wega:')]" mode="#all">
        <xsl:attribute name="ref" select="replace(., 'wega:', 'https://weber-gesamtausgabe.de/')"/>
    </xsl:template>
    
    <xsl:template match="@url" mode="#all">
        <xsl:attribute name="url">
            <xsl:choose>
                <xsl:when test="matches(., 'wega:')">
                    <xsl:value-of select="replace(., 'wega:', 'https://weber-gesamtausgabe.de/digilib/Scaler/IIIF/')"/>
                </xsl:when>
                <xsl:when test="starts-with(., 'http')"/>
                <xsl:otherwise>
                    <xsl:variable name="curID" select="root()/*/data(@xml:id)"/>
                    <xsl:variable name="docType" select="wega:docType($curID)"/>
                    <xsl:variable name="pathSegment" select="encode-for-uri(string-join(($docType, concat(substring($curID,1,5), 'xx'), $curID, .), '/'))"/>
                    <xsl:value-of select="concat('https://weber-gesamtausgabe.de/digilib/Scaler/IIIF/', $pathSegment, '/full/,600/0/native.jpg')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@notInvolved" mode="#all"/>
    <xsl:template match="keywords[parent::biblStruct]" mode="#all"/>
    
    <xsl:template name="inject-schema-references">
        <xsl:param name="schema-URL" as="xs:string"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:processing-instruction name="xml-model">href="<xsl:value-of select="$schema-URL"/>" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
        <xsl:text>&#10;</xsl:text>
        <xsl:processing-instruction name="xml-model">href="<xsl:value-of select="$schema-URL"/>" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:function name="wega:docType" as="xs:string?">
        <xsl:param name="id" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="matches($id, 'A00[A-F0-9]{4}')">persons</xsl:when>
            <xsl:when test="matches($id, 'A02\d{4}')">works</xsl:when>
            <xsl:when test="matches($id, 'A03\d{4}')">writings</xsl:when>
            <xsl:when test="matches($id, 'A04\d{4}')">letters</xsl:when>
            <xsl:when test="matches($id, 'A05\d{4}')">news</xsl:when>
            <xsl:when test="matches($id, 'A06\d{4}')">diaries</xsl:when>
            <xsl:when test="matches($id, 'A07\d{4}')">var</xsl:when>
            <xsl:when test="matches($id, 'A08\d{4}')">orgs</xsl:when>
            <xsl:when test="matches($id, 'A09\d{4}')">thematicCommentaries</xsl:when>
            <xsl:when test="matches($id, 'A10\d{4}')">documents</xsl:when>
            <xsl:when test="matches($id, 'A11\d{4}')">biblio</xsl:when>
            <xsl:when test="matches($id, 'A13\d{4}')">places</xsl:when>
            <xsl:when test="matches($id, 'A22\d{4}')">sources</xsl:when>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>