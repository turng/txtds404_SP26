<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="html"/>
    <xsl:template match="tei:TEI">
        <meta charset="utf-8"/>
    <html>
        <head>
            <title>La Police de Paris Dévoilée</title>
        <meta charset="utf-8"/>
        <style>
            .orig{color: silver; display:inline}
       body{margin: auto ; width: 70% }
       .bibliography{color: grey; 
       border: 3px solid black} 
       .endnotes{background-color: silver}
        </style>
    </head>
        <body>
            <xsl:apply-templates/>
        </body>
        <back>
           <xsl:apply-templates/>
        </back>
    </html>    
    </xsl:template>
    
    <xsl:template match="tei:teiHeader">
        
    </xsl:template>
    <xsl:template match="tei:text">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:div">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:head">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    <xsl:template match="tei:opener">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="tei:salute">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:orig">
        <div class="orig"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:reg">
        <apply-templates/>
    </xsl:template>
    <xsl:template match="tei:ref[@target='n1']">
        <a href="#n1"><xsl:apply-templates/></a>
    </xsl:template>
    <xsl:template match="tei:ref[@target='n2']">
        <a href="#n2"><xsl:apply-templates/></a>
    </xsl:template>
    <xsl:template match="tei:ref[@target='n3']">
        <a href="#n3"><xsl:apply-templates/></a>
    </xsl:template>
    <xsl:template match="tei:ref[@target='n4']">
        <a href="#n4"><xsl:apply-templates/></a>
    </xsl:template>
    <xsl:template match="tei:ref[@target]" priority="99">
        <a href="{@target}">
            <xsl:apply-templates select="node()"/>
        </a>
    </xsl:template>
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:closer">
        <p style="text-indent: 50px;"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:signed">
        <p><h4 style="text-indent: 50px;"><xsl:apply-templates/></h4></p>
    </xsl:template>
    <xsl:template match="tei:div[@type='endnotes']">
        <div class="endnotes"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:note">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id='n1']">
        <p id="n1"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id='n2']">
        <p id="n2"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id='n3']">
        <p id="n3"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id='n4']">
        <p id="n4"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="tei:div[@type='bibliography']">
        <div class="bibliography"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="tei:bibl">
<p><xsl:apply-templates/></p>
    </xsl:template>
  
</xsl:stylesheet>