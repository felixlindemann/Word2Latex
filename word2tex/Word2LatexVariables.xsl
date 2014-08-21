<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    
    <xsl:variable name="author">
        <xsl:choose>
            <xsl:when test="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/dc:creator">
                <xsl:value-of select="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/dc:creator" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>author</xsl:text>xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="title">
        <xsl:choose>
            <xsl:when test="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/dc:title">
                <xsl:value-of select="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/dc:title" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Titel der Arbeit</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="revision">
        <xsl:choose>
            <xsl:when test="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:revision">
                <xsl:value-of select="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:revision" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>revision</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="KeyWords">
        <xsl:choose>
            <xsl:when test="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:keywords">
                <xsl:value-of select="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:keywords" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>keywords</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Kategorien">
        <xsl:choose>
            <xsl:when test="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:category">
                <xsl:value-of select="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:category" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>category</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="DocStatus">
        <xsl:choose>
            <xsl:when test="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:contentStatus">
                <xsl:value-of select="/pkg:package/pkg:part[@pkg:name='/docProps/core.xml']/pkg:xmlData/cp:coreProperties/cp:contentStatus" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>DocStatus</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="Abstract">
        <xsl:choose>
            <xsl:when test="/pkg:package/pkg:part/pkg:xmlData/tns:CoverPageProperties/tns:Abstract">
                <xsl:value-of select="/pkg:package/pkg:part/pkg:xmlData/tns:CoverPageProperties/tns:Abstract" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Abstract</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

</xsl:stylesheet>
