<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML Studio Designer Edition 9.1.11.3570 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml"  xmlns:functx="http://www.functx.com" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:rel="http://schemas.openxmlformats.org/package/2006/relationships" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    
    <xsl:import href="fn-extensions.xsl" />
    
    <xsl:key name="k_style" match="/pkg:package/pkg:part[@pkg:name='/word/styles.xml']/pkg:xmlData/w:styles/w:style" use="@w:styleId" />
    <xsl:variable name="trans" select="document('word2LaTexDictionary.xml')/LatexDictionary/zeichen" />
    <xsl:variable name="debugMode" select="boolean('true')" as="xs:boolean" />
    <xsl:variable name='nl'>
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>
    <xsl:variable name="RegExFlag" select="'m'" />
    <xsl:template name="ReplaceCitesAndChars">
        <!--<xsl:variable name="replacedcites">
            <xsl:call-template name="ReplaceCites">
                <xsl:with-param name="t" select="." />
            </xsl:call-template>
        </xsl:variable>-->
        <xsl:variable name="CorrectedChars">
            <xsl:call-template name="ReplaceChars">
                <xsl:with-param name="t" select="." />
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$CorrectedChars" />
    </xsl:template>
    <xsl:template name="ReplaceCites">
        <xsl:param name="t" />
        <xsl:param name="i" select="1" as="xs:integer" />
        <xsl:variable name="t1">
            <xsl:choose>
                <xsl:when test="$i = 1">
                    <!-- Citeauthor {Ben-Akiva 2000 #325 /persononly /nopar} wird zu \\citeauthor{bib.325} -->
                    <xsl:variable name="pattern" select="'(\{[^\}\{&quot;]*?\s*?#(\d+)\s*?/persononly\s*?(/nopar)*?\s*?\}.?)'" />
                    <xsl:variable name="replace" select="' \\citeauthor{bib.$2} '" />
                    <xsl:value-of select="functx:replace-multi($t, $pattern, $replace )" />
                </xsl:when>
                <xsl:when test="$i = 2">
                    <!-- reine Zitate {Maier 1990 #103: 2} wird zu \\autocites[][2]{bib.103} -->
                    <xsl:variable name="pattern" select="'(\{[^\}\{&quot;]*?\s*?#(\d+):\s([^\}\{&quot;]*?)\s*?(/nopar)?\s*?\}\.?)'" />
                    <xsl:variable name="replace" select="' \\autocites[][$4]{bib.$2}'" />
                    <xsl:value-of select="functx:replace-multi($t, $pattern, $replace)" />
                </xsl:when>
                <xsl:when test="$i = 3">
                    <!-- reine Zitate {Maier 1990 #103: 2} wird zu \\autocites[][2]{bib.103} -->
                    <xsl:variable name="pattern" select="'((\{[^\}\{&quot;]*?\s*?#)(\d+):\s([^\}\{&quot;]*?)\s*?(/nopar)?\s*?\}\.)'" />
                    <xsl:variable name="replace" select="' \\autocites[][$4]{bib.$3}.'" />
                    <xsl:value-of select="functx:replace-multi($t, $pattern, $replace)" />
                </xsl:when>
                <xsl:when test="$i = 4">
                    <!-- reine Zitate {"vgl. für folgende Aufzählung " Friedrich 2003 #403: 249f.} 
                            wird zu \autocites[vgl. für folgende Aufzählung][249f.]{bib.403}:  -->
                    <xsl:variable name="pattern" select="'(\{&quot;\s*?([^\{\}&quot;]*?)\s*?&quot;\s*?[^\{\}&quot;]*?\s#(\d+):\s([^\}\{&quot;]*?)\s*?(/nopar)?\s*?\})'" />
                    <xsl:variable name="replace" select="' \\autocites[$2][$4]{bib.$3}'" />
                    <xsl:value-of select="functx:replace-multi($t, $pattern, $replace)" />
                </xsl:when>
               <!-- <xsl:when test="$i = 3">
                    <xsl:variable name="pattern" select="''" />
                    <xsl:variable name="replace" select="''" />
                    <xsl:value-of select="fn:replace($t, $pattern, $replace,$RegExFlag)" />
                (\{("(.*)")?[^\}\{"]*?\s*?#(\d+)\s*?"(.*)"(.*?)(\s*/nopar)?\s*?\})
                </xsl:when>-->
                <xsl:otherwise>
                    <xsl:value-of select="'0'" />
				</xsl:otherwise> 
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$t1 = '0'">
                <xsl:value-of select="$t" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="ReplaceCites">
                    <xsl:with-param name="t" select="$t1" />
                    <xsl:with-param name="i" select="$i + 1" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ReplaceChars">
        <xsl:param name="t" />
        <xsl:param name="i" select="1" as="xs:integer" />
        <xsl:variable name="item" select="$trans/item[$i]" />
        <xsl:choose>
            <xsl:when test="$item">
                <xsl:variable name="t1" select="fn:replace($t, $item/@word, $item/@latex)" />
                <xsl:call-template name="ReplaceChars">
                    <xsl:with-param name="t" select="$t1" />
                    <xsl:with-param name="i" select="$i + 1" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$t" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="Beginfloat">
        <xsl:param name="float" select="'float'" />
        <xsl:value-of select="$nl" />
        <xsl:text>\begin{</xsl:text>
        <xsl:value-of select="$float" />
        <xsl:text>}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>%</xsl:text>
    </xsl:template>
    <xsl:template name="Endfloat">
        <xsl:param name="float" select="'float'" />
        <xsl:param name="count" select="1" as="xs:double" />
        <!--  <xsl:choose>
            <xsl:when test="not($count &gt; 0)">
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$nl" />
                <xsl:text>%</xsl:text>
                <xsl:value-of select="$nl" />
                <xsl:text>\end{</xsl:text>
                <xsl:value-of select="$float" />
                <xsl:text>}</xsl:text>
                <xsl:value-of select="$nl" />
            </xsl:otherwise>
        </xsl:choose>-->
        <xsl:if test="fn:abs($count) &gt;= 1">
            <xsl:value-of select="$nl" />
            <xsl:text>%</xsl:text>
            <xsl:value-of select="$nl" />
            <xsl:text>\end{</xsl:text>
            <xsl:value-of select="$float" />
            <xsl:text>}</xsl:text>
            <xsl:value-of select="$nl" />
        </xsl:if>
        <xsl:if test="fn:abs($count) &gt; 1">
            <xsl:call-template name="Endfloat">
                <xsl:with-param name="float" select="'itemize'" />
                <xsl:with-param name="count" select="$count -1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template name="indendet">
        <xsl:param name="count" select="1" />
        <xsl:if test="$count &gt; 0 ">
            <xsl:text>    </xsl:text>
            <xsl:call-template name="indendet">
                <xsl:with-param name="count" select="$count - 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template name="debugElemet">
        <xsl:param name="name" select ="'Element'" />
        <xsl:param name="elem" />
        <xsl:if test="$debugMode">
            <xsl:value-of select="$nl" />
            <xsl:text>% Debug </xsl:text>
            <xsl:value-of select="$name" />
            <xsl:text> -- NumberOf: </xsl:text>
            <xsl:value-of select="count($elem)" />
            <xsl:text> -- name: </xsl:text>
            <xsl:value-of select="name($elem)" />
            <xsl:value-of select="$nl" />
            <xsl:text>%         Attributes: </xsl:text>
            <xsl:for-each select="$elem/@*">
                <xsl:sort select="name()" />
                <xsl:value-of select="name()" />
                <xsl:text>="</xsl:text>
                <xsl:value-of select="." />
                <xsl:text>" </xsl:text>
            </xsl:for-each>
            <xsl:value-of select="$nl" />
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
