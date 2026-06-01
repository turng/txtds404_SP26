<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:title"/>
                </title>
                
                <style>
                    body{
                    font-family: Georgia, serif;
                    max-width: 900px;
                    margin:auto;
                    padding:20px;
                    line-height:1.6;
                    background:#faf8f2;
                    }
                    
                    h1{
                    text-align:center;
                    }
                    
                    .poem{
                    margin-bottom:40px;
                    padding:15px;
                    border-bottom:1px solid #ccc;
                    }
                    
                    .line{
                    margin-left:20px;
                    }
                    
                    .pagebreak{
                    margin-top:20px;
                    margin-bottom:20px;
                    font-weight:bold;
                    color:#666;
                    }
                    
                    .figdesc{
                    font-style:italic;
                    color:#555;
                    margin-bottom:10px;
                    }
                </style>
            </head>
            
            <body>
                
                <h1>
                    <xsl:value-of select="//tei:title"/>
                </h1>
                
                <xsl:apply-templates select="//tei:body"/>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <div class="pagebreak">
            [Page <xsl:value-of select="@n"/>]
        </div>
    </xsl:template>
    
    <xsl:template match="tei:figure">
        <div class="figdesc">
            Illustration:
            <xsl:value-of select="tei:figDesc"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:lg[@type='poem']">
        <div class="poem">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:l">
        <div class="line">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>