<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="html"/>
    <xsl:template match="tei:TEI">
        <meta charset="utf-8"/>
        <html>
            <head>
                <title>La Police de Paris Dévoilée</title>
                <meta charset="utf-8"/>
                <style>
                    .orig {
                    display: none;
                    }
                    
                    .reg:hover + .orig {
                    display: inline;
                    color: blue
                    }
                    
                    .reg {
                    color: red;
                    }
                    .ital{font-style:italic;}
                    body {
                        margin: auto;
                        width: 70%
                    }
                    .bibliography {
                        background-color:silver}
                    .endnotes {
                        color: grey; border: 3px solid black; margin-bottom: 20px
                    }
                #n1, #n2, #n3, #n4{
                display: none}
                #n1:target{
                display: block}
                #n2:target{
                display: block}
                #n3:target{
                display: block}
                #n4:target{
                display: block}
                
                </style>
            </head>
            <body>
                <!-- when you use apply-templates multiple times, you want to 
                    make sure you're sending the processor to different places
                    as appropriate to the container you're putting the content in -->
                <xsl:apply-templates select="//tei:front"/>
                <xsl:apply-templates select="//tei:body"/>
            </body>
            <back>
                <xsl:apply-templates select="//tei:back"/>
            </back>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"> </xsl:template>
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
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="tei:opener">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="tei:salute">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:orig">
        <!-- you had this as <div> but that creates a line-break. Span is better -->
        <span class="orig">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:reg">
        <!-- and I added this span as well, in case you want to add style -->
        <span class="reg"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="tei:hi[@rend='italic']">
        <span class="ital"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="tei:ref[@target = 'n1']">
        <a href="#n1" id="n1">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:ref[@target = 'n2']">
        <a href="#n2" id="n2">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:ref[@target = 'n3']">
        <a href="#n3" id="n3">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:ref[@target = 'n4']">
        <a href="#n4" id="n4">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:ref[@target]" priority="99">
        <a href="{@target}">
            <xsl:apply-templates select="node()"/>
        </a>
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:closer">
        <p style="text-indent: 50px;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:signed">
        <p>
            <h4 style="text-indent: 50px;">
                <xsl:apply-templates/>
            </h4>
        </p>
    </xsl:template>
    <xsl:template match="tei:div[@type = 'endnotes']">
        <div class="endnotes">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:note">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id = 'n1']">
        <p id="n1">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id = 'n2']">
        <p id="n2">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id = 'n3']">
        <p id="n3">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:note[@xml:id = 'n4']">
        <p id="n4">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div[@type = 'bibliography']">
        <div class="bibliography">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:bibl">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

</xsl:stylesheet>
