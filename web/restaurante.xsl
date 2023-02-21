<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<!-- Plantilla principal -->
<xsl:template match='/reservaeventos'>


<html lang="es">
    <head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Restaurante" />
		<title>Restaurante</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main>
			<xsl:variable name="rest" select="restaurante[nombrerestaurante='El clarete']/nombrerestaurante"/>
			<h1 style="text-transform: uppercase"><a class="linkrest" href="{restaurante[nombrerestaurante=$rest]/informacion}" target="_blank"><xsl:value-of select="restaurante[nombrerestaurante=$rest]/nombrerestaurante"/></a> - <xsl:value-of select="restaurante[nombrerestaurante=$rest]/ciudad"/></h1>
			<xsl:for-each select="restaurante[nombrerestaurante=$rest]/menu">
				<article class="restaurante">
					<h3 style="text-transform: uppercase"><xsl:value-of select="@tipo"/></h3>
					<xsl:apply-templates select="plato"/>
					<p></p>
				</article>
			</xsl:for-each>	
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="plato">
	<p><xsl:value-of select="."/></p>
</xsl:template>

</xsl:stylesheet>