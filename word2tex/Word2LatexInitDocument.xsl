<?xml version="1.0" encoding="utf-8"?>
<!-- Created with Liquid XML Studio Designer Edition 9.1.11.3570 (http://www.liquid-technologies.com) -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="Word2LatexShortCuts.xsl" />
    <xsl:import href="Word2LatexVariables.xsl" />
    <xsl:template name="Praemabel">
        <!-- Präambel -->
        <xsl:value-of select="$nl" />
        <xsl:text>\documentclass{scrartcl}</xsl:text>
        <xsl:value-of select="$nl" />
        <!-- Pacakges -->
        <xsl:text>\input{setup/setup.tex}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\input{setup/todonotes.tex}</xsl:text>
        <xsl:value-of select="$nl" />
        <!-- set title -->
        <xsl:text>\title{</xsl:text>
        <xsl:value-of select="$title" />
        <xsl:text>}</xsl:text>
        <xsl:value-of select="$nl" />
        <!-- Autor -->
        <xsl:text>\author{</xsl:text>
        <xsl:value-of select="$author" />
        <xsl:text>}</xsl:text>
        <xsl:value-of select="$nl" />
        <!-- Ende Prämabel -->
    </xsl:template>
    <xsl:template name="BeginnDocument">
        <!-- Begin Document -->
        <xsl:value-of select="$nl" />
        <xsl:text>\begin{document}</xsl:text>
        <xsl:value-of select="$nl" />
        <!-- maketitle -->
        <xsl:text>\maketitle{}</xsl:text>
        <xsl:value-of select="$nl" />
        <!-- tableofcontents -->
        <xsl:text>\tableofcontents</xsl:text>
        <xsl:value-of select="$nl" />
    </xsl:template>
    <xsl:template name="EndDocument">
        <!-- EndDocument -->
        <xsl:value-of select="$nl" />
        <xsl:text>\bibliography{bib.bib}</xsl:text>
        
        <xsl:value-of select="$nl" />
        <xsl:text>\end{document}</xsl:text>
    </xsl:template>
    <xsl:template name="Blindtext">
        <xsl:text>\section{first section}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>This is where you will write your content.</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\section{second sections}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\blindtext\blindtext\blindtext\blindtext\blindtext</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\section{third sections}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\blindtext\blindtext\blindtext\blindtext\blindtext</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\section{fourth sections}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\blindtext\blindtext\blindtext\blindtext\blindtext</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\section{six sections}</xsl:text>
        <xsl:value-of select="$nl" />
        <xsl:text>\blindtext\blindtext\blindtext\blindtext\blindtext</xsl:text>
        <xsl:value-of select="$nl" />
    </xsl:template>
</xsl:stylesheet>
