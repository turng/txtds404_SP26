<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="TEI">
        <html>
            <head>
                
                <title>Creeping Orwellianism</title>
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
                <link href="https://fonts.googleapis.com/css2?family=Creepster&amp;display=swap"
                    rel="stylesheet"/>
                <meta charset="utf-8"/>
                <style>
                    body{
                    max-width: 600px;
                    margin: 0 auto;
                    padding: 3rem;
                    
                    background: #F7F7F5;
                    color: #222;
                    
                    font-family: "Courier New", Courier, monospace;
                    line-height: 1.65;
                    }
                    
                    .text{
                    background: transparent;
                    }
                    
                    h1{
                    font-family: 'Creepster', cursive;
                    text-transform: uppercase;
                    letter-spacing: 0.1em;
                    margin: 0 auto;
                    
                    display:inline-block;
                    transform: rotate(-1.5deg);
                    }
                    
                    h2{
                    text-align: center;
                    
                    font-weight: normal;
                    margin-bottom: 2em;
                    
                    font-size: 1.1rem;
                    }
                    
                    p{
                    margin: 0 0 1em 0;
                    text-align: justify;
                    }
                    
                    .figure{
                    margin: 2em 0;
                    
                    font-size: 0.95em;
                    color: #555;
                    
                    font-style: italic;
                    border: 1px solid black;
                    }
                    
                    .entity{
                    color: inherit;
                    
                    text-decoration: underline;
                    text-decoration-style: dotted;
                    
                    cursor: pointer;
                    }
                    
                    .entity:hover{
                    background: #efe6c8;
                    }
                    
                    .unclear{
                    color: #666;
                    font-style: italic;
                    }
                    
                    .index{
                    margin-top: 4rem;
                    padding-top: 2rem;
                    
                    border-top: 1px solid #999;
                    }
                    
                    .index h2{
                    text-align: left;
                    margin-bottom: 1rem;
                    }
                    
                    .index div{
                    margin-bottom: 1rem;
                    }
                    
                    .handwritten{
                    font-family: cursive;
                    }
                    
                    .typewriter{
                    font-family: "Courier New", Courier, monospace;
                    }
                    
                    .allCaps{
                    text-transform: uppercase;
                    }
                    
                    .center{
                    display: block;
                    text-align: center;
                    }
                    
                    .right{
                    display: block;
                    text-align: right;
                    }
                    
                    .left{
                    display: block;
                    text-align: left;
                    }
                    
                    .angle45{
                    display: inline-block;
                    transform: rotate(-8deg);
                    font-size: 5rem;
                    }
                    
                    pb{
                    display: block;
                    margin: 2rem 0;
                    }
                    
                </style>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="teiHeader"/>
    <xsl:template match="text">
        <xsl:apply-templates/>    
    </xsl:template>
    
    <xsl:template match="body">
        <div class="text">
            <xsl:apply-templates/>
            <div class="index">
                <h3>People</h3>
                <xsl:apply-templates select="//listPerson"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="head[1]">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="head[2]">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>

    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="figure">
        <div class="figure">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="hi">
        <span>
            <xsl:attribute name="class">
                
                <xsl:if test="contains(@rend,'align(center)')">
                    center
                </xsl:if>
                
                <xsl:if test="contains(@rend,'align(right)')">
                    right
                </xsl:if>
                
                <xsl:if test="contains(@rend,'align(left)')">
                    left
                </xsl:if>
                
                <xsl:if test="contains(@rend,'font(handwritten)')">
                    handwritten
                </xsl:if>
                
                <xsl:if test="contains(@rend,'font(typewriter)')">
                    typewriter
                </xsl:if>
                
                <xsl:if test="contains(@rend,'font(allCaps)')">
                    allCaps
                </xsl:if>
                
                <xsl:if test="contains(@rend,'45 degree angle')">
                    angle45
                </xsl:if>
                
            </xsl:attribute>
            
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="unclear">
        <span class="unclear" title="{@reason}">
            <xsl:choose>
                <xsl:when test="node()">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>[?]</xsl:otherwise>
            </xsl:choose>
        </span>
    </xsl:template>
    <xsl:template match="name">
        <a class="entity" href="{@ref}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="listPerson">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="person">
        <div id="{@xml:id}">
            <b>
                <xsl:value-of select="persName"/>
            </b>
            <xsl:apply-templates select="note"/>
        </div>
    </xsl:template>
    <xsl:template match="listPlace"/>
    <xsl:template match="listOrg"/>
    <xsl:template match="listBibl"/>
    <xsl:template match="back"/>
        
</xsl:stylesheet>