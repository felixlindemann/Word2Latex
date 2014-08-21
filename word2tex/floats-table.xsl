<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    <xsl:import href="Word2LatexShortCuts.xsl" /> 
    
    
    <xsl:template match="w:tcPr" />
    
    <xsl:template match="w:tbl">
        <xsl:value-of select="$nl" />
        <xsl:text>\begin{table}[htbp]</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>  \centering</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\begin{tabular}{</xsl:text>
        <xsl:apply-templates select="./w:tblGrid" />
        <xsl:text>|}\hline</xsl:text>
        <xsl:value-of select="$nl" />
          <xsl:apply-templates select="./w:tr" />
        <xsl:text>\end{tabular}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\end{table}</xsl:text>
        <xsl:value-of select="$nl" />
    </xsl:template>
    
    <xsl:template match="w:tblGrid">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="w:gridCol">
        <!-- Todo -->
        <xsl:text>|p{3cm}</xsl:text>
    </xsl:template>
    
    <xsl:template match="w:tr"> 
        <xsl:apply-templates /> 
            <xsl:text>\\\hline</xsl:text>
        <xsl:value-of select="$nl" /> 
	</xsl:template>
    
    <xsl:template match="w:tc"> 
        <xsl:if test="./w:tcPr/w:gridSpan">
            <xsl:text>\multicolumn{</xsl:text>
            <xsl:value-of select="./w:tcPr/w:gridSpan/@w:val" />
             <xsl:text>}{|l|}{</xsl:text>
		</xsl:if>
        <xsl:apply-templates />
        <xsl:if test="./w:tcPr/w:gridSpan">
            <xsl:text>}</xsl:text>
		</xsl:if>
        <xsl:if test="count(./following-sibling::w:tc)>0">
            <xsl:text> </xsl:text>
           <xsl:text disable-output-escaping="yes"><![CDATA[&]]></xsl:text>
            <xsl:text> </xsl:text>
		</xsl:if>
	</xsl:template>
    
</xsl:stylesheet>
