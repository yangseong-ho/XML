<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mpeg7="urn:mpeg:mpeg7:schema:2004">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<body>
				<style type="text/css">
				ol { counter-reset: item }
				li{ display: block }
				li:before { content: counters(item, ".") " "; counter-increment: item }
			</style>
				<h1>Report2 : XSLT Programming(CS20133235 YSH)</h1>
				<hr/>
				<ol>
					<li>
						<xsl:apply-templates select="mpeg7:Mpeg7/mpeg7:Description/mpeg7:Summarization/mpeg7:Summary/mpeg7:SummarySegmentGroup"/>
					</li>
				</ol>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="mpeg7:SummarySegmentGroup[@level=number(0)]">
		<xsl:variable name="lev1" select="mpeg7:SummarySegmentGroup[@level=number(1)]"/>
		<xsl:variable name="name" select="mpeg7:Name"/>
		<xsl:variable name="duration" select="@duration"/>
		<strong>
			<xsl:value-of select="$name"/>
		
		<xsl:if test="substring($duration,5,1) = 'M'">
			(<xsl:value-of select="substring($duration,3,9)"/>)
		</xsl:if>
		<xsl:if test="substring($duration,5,1) = 'S'">
			(<xsl:value-of select="substring($duration,3,6)"/>)
		</xsl:if>
		</strong>
		<ol>
			<xsl:apply-templates select="$lev1"/>
		</ol>
	</xsl:template>
	<xsl:template match="mpeg7:SummarySegmentGroup[@level=number(1)]">
		<xsl:variable name="lev2" select="mpeg7:SummarySegmentGroup[@level=number(2)]"/>
		<xsl:variable name="name" select="mpeg7:Name"/>
		<xsl:variable name="duration" select="@duration"/>
		<xsl:if test="$name !=''">
			<li>
				<strong>
					<xsl:value-of select="$name"/>
				<xsl:if test="substring($duration,5,1) = 'M'">
					(<xsl:value-of select="substring($duration,3,9)"/>)
				</xsl:if>
				<xsl:if test="substring($duration,5,1) = 'S'">
					(<xsl:value-of select="substring($duration,3,6)"/>)
				</xsl:if>
				</strong>
				<xsl:if test="$lev2/mpeg7:Name !=''">
					<ol>
						<xsl:apply-templates select="$lev2"/>
					</ol>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="mpeg7:SummarySegmentGroup[@level=number(2)]">
		<xsl:variable name="lev3" select="mpeg7:SummarySegmentGroup[@level=number(3)]"/>
		<xsl:variable name="name" select="mpeg7:Name"/>
		<xsl:variable name="duration" select="@duration"/>
		<xsl:if test="$name !=''">
			<li>
				<strong>
					<xsl:value-of select="$name"/>
				
				<xsl:if test="substring($duration,5,1) = 'M'">
					(<xsl:value-of select="substring($duration,3,9)"/>)
				</xsl:if>
				<xsl:if test="substring($duration,5,1) = 'S'">
					(<xsl:value-of select="substring($duration,3,6)"/>)
				</xsl:if>
				</strong>
				<xsl:if test="$lev3/mpeg7:Name != ''">
					<ol>
						<xsl:apply-templates select="$lev3"/>
					</ol>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="mpeg7:SummarySegmentGroup[@level=number(3)]">
		<xsl:variable name="name" select="mpeg7:Name"/>
		<xsl:variable name="duration" select="@duration"/>
		<xsl:if test="$name !=''">
			<li>
				<strong>
					<xsl:value-of select="$name"/>
				
				<xsl:if test="substring($duration,5,1) = 'M'">
					(<xsl:value-of select="substring($duration,3,9)"/>)
				</xsl:if>
				<xsl:if test="substring($duration,5,1) = 'S'">
					(<xsl:value-of select="substring($duration,3,6)"/>)
				</xsl:if>
				</strong>
			</li>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
