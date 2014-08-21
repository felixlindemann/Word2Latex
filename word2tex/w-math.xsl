<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="Word2LatexShortCuts.xsl" /> 
    <xsl:template match="m:dPr" />
    <xsl:template match="m:rPr" />
    <xsl:template match="m:limLoc" />
    <xsl:template match="m:grow" />
    <xsl:template match="m:ctrlPr" />
    <xsl:template match="m:sSubPr" />
    <xsl:template match="m:sSupPr" />
    <xsl:template match="m:funcPr" />
    <xsl:template match="m:oMathParaPr" />
    <xsl:template match="m:accPr" />
    
    <xsl:template match="m:oMathPara">
        <xsl:value-of select="$nl" />
        <xsl:text>\begin{align}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:apply-templates />
        <xsl:value-of select="$nl" />
        <xsl:text>\end{align}</xsl:text>
        <xsl:value-of select="$nl" />
    </xsl:template>
  
    <xsl:template match="m:oMath">
        <xsl:choose>
            <xsl:when test="name(..)='m:oMathPara'" />
            <xsl:otherwise>
                <!-- Wenn Inline-Equation -->
                <xsl:text>$</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="not(name(..)='m:oMathPara')"></xsl:if>
        <xsl:apply-templates />
        <xsl:choose>
            <xsl:when test="name(..)='m:oMathPara'">
                <xsl:if test="count(following-sibling::m:oMath)>0">
                    <!-- Wenn multiline Equtations -->
                    <xsl:text>\\</xsl:text>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <!-- Wenn Inline-Equation -->
                <xsl:text>$</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
   
    <xsl:template match="m:r">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="m:d">
        <xsl:text>\left(</xsl:text>
        <xsl:apply-templates />
        <xsl:text>\right)</xsl:text>
    </xsl:template>
  
    <xsl:template match="m:chr">
        <!-- Große Operatoren -->
        <xsl:choose> 
            <xsl:when test="./@m:val='∑'">
                <xsl:text>\sum</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$debugMode">
                    <xsl:text>\bf{\text{Das Zeichen '</xsl:text>
                    <xsl:value-of select="./@m:val" />
                    <xsl:text>'konnte nicht erkannt werden.}}</xsl:text>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="m:sSub">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:sub">
        <xsl:text>_{</xsl:text>
        <xsl:apply-templates />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:sup">
        <xsl:text>^{</xsl:text>
        <xsl:apply-templates />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:nary">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:naryPr">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="m:e">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:f">
        
        <!-- Brüche -->
        <!-- TODO: Binomial Koeffizienten -->
        <xsl:text>\frac{</xsl:text>
        <xsl:apply-templates select="./m:num" />
        <xsl:text>}{</xsl:text>
        <xsl:apply-templates select="./m:den" />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:num">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="m:den">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="m:deg">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="m:sSup">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="m:acc">
        <xsl:choose>
            <xsl:when test="./m:accPr/m:chr/@m:val='̃'">\widetilde</xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
        <xsl:text>{</xsl:text>
        <xsl:apply-templates />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:rad">
        <xsl:text>\sqrt[</xsl:text>
        <xsl:apply-templates select="./m:deg" />
        <xsl:text>]{</xsl:text>
        <xsl:apply-templates select="./m:e" />
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:func">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="m:fName">
        <xsl:variable name="funcName" select="./m:r/m:t" />
        <xsl:choose>
            <xsl:when test="$funcName = 'cos'">
                <xsl:text>\cos</xsl:text>
            </xsl:when>
            <xsl:when test="$funcName = 'sin'">
                <xsl:text>\sin</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$funcName" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="m:t">
        <xsl:call-template name="ReplaceChars">
            <xsl:with-param name="t" select="." />
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>
