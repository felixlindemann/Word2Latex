<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML Studio Designer Edition 9.1.11.3570 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:rel="http://schemas.openxmlformats.org/package/2006/relationships" xmlns:tns="http://schemas.microsoft.com/office/2006/coverPageProps" xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage" xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
    <xsl:import href="Word2LatexShortCuts.xsl" />
    <xsl:template name="getitemize">
        <xsl:param name="p" />
        <xsl:param name="dicItem" />
        <!-- get Predeccossor und follower -->
        <xsl:variable name="pre" select="preceding-sibling::w:p[1]" />
        <xsl:variable name="fol" select="following-sibling::w:p[1]" />
        <!-- get Paragrpah Style -->
        <xsl:variable name="ck" select="key('k_style',$p/w:pPr/w:pStyle/@w:val)/w:name/@w:val" />
        <xsl:variable name="pk" select="key('k_style',$pre/w:pPr/w:pStyle/@w:val)/w:name/@w:val" />
        <xsl:variable name="fk" select="key('k_style',$fol/w:pPr/w:pStyle/@w:val)/w:name/@w:val" />
        <!-- get Latex Compoment -->
        <xsl:variable name="cl" select="document('word2LaTexDictionary.xml')/LatexDictionary/paragraphs/item[@word=$ck]/@template" />
        <xsl:variable name="pl" select="document('word2LaTexDictionary.xml')/LatexDictionary/paragraphs/item[@word=$pk]/@template" />
        <xsl:variable name="fl" select="document('word2LaTexDictionary.xml')/LatexDictionary/paragraphs/item[@word=$fk]/@template" />
        <!-- get Deepness -->
        <xsl:variable name="ilvl" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$p/w:pPr/w:numPr/w:ilvl/@w:val">
                    <xsl:value-of select="$p/w:pPr/w:numPr/w:ilvl/@w:val" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="pilvl" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$pre/w:pPr/w:numPr/w:ilvl/@w:val">
                    <xsl:value-of select="$pre/w:pPr/w:numPr/w:ilvl/@w:val" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="filvl" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$fol/w:pPr/w:numPr/w:ilvl/@w:val">
                    <xsl:value-of select="$fol/w:pPr/w:numPr/w:ilvl/@w:val" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- get ListType -->
        <xsl:variable name="numId" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$p/w:pPr/w:numPr/w:numId/@w:val">
                    <xsl:value-of select="$p/w:pPr/w:numPr/w:numId/@w:val" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="pnumid" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$pre/w:pPr/w:numPr/w:numId/@w:val">
                    <xsl:value-of select="$pre/w:pPr/w:numPr/w:numId/@w:val" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="fnumid" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$fol/w:pPr/w:numPr/w:numId/@w:val">
                    <xsl:value-of select="$fol/w:pPr/w:numPr/w:numId/@w:val" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="0" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- NeedsBeginn -->
        <xsl:variable name="needsBeginn" as="xs:boolean">
            <xsl:choose>
                <xsl:when test="$cl=$pl">
                    <xsl:choose>
                        <xsl:when test="$numId=$pnumid">
                            <xsl:value-of select="$ilvl &gt; $pilvl" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="boolean('false')" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="boolean('true')" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- NeedsEnd -->
        <xsl:variable name="needsEnd" as="xs:boolean">
            <xsl:choose>
                <xsl:when test="$cl=$fl">
                    <xsl:choose>
                        <xsl:when test="$numId=$fnumid">
                            <xsl:value-of select="$ilvl &gt; $filvl" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="boolean('false')" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="boolean('true')" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="EndCounts" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$needsEnd">
                    <xsl:choose>
                        <xsl:when test="$filvl &gt;= 0">
                            <xsl:value-of select="$ilvl - $filvl" />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$ilvl + 1" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="1" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- <xsl:text>% Debug Itemize: </xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>%         text : </xsl:text>
        <xsl:value-of select="$pnumid" />
        <xsl:value-of select="$nl" />
        <xsl:text>%         pnumid: </xsl:text>
        <xsl:value-of select="$pnumid" />
        <xsl:value-of select="$nl" />
        <xsl:text>%         numId: </xsl:text>
        <xsl:value-of select="$numId" />
        <xsl:value-of select="$nl" />
        <xsl:text>%         fnumid: </xsl:text>
        <xsl:value-of select="$fnumid" />
        <xsl:value-of select="$nl" />
        <xsl:text>%         needsBeginn: </xsl:text>
        <xsl:value-of select="$needsBeginn" />
        <xsl:value-of select="$nl" />
        <xsl:text>%         needsEnd: </xsl:text>
        <xsl:value-of select="$needsEnd" />
        <xsl:value-of select="$nl" />
        <xsl:text>%         EndCounts: </xsl:text>
        <xsl:value-of select="$EndCounts" />
        <xsl:value-of select="$nl" />-->
        <xsl:variable name="floatname">
            <xsl:choose>
                <xsl:when test="$numId = 4">
                    <xsl:value-of select="'enumerate'" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'itemize'" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- provide float -->
        <xsl:if test="$needsBeginn">
            <xsl:call-template name="Beginfloat">
                <xsl:with-param name="float" select="$floatname" />
            </xsl:call-template>
        </xsl:if>
        <!-- write Item -->
        <xsl:value-of select="$nl" />
        <xsl:text>   \item </xsl:text>
        <xsl:apply-templates />
        <!-- provide float -->
        <xsl:if test="$needsEnd">
            <xsl:call-template name="Endfloat">
                <xsl:with-param name="float" select="$floatname" />
                <xsl:with-param name="count" select="fn:max((1,$EndCounts))" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
