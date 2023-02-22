<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<!-- Plantilla principal -->
<xsl:template match='/reservaeventos'>
<html lang="es">
    <head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Teatro" />
		<title>Teatro</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main class="principal">
			<section class="teatro">
				<h1>PROXIMAS OBRAS DE TEATRO</h1>
				<ul>
				
                    <xsl:apply-templates select="teatro">
                        <!-- Ordenadas por fecha -->
						<xsl:sort select="fechahora/@dia" order="ascending" />
                    </xsl:apply-templates>
                </ul>
			</section>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- Plantilla de las obras de teatro -->
<xsl:template match="teatro">
	<!-- Solo las obras de teatro de 2023-01 -->
	<xsl:if test="fechahora[starts-with(@dia, '2023-01')]">
		<!-- Las que cuestan menos de 20 -->
		<xsl:if test="precio&lt;20">
			<li><u><xsl:value-of select="substring(fechahora/@dia, 6)"/>: <xsl:value-of select="obra"/></u></li>
		</xsl:if>
		<!-- Las que cuestan mas de 20 -->
		<xsl:if test="precio&gt;20">
			<li><xsl:value-of select="substring(fechahora/@dia, 6)"/>: <xsl:value-of select="obra"/></li>
		</xsl:if>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>