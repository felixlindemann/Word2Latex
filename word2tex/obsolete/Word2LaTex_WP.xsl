<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML Studio Designer Edition 9.1.11.3570 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    <xsl:import href="Word2LatexShortCuts.xsl" /> 
    <xsl:import href="Word2LaTexGetItemize.xsl" />
    <xsl:template name="getStyle">
        <xsl:param name="p" />
        <!-- Decide, if...  -->
        <xsl:variable name="styleId" select="$p/w:pPr/w:pStyle/@w:val" />
        <xsl:variable name="styleElement" select="key('k_style',$styleId)" />
        <xsl:variable name="styleElementWordTag" select="$styleElement/w:name/@w:val" />
        <xsl:variable name="dicItem" select=" document('word2LaTexDictionary.xml')/LatexDictionary/paragraphs/item[@word=$styleElementWordTag]" />
        <xsl:choose>
            <xsl:when test="$styleElement/@w:type='paragraph'">
                <xsl:choose>
                    <xsl:when test="$styleElementWordTag = 'WMVG Titel'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'Titel-main'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'Authors'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'Addresses'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'caption'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'toc 1'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'toc 2'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'toc 3'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'Citavi Bibliography Entry'"></xsl:when>
                    <xsl:when test="$styleElementWordTag = 'footnote text'">
                        <xsl:apply-templates select="$p/*" />
                        <xsl:if test="count($p/following-sibling::w:p)>0">
                            <xsl:text>~\\</xsl:text>
                        </xsl:if>
                    </xsl:when> 
                    <xsl:when test="$styleElementWordTag = 'annotation text'">
                        <xsl:apply-templates select="$p/*" />
                        <xsl:if test="count($p/following-sibling::w:p)>0">
                            <xsl:text>~\\</xsl:text>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$dicItem/@template='section'">
                        <xsl:value-of select="$nl" /> 
                        <xsl:call-template name="getsection">
                            <xsl:with-param name="p" select="$p" />
                            <xsl:with-param name="dicItem" select="$dicItem" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$dicItem/@template='itemize'">
                        <xsl:call-template name="getitemize">
                            <xsl:with-param name="p" select="$p" />
                            <xsl:with-param name="dicItem" select="$dicItem" />
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="NotFoundElemt" select="fn:concat('template getStyle: ',$styleElementWordTag , ' Folgendes Element konnte nicht zugeordnet werden: ')" />
                        <xsl:call-template name="debugElemet">
                            <xsl:with-param name="elem" select="$styleElement" />
                            <xsl:with-param name="name" select="$NotFoundElemt" />
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!--
            <xsl:when test="$styleElement/@w:type='character'"></xsl:when>
            <xsl:when test="$styleElement/@w:type='numbering'"></xsl:when>
            <xsl:when test="$styleElement/@w:type='table'"></xsl:when>
            -->
            <xsl:otherwise>
                <xsl:call-template name="debugElemet">
                    <xsl:with-param name="elem" select="$styleElement" />
                    <xsl:with-param name="name" select="'template getStyle: Folgendes Element konnte nicht zugeordnet werden:'" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getsection">
        <xsl:param name="p" />
        <xsl:param name="dicItem" />
        <xsl:value-of select="$nl" />
        <xsl:text>% </xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\</xsl:text>
        <xsl:value-of select="$dicItem/@latex" />
        <xsl:text>{</xsl:text>
        <xsl:apply-templates select="$p/w:r" />
        <xsl:text>}</xsl:text>
        
        <xsl:apply-templates select="$p/w:bookmarkStart"/>
        <xsl:value-of select="$nl" />
    </xsl:template>
   
</xsl:stylesheet>
