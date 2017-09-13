<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output media-type="application/tei+xml" encoding="UTF-8" indent="no" method="xml"/>
    <xsl:preserve-space elements="*"/>
    
    <xsl:variable name="biblioWrapper">
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
    
    <xsl:variable name="diariesWrapper">
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
    
    <xsl:variable name="personsWrapper">
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
    
    <xsl:variable name="orgsWrapper">
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
    
    <xsl:variable name="placesWrapper">
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
    
    <xsl:variable name="duplicatesWrapper">
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
    
    <xsl:template match="node() | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="processing-instruction()" priority="1"/>
    
    <xsl:template match="workName" mode="#all">
        <xsl:element name="name">
            <xsl:attribute name="type">work</xsl:attribute>
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
                    <xsl:attribute name="rendition">#double-quotes</xsl:attribute>
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
    
    <xsl:template match="TEI" mode="biblio diaries persons orgs places">
        <xsl:param name="curNode" tunnel="yes"/>
        <xsl:copy>
            <xsl:apply-templates select="$curNode/@xml:id"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="TEI[ref]">
        <xsl:apply-templates select="$duplicatesWrapper"/>
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
        <xsl:attribute name="rendition" select="concat('#',.)"/>
    </xsl:template>
    
    <xsl:template match="@key[matches(., 'A[A-F0-9]{6}')]" mode="#all">
        <xsl:attribute name="ref" select="replace(., '(A[A-F0-9]{6})', 'https://weber-gesamtausgabe.de/$1')"/>
    </xsl:template>
    
    <xsl:template match="@ref[matches(., 'wega:')]" mode="#all">
        <xsl:attribute name="ref" select="replace(., 'wega:', 'https://weber-gesamtausgabe.de/')"/>
    </xsl:template>
    
    <xsl:template match="@notInvolved" mode="#all"/>
    <xsl:template match="keywords[parent::biblStruct]" mode="#all"/>
        
</xsl:stylesheet>