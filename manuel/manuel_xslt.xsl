<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math tei">

    <xsl:output method="html" html-version="5" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/tei:TEI">
        <html lang="en">
            <head>
                <meta charset="utf-8"/>
                <title>La Police de Paris Dévoilée</title>
                <style>
                    body {
                        margin: auto;
                        width: 70%;
                        font-family: Georgia, serif;
                        line-height: 1.5;
                    }
                    .orig {
                        color: silver;
                        display: inline;
                    }
                    .bibliography {
                        color: grey;
                        border: 3px solid black;
                        padding: 1em;
                        margin-top: 2em;
                    }
                    .endnotes {
                        background-color: silver;
                        padding: 1em;
                        margin-top: 2em;
                    }
                    .back {
                        margin-top: 2em;
                    }
                    .pb {
                        color: gray;
                        font-size: 0.9em;
                        margin: 1em 0;
                    }
                    a {
                        color: darkblue;
                        text-decoration: none;
                    }
                    a:hover {
                        text-decoration: underline;
                    }
                    note-ref {
                        vertical-align: super;
                        font-size: 0.8em;
                    }
                </style>
            </head>
            <body>
                <xsl:apply-templates select="tei:text/tei:body"/>
                <div class="back">
                    <xsl:apply-templates select="tei:text/tei:back"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:text | tei:body | tei:back | tei:div">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:head | tei:p[@rend='head']">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>

    <xsl:template match="tei:opener">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>

    <xsl:template match="tei:salute">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:orig">
        <span class="orig"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:reg">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:reg"/>
    </xsl:template>

    <xsl:template match="tei:ref[@target]">
        <a href="{@target}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>

    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="tei:closer">
        <p style="text-indent: 50px;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:signed">
        <h4 style="text-indent: 50px;">
            <xsl:apply-templates/>
        </h4>
    </xsl:template>

    <xsl:template match="tei:list">
        <ol>
            <xsl:apply-templates/>
        </ol>
    </xsl:template>

    <xsl:template match="tei:item">
        <li><xsl:apply-templates/></li>
    </xsl:template>

    <xsl:template match="tei:pb">
        <div class="pb">[Page <xsl:value-of select="@n"/>]</div>
    </xsl:template>

    <xsl:template match="tei:div[@type='endnotes']">
        <div class="endnotes">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:note[@xml:id]">
        <p id="{@xml:id}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:div[@type='bibliography'] | tei:listBibl">
        <div class="bibliography">
            <h3>Bibliography</h3>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
