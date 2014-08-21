<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML Studio Designer Edition 9.1.11.3570 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:rel="http://schemas.openxmlformats.org/package/2006/relationships" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    <xsl:function name="functx:replace-multi" as="xs:string?" xmlns:functx="http://www.functx.com">
        <xsl:param name="arg" as="xs:string?" />
        <xsl:param name="changeFrom" as="xs:string*" />
        <xsl:param name="changeTo" as="xs:string*" />
        <xsl:sequence select="
   if (count($changeFrom) > 0)
   then functx:replace-multi(
          replace($arg, $changeFrom[1],
                     functx:if-absent($changeTo[1],'')),
          $changeFrom[position() > 1],
          $changeTo[position() > 1])
   else $arg
 " />
    </xsl:function>
    <xsl:function name="functx:if-absent" as="item()*" xmlns:functx="http://www.functx.com">
        <xsl:param name="arg" as="item()*" />
        <xsl:param name="value" as="item()*" />
        <xsl:sequence select="
    if (exists($arg))
    then $arg
    else $value
 " />
    </xsl:function>
</xsl:stylesheet>
