<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<head>
			<title>Local 9gag</title>
			<style type="text/css">
				body
				{
					text-align: center;
				}
			</style>
		</head>
		<body>
			hej!
			<xsl:for-each select="gags/gag">
				<h1><xsl:value-of select="title"/></h1>
				<a>
					<xsl:attribute name="href">http://www.9gag.com/gag/<xsl:value-of select="id"/></xsl:attribute>
					<img src="$url">
					<xsl:attribute name="src"><xsl:value-of select="url"/></xsl:attribute></img>
				</a>
				<br />
			</xsl:for-each>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>
