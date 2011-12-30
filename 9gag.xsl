<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
<head><title>aa</title></head>
  <body>
	  hej!
    <xsl:for-each select="gags/gag">
      <h1><xsl:value-of select="title"/></h1>
	<img src="$url">
	<xsl:attribute name="src"><xsl:value-of select="url"/></xsl:attribute></img>
	<br />
    </xsl:for-each>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
