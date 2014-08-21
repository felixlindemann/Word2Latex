<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML Studio Designer Edition 9.1.11.3570 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:rel="http://schemas.openxmlformats.org/package/2006/relationships" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    <xsl:import href="Word2LatexShortCuts.xsl" />
    <xsl:template match="w:fldChar" />
    <xsl:template match="w:instrText">
        <xsl:choose>
            <xsl:when test="fn:contains(.,'REF')">
                <xsl:text>\autoref{</xsl:text>
                <xsl:value-of select="(fn:substring-before(fn:substring-after(.,'REF '),' '))" />
                <xsl:text>} </xsl:text>
            </xsl:when>
            <xsl:when test="fn:contains(.,'MERGEFORMAT')" />
            <xsl:otherwise>
                <xsl:text>% ACHTUNG: Feldfunktion wurde nicht erkannt! </xsl:text>
                <xsl:value-of select="." />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
