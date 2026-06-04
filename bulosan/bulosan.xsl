<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Carlos Bulosan</title>
            </head>
            <body style="font-family: 'Courier New', Monospace; padding: 20px; max-width: 950px; margin: 0 auto; line-height: 1.1; background-color: #F2F1E6;">
                
                <h1 style="font-family: Monospace; color: #311f13; font-size: 2em; padding-bottom: 10px;">
                    Carlos Bulosan Dossiers
                </h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="*:teiHeader | *:header">
        <div style="background-color: #EDE0D3; border: 4px solid #4D3427; padding: 25px; margin-bottom: 40px; text-align: center;">
            
            <h1 style="font-family: Monospace; color: #3a2317; font-size: 1.8em; margin: 0 0 10px 0; padding: 0;">
                Be American and The Lonesome Mermaid
            </h1>
            
            <p style="font-size: 1.1em; font-weight: bold; margin: 0 0 20px 0; color: #444;">
                Carlos Bulosan
            </p>
            
            <p style="font-size: 0.95em; color: #3a2317; font-style: italic; margin: 0 0 25px 0; line-height: 1.5;">
                Naomi Roper, Ioana Cheldiu, Alice Leppert, Alice Wagar, Blythe Windle, Poe Claudio
            </p>
            
            <hr style="border: 0; margin-bottom: 20px;" />
            
            <p style="margin: 0; line-height: 1.6; color: #3a2317; font-family: Monospace; font-size: 0.95em;">
                These are transcriptions and encoded versions of 'Be American' and 'The Lonesome Mermaid' by Carlos Bulosan. Our goal with this project is to make his typed drafts of these short stories available digitally as well as more readable.
            </p>
            
        </div>
    </xsl:template>
    
    <xsl:template match="*:body | *:BODY">
                <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="*:head | *:HEAD">
        <h2 style="font-family: Monospace; color: #311f13; margin-top: 1.5em; margin-bottom: 0.5em; display: block; text-align: center;">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="*:p | *:P">
        <p style="margin-top: 0; margin-bottom: 1em; white-space: normal;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="*:ab">
        <p style="margin-top: 2em; margin-bottom: 2em; white-space: normal; text-align: center;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>