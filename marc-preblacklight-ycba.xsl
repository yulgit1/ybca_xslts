<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs" version="1.0"
    xmlns:marc="http://www.loc.gov/MARC21/slim" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dc="http://purl.org/dc/elements/1.1/">

    <xd:doc scope="stylesheet" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
        <xd:desc>
            <xd:p><xd:b>Last updated on:</xd:b> Feb 27, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> yn47</xd:p>
            <xd:p>MARCXML to VuFind Solr Fields</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output encoding="UTF-8" indent="yes" method="xml" omit-xml-declaration="no" version="1.0"/>

    <xsl:strip-space elements="*"/>

    <!-- parameters set by user -->
    <xsl:param name="repository"/>
    <xsl:param name="set"/>

    <!-- variables set by user -->
    <xsl:variable name="url">http://hdl.handle.net/10079/bibid/</xsl:variable>


    <xsl:template match="marc:record">
        <xsl:element name="metadata">
            <xsl:call-template name="institution">
                <xsl:with-param name="repository" select="$repository"/>
            </xsl:call-template>
            <xsl:call-template name="collection_ss">
                <xsl:with-param name="set" select="$set"/>
            </xsl:call-template>
            <xsl:call-template name="language"/>
            <xsl:call-template name="language_note"/>
            <xsl:call-template name="type"/>
            <xsl:call-template name="author"/>
            <!-- includes author, auth_author -->
            <xsl:call-template name="title"/>
            <!-- includes title, title_sort, title_short, title_full -->
            <xsl:call-template name="physical"/>
            <xsl:call-template name="publisher"/>
            <xsl:call-template name="publishDate"/>
            <xsl:call-template name="edition"/>
            <xsl:call-template name="description"/>
            <xsl:call-template name="contents"/>
            <xsl:call-template name="rights"/>
            <xsl:call-template name="citation"/>
            <xsl:call-template name="resource"/>
            <xsl:call-template name="access"/>
            <xsl:call-template name="url"/>
            <xsl:call-template name="resourceURL"/>
            <xsl:call-template name="callnumber"/>
            <xsl:call-template name="author_additional"/>
            <xsl:call-template name="title_alt"/>
            <xsl:call-template name="sortDate"/>
            <!-- includes earliestDate, latestDate -->
            <xsl:call-template name="topic"/>
            <xsl:call-template name="genre"/>
            <xsl:call-template name="geographic"/>
            <xsl:call-template name="era"/>
        </xsl:element>
    </xsl:template>


    <xsl:template name="institution">
        <xsl:param name="repository"/>
        <xsl:element name="institution_ss">
            <xsl:choose>
                <xsl:when test="$repository='OrbisMAPS' or $repository='OrbisManuscripts'">
                    <xsl:text>Yale University Library</xsl:text>
                </xsl:when>
                <xsl:when test="$repository='OrbisYCBA'">
                    <xsl:text>Yale Center for British Art</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xsl:template name="collection_ss">
        <xsl:param name="set"/>
        <xsl:choose>
            <xsl:when test="starts-with($set,'bacrb')">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Rare Books and Manuscripts</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="starts-with($set,'bacref')">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Reference Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <!-- 
                <xsl:when test="$set='lwlprsat'">
                <xsl:element name="collection_ss">
                
                
                
                <xsl:text>Lewis Walpole Library Prints and Drawings</xsl:text>
                </xsl:element>
                </xsl:when>
            -->
            <xsl:when test="$set='smlmap' or $set='smlmapl'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Sterling Memorial Library Map collection_ss</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='bassill'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccl'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccl2wkr'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccl3day'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclaud'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclaudio'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclbind'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclborr'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclcd'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclclicker'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclclos'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccldvd'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclec'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccletextcd'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclger'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclgraph'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclhr2'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclhr24'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccllibn'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclmtn'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclnew'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclop'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclpoor'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclpres'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclra1'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclref'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclrefa'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclsoft'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccltran'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ccltravel'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclvd'">
                <xsl:element name="collection_ss_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclvid'">
                <xsl:element name="collection_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cclyccdvd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Bass Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='beingen'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='beinosb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='beinref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='beinsref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='beinwa'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='beinycal'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='beinycgl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfbeiar'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfbeigr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfbeior'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfbeir'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfbeiwr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Beinecke Rare Book and Manuscript Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ast'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='astref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='chem'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='chemref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='chemwkst'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='cowl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fes'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fesborr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fesfol'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fesfsc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='feshist'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='feshr2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='feshr24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='feshr3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fesmic'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fesover'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fesper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='fesref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='festhe'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='gdcsslr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geodsk'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geofol'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geogis'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geohr2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geomap'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geomic'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geonbs'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geononc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geoper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geoperm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='georbc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='georbr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='georef'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geores'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='georrr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geothe'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='geots'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ksl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslabs'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslannex'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslant'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslantc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslantm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslanto'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslantp'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslantr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslborr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslcage'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslclb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslclp'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslfolio'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslherb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslkoff'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslloff'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslnew'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslop'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslopen'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslperm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslpers'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslrec'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslrefa'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslrefd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslrefj'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslrefo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslroff'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslstks'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ksltoff'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslvid'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfche'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfchem'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfcher'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsffes'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsffesr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsffor'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfforr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfgdc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfgeo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfgeor'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfksl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfkslant'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfkslr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfssl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsslc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsslr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfstat'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='orn'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ornref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ssl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ssl3day'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslcd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslclr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ssldar'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslegc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslegcr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslgdcr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslhr24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslmic1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslP2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslp2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslp24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslpam1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslpam2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslref5'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslref6'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslrefs'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslrop'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ssltec'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sslvid'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='stat'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='statper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='statref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Center for Science and Social Science Information</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='eph'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephcens'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephcirc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephhist'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephhr24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephnchs'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephres3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ephsref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfeph'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfephr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmed'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmedr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='med'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='med3day'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medcat'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medcirc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medcird'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medcres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medhper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medhr24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medhr4'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medhrf'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medhs'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medhsl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medhslmini'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medill'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medjres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medmic'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mednref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mednres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medrefchc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medrefec'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medrefeol'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medrefrc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medsref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medtcc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medthes'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medts'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='medwk1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mesjres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='rad'">
                <xsl:element name="collection_ss">
                    <xsl:text>Cushing/Whitney Medical Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='div'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='div3day'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divannx'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divborr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divbss'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divcd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divdmr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divdmrref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='diveast'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divhr24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divlo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divmrc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divmrclc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divmrr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divmrv'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divrc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divrlo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divrr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divrrus'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divrsno'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divspc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divsr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divts'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='divwk1r'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfdiv'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfdivr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Divinity Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engn'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnborr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnhr24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnlo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnnonc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnperm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnrep'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='engnres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfeng'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfengr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Engineering Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='art'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artbas3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artbirr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artcr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artgal'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artlck1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artlck2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artlo1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artlo2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artmicl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artop'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artor'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artrefb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artrefc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artrefi'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artspc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artspr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artsps'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artsty1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artsty2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artts'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artunca'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artuncd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='artunci'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='clas'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='dra'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='draat'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drabbx'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='dracr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drafoll'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drafolo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='dragpb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drahclc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='dranbs'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='draod'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='draor'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='draperc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drar'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drarefl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drarefo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drascrc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='draspc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='drathe'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfaobr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfart'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfartr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfartrr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfcla'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfclar'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfdra'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfdrar'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfdrarr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfvrcr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='vrcspc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Haas Arts Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lwl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Lewis Walpole Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lwlint'">
                <xsl:element name="collection_ss">
                    <xsl:text>Lewis Walpole Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lwlprsat'">
                <xsl:element name="collection_ss">
                    <xsl:text>Lewis Walpole Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lwlref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Lewis Walpole Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfgdcr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Manuscripts and Archives </xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmssr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Manuscripts and Archives </xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfnum'">
                <xsl:element name="collection_ss">
                    <xsl:text>Manuscripts and Archives </xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfnumr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Manuscripts and Archives </xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Manuscripts and Archives </xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmath'">
                <xsl:element name="collection_ss">
                    <xsl:text>Math Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='math'">
                <xsl:element name="collection_ss">
                    <xsl:text>Math Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mathannex'">
                <xsl:element name="collection_ss">
                    <xsl:text>Math Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mathper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Math Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mathref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Math Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmus'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmusr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mus'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muscar'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muscirc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mushsr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musmic'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musoff1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musoff2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musoff3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musohm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musrar1'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musrar2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musrec'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='musres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muszzz'">
                <xsl:element name="collection_ss">
                    <xsl:text>Music Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='kslmic'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsf'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfbaby'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfjud'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsflamc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmap'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfmapr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfnea'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsmlaris'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsmlasi'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsmlasir'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsmlear'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsmlmicr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsfsmlphi'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='lsftib'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mudd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddart'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddauct'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddb24'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddb68'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddb69'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddbig2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddbig3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddbsmt'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddchem'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddclsd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mudddiv'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mudddivr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddegcm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddengn'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddengp'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddennc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddfes'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdc3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdcb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdcd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdce'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdci'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdcm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdco'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdcr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdcw'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgdsr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddgeo'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddksl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddlamc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddlaw'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddlnb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddlock'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddmaps'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddmath'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddmed'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddmus'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddnasa'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddnew2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddnew3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddnews'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddnum'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddpr18'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddpres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mudds2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='mudds3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddssl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddsslm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddtib'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='muddzeta'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='sml'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlafr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlamst'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smland'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlaob'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlaris'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlasi'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlasi2'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlasi3'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlbab'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlbib'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlbind'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlbldg'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlcat'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlcatr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlcd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlchir'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlcoff'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlcon'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smldesk'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smldskn'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlear'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smleasc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smleaso'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlegypt'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlfra'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlgen'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlhtxt'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlill'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smljpnr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smljud'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smljudr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlkorr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smllamc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smllnb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smllnbm'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smllnbt'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmap'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmapa'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmapb'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmapg'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmapl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmapr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmapu'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmic'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmicr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmlc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlmss'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlnea'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlneg'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlnegd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlnews'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlnonc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlnum'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlop'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlparl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlper'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlphi'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlpres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlref'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlrefa'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlrefd'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlrefh'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlrefi'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlrefl'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlres'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlrfof'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlrstr'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlsea'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlsem'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlser'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlsin'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlsla'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlslam'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlslar'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlsub'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlsyst'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smly'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlyal'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlyalc'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlyalt'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='smlzeta'">
                <xsl:element name="collection_ss">
                    <xsl:text>Sterling Memorial Library</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='yul'">
                <xsl:element name="collection_ss">
                    <xsl:text>Yale University Library</xsl:text>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="language">
        <xsl:element name="language_ss">
            <xsl:variable name="code" select="substring(marc:controlfield[@tag='008'],36,3)"/>
            <xsl:variable name="lang"
                select="document('languages.xml')//*[local-name()='language'][*[local-name()='code']=$code]/*[local-name()='name']"/>
            <xsl:value-of select="$lang"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="language_note">
        <xsl:for-each select="marc:datafield[@tag='546']">
            <xsl:element name="language_note_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="type">
        <xsl:element name="type_ss">
            <xsl:for-each select="marc:leader">
                <xsl:variable name="type" select="substring(.,7,1)"/>
                <xsl:choose>
                    <xsl:when test="$type='a'">
                        <xsl:text>Books &amp; serials</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='c'">
                        <xsl:text>Music (printed)</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='d'">
                        <xsl:text>Music (manuscript)</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='e'">
                        <xsl:text>Maps &amp; atlases (printed)</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='f'">
                        <xsl:text>Maps &amp; atlases (manuscript)</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='g'">
                        <xsl:text>Slides &amp; video</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='i'">
                        <xsl:text>Nonmusical sound recordings</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='j'">
                        <xsl:text>Musical sound recordings</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='k'">
                        <xsl:text>Visual material</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='m'">
                        <xsl:text>Computer files</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='o'">
                        <xsl:text>Kit</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='p'">
                        <xsl:text>Archives &amp; manuscripts</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='r'">
                        <xsl:text>Three-dimensional artifacts</xsl:text>
                    </xsl:when>
                    <xsl:when test="$type='t'">
                        <xsl:text>Archives &amp; manuscripts</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template name="author">
        <xsl:choose>
            <xsl:when
                test="marc:datafield[@tag='100']|marc:datafield[@tag='110']|marc:datafield[@tag='111']">
                <xsl:for-each
                    select="marc:datafield[@tag='100']|marc:datafield[@tag='110']|marc:datafield[@tag='111']">
                    <xsl:element name="author_ss">
                        <xsl:for-each select="marc:subfield[@code!='0']">
                            <xsl:value-of select="normalize-space(.)"/>
                            <xsl:if test="following-sibling::marc:subfield">
                                <xsl:text> </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="marc:datafield[@tag='245']/marc:subfield[@code='c']">
                <xsl:element name="author_ss">
                    <xsl:value-of
                        select="normalize-space(marc:datafield[@tag='245']/marc:subfield[@code='c'])"
                    />
                </xsl:element>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each
            select="marc:datafield[@tag='100']|marc:datafield[@tag='110']|marc:datafield[@tag='111']">
            <xsl:element name="auth_author_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="title">
        <xsl:variable name="codes">abcfghknps</xsl:variable>
        <xsl:for-each select="marc:datafield[@tag='245']">
            <xsl:element name="title_ss">
                <xsl:for-each select="marc:subfield[contains($codes,@code)]">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield[contains($codes,@code)]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:element name="title_sort_ss">
                <xsl:variable name="nonfiling" select="number(@ind2)"/>
                <xsl:for-each select="marc:subfield[contains($codes,@code)]">
                    <xsl:choose>
                        <xsl:when test="@code='a'">
                            <xsl:value-of select="substring(normalize-space(.),$nonfiling+1)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="following-sibling::marc:subfield[contains($codes,@code)]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
            <xsl:element name="title_short_ss">
                <xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
            </xsl:element>
            <xsl:element name="title_full_ss">
                <xsl:for-each select="marc:subfield[contains($codes,@code)]">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield[contains($codes,@code)]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="physical">
        <xsl:for-each select="marc:datafield[@tag='300']">
            <xsl:element name="physical_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="publisher">
        <xsl:for-each select="marc:datafield[@tag='260']/marc:subfield[@code='a']">
            <xsl:element name="publisher_ss">
                <xsl:value-of select="normalize-space(.)"/>
                <xsl:if test="following-sibling::marc:subfield[@code='b'][position()=1]">
                    <xsl:text> </xsl:text>
                    <xsl:value-of
                        select="normalize-space(following-sibling::marc:subfield[@code='b'][position()=1])"
                    />
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="publishDate">
        <xsl:for-each select="marc:datafield[@tag='260']/marc:subfield[@code='c']">
            <xsl:element name="publishDate_ss">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="edition">
        <xsl:for-each select="marc:datafield[@tag='250']">
            <xsl:element name="edition_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="description">
        <xsl:variable name="exceptions">505 506 524 540 546</xsl:variable>
        <!-- 505: see contents template -->
        <!-- 506, 540: see rights template -->
        <!-- 524: see citation template -->
        <!-- 546: see language template -->
        <xsl:for-each
            select="marc:datafield[starts-with(@tag,'5')][not(contains($exceptions,@tag))]">
            <xsl:element name="description_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="contents">
        <xsl:for-each select="marc:datafield[@tag='505']">
            <xsl:element name="contents_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="rights">
        <xsl:for-each select="marc:datafield[@tag='506']|marc:datafield[@tag='540']">
            <xsl:element name="rights_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="citation">
        <xsl:for-each select="marc:datafield[@tag='524']">
            <xsl:element name="citation_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="resource">
        <xsl:element name="resource_ss">
            <xsl:choose>
                <xsl:when test="marc:datafield[@tag='856']/@ind2!=2">
                    <xsl:text>Resource available online</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Resource not available online</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xsl:template name="access">
    <!-- access difficult to predict and no longer used for faceting 2012-02-27 yn
        <xsl:variable name="urls">
        <xsl:for-each select="marc:datafield[@tag='856']">
        <xsl:value-of select="marc:subfield[@code='u']"/>
        </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="access">
        <xsl:choose>
        <xsl:when test="$repository='OrbisMAPS'">
        <xsl:choose>
        <xsl:when test="contains($urls,'yale.edu')">
        <xsl:text>Restricted access</xsl:text>
        </xsl:when>
        <xsl:otherwise>
        <xsl:text>Open access</xsl:text>
        </xsl:otherwise>
        </xsl:choose>
        </xsl:when>
        <xsl:when test="$repository='OrbisYCBA'">
        <xsl:text>Open access</xsl:text>
        </xsl:when>
        </xsl:choose>
        </xsl:variable>
        <xsl:if test="$repository='OrbisLWL' or marc:datafield[@tag='856']">
        <xsl:element name="access">
        
        
        
        <xsl:value-of select="$access"/>
        </xsl:element>
        </xsl:if> -->
    </xsl:template>

    <xsl:template name="url">
        <xsl:element name="url_ss">
            <xsl:value-of select="concat($url,marc:controlfield[@tag='001'])"/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="resourceURL">
        <xsl:for-each select="marc:datafield[@tag='856']">
            <xsl:element name="resourceURL_ss">
                <xsl:element name="caption_ss">
                    <xsl:choose>
                        <xsl:when test="marc:subfield[@code='y']">
                            <xsl:value-of select="normalize-space(marc:subfield[@code='y'])"/>
                        </xsl:when>
                        <xsl:when test="marc:subfield[@code='3']">
                            <xsl:value-of select="normalize-space(marc:subfield[@code='3'])"/>
                        </xsl:when>
                        <xsl:when test="marc:subfield[@code='z']">
                            <xsl:value-of select="normalize-space(marc:subfield[@code='z'])"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:element>
                <xsl:element name="url_ss">
                    <xsl:value-of select="normalize-space(marc:subfield[@code='u'])"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="callnumber">
    	<xsl:variable name="bibID">
           		<xsl:value-of select="marc:controlfield[@tag='001']" />
           </xsl:variable>                                                
           <xsl:variable name="fullURL">
                <xsl:value-of select="concat('https://libapp.library.yale.edu/OAI_BAC/src/OAIOrbisTool.jsp?verb=GetRecord&amp;identifier=oai:orbis.library.yale.edu:',$bibID,'&amp;metadataPrefix=oai_dc')" />
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$repository='OrbisManuscripts'">
                <!-- call number to be integrated from Dublin Core -->
            </xsl:when>
            <xsl:when test="$repository='OrbisMAPS'">
                <!-- call number to be integrated from Dublin Core -->
            </xsl:when>
            <xsl:when test="$repository='OrbisYCBA'">
                   <xsl:for-each select="document($fullURL)//dc:subject[contains(.,'CALL NUMBER')]">              
                      	<xsl:element name="callnumber_ss">
                            <xsl:value-of select="substring(., 13)"/>
                            <!--KFW100.A75 S45 1997-->
                   		</xsl:element>		
           			</xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="author_additional">
        <xsl:for-each
            select="marc:datafield[@tag='700']|marc:datafield[@tag='710']|marc:datafield[@tag='711']|marc:datafield[@tag='720']">
            <xsl:element name="author_additional_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="title_alt">
        <xsl:for-each select="marc:datafield[@tag='246']">
            <xsl:element name="title_alt_ss">
                <xsl:for-each select="marc:subfield[@code!='0']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="sortDate">
        <xsl:for-each select="marc:controlfield[@tag='008']">
            <xsl:variable name="type" select="substring(marc:controlfield[@tag='008'],7,1)"/>
            <xsl:variable name="date1" select="normalize-space(substring(.,8,4))"/>
            <xsl:variable name="date2" select="normalize-space(substring(.,12,4))"/>
            <xsl:variable name="dateRangeType">cdikm</xsl:variable>
            <xsl:variable name="date1Type">epqs</xsl:variable>
            <xsl:variable name="date2Type">rt</xsl:variable>
            <xsl:element name="earliestDate_ss">
                <xsl:choose>
                    <xsl:when test="contains($dateRangeType,$type)">
                        <xsl:value-of select="$date1"/>
                    </xsl:when>
                    <xsl:when test="contains($date1Type,$type)">
                        <xsl:value-of select="$date1"/>
                    </xsl:when>
                    <xsl:when test="contains($date2Type,$type)">
                        <xsl:choose>
                            <xsl:when test="string-length($date2)>0">
                                <xsl:value-of select="$date2"/>
                            </xsl:when>
                            <xsl:when test="string-length($date1)>0">
                                <xsl:value-of select="$date1"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
            <xsl:element name="latestDate_ss">
                <xsl:choose>
                    <xsl:when test="contains($dateRangeType,$type)">
                        <xsl:value-of select="$date2"/>
                    </xsl:when>
                    <xsl:when test="contains($date2Type,$type)">
                        <xsl:choose>
                            <xsl:when test="string-length($date1)>0">
                                <xsl:value-of select="$date1"/>
                            </xsl:when>
                            <xsl:when test="string-length($date2)>0">
                                <xsl:value-of select="$date2"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="topic">
        <xsl:variable name="tags">600 610 611 630 650 651 653 690 692 693</xsl:variable>
        <xsl:variable name="codes">abcdefghijklmnopqrstuvwxyz</xsl:variable>
        <xsl:variable name="codes_space">abcdefghijklmnopqrstuw</xsl:variable>
        <xsl:variable name="codes_dash">vxyz</xsl:variable>
        <xsl:for-each select="marc:datafield[contains($tags,@tag)]">
            <xsl:element name="topic_ss">
                <xsl:for-each select="marc:subfield[contains($codes,@code)]">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield[position()=1][contains($codes_dash,@code)]">
                        <xsl:text> -- </xsl:text>
                    </xsl:if>
                    <xsl:if test="following-sibling::marc:subfield[position()=1][contains($codes_space,@code)]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="genre">
        <xsl:variable name="codes">abvxyz</xsl:variable>
        <xsl:for-each select="marc:datafield[@tag='655']">
            <xsl:element name="genre_ss">
                <xsl:for-each select="marc:subfield[contains($codes,@code)]">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:if test="following-sibling::marc:subfield[contains($codes,@code)]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="geographic">
        <xsl:variable name="tags">600 610 611 630 650 651 653 655 690 692 693</xsl:variable>
        <xsl:variable name="codes">az</xsl:variable>
        <xsl:choose>
            <xsl:when test="marc:datafield[@tag='651']|marc:datafield[@tag='691']">
                <xsl:for-each select="marc:datafield[@tag='651']|marc:datafield[@tag='691']">
                    <xsl:element name="geographic_ss">
                        <xsl:for-each select="marc:subfield[contains($codes,@code)]">
                            <xsl:value-of select="normalize-space(.)"/>
                            <xsl:if test="following-sibling::marc:subfield[contains($codes,@code)]">
                                <xsl:text> </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each
                    select="marc:datafield[contains($tags,@tag)][child::marc:subfield[@code='z']][1]">
                    <xsl:for-each select="marc:subfield[@code='z']">
                        <xsl:element name="geographic_ss">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="era">
        <xsl:variable name="tags">600 610 611 630 650 651 653 655 690 692 693</xsl:variable>
        <xsl:variable name="codes">ay</xsl:variable>
        <xsl:choose>
            <xsl:when test="marc:datafield[@tag='648']">
                <xsl:for-each select="marc:datafield[@tag='648']">
                    <xsl:element name="era_ss">
                        <xsl:for-each select="marc:subfield[contains($codes,@code)]">
                            <xsl:value-of select="normalize-space(.)"/>
                            <xsl:if test="following-sibling::marc:subfield[contains($codes,@code)]">
                                <xsl:text> </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each
                    select="marc:datafield[contains($tags,@tag)][child::marc:subfield[@code='y']][1]">
                    <xsl:for-each select="marc:subfield[@code='y']">
                        <xsl:element name="era_ss">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
