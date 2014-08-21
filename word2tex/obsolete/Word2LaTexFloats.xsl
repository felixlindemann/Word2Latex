<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML Studio Designer Edition 9.1.11.3570 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:rel="http://schemas.openxmlformats.org/package/2006/relationships" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    <xsl:import href="Word2LatexShortCuts.xsl" />
    
    <xsl:template match="wp:inline" />
    <xsl:template match="w:drawing">
       <xsl:call-template name="drawing" />
    </xsl:template>
     <xsl:template match="w:object">
       <xsl:call-template name="drawing" />
    </xsl:template>
    <xsl:template name="drawing"> 
        <xsl:variable name="parent_p" select="./ancestor::w:p[1]" />
        <xsl:variable name="fol" select="$parent_p/following-sibling::w:p[1]" />
        <!-- Decide, if following paragraph is caption  -->
        <xsl:variable name="styleId" select="$fol/w:pPr/w:pStyle/@w:val" />
        <xsl:value-of select="$nl" />
        <xsl:text>\begin{figure}[htbp]</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>  \centering</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>% \includegraphics[width=1.00\textwidth]{img/image.png}</xsl:text>
        <xsl:if test="key('k_style',$styleId)/w:name/@w:val = 'caption'">
            <xsl:value-of select="$nl" />
            <xsl:text>  \caption{</xsl:text>
            <xsl:choose>
                <xsl:when test="$fol/w:bookmarkEnd">
                    <xsl:apply-templates select="$fol/w:bookmarkEnd/following-sibling::w:r"/> 
				</xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates />
				</xsl:otherwise>
			</xsl:choose>
            <xsl:text>}</xsl:text>
            <xsl:value-of select="$nl" /> 
                <xsl:text>  \label{</xsl:text>
                <xsl:value-of select="$fol/w:bookmarkStart/@w:name"/>
                <xsl:text>}</xsl:text>
                <xsl:value-of select="$nl" /> 
        </xsl:if>
        <xsl:text>\end{figure}</xsl:text>
        <xsl:value-of select="$nl" />
    </xsl:template>
     
</xsl:stylesheet>
