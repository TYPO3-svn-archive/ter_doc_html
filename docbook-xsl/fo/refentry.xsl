<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions"
                version='1.0'>

<!-- ********************************************************************
     $Id: refentry.xsl,v 1.1 2005/10/25 11:27:34 robert_typo3 Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->

<xsl:template match="reference">
   <xsl:if test="not(partintro)">
    <xsl:variable name="id">
      <xsl:call-template name="object.id"/>
    </xsl:variable>
    <xsl:variable name="master-reference">
      <xsl:call-template name="select.pagemaster"/>
    </xsl:variable>

    <fo:page-sequence hyphenate="{$hyphenate}"
                      master-reference="{$master-reference}">
      <xsl:attribute name="language">
        <xsl:call-template name="l10n.language"/>
      </xsl:attribute>
      <xsl:attribute name="format">
        <xsl:call-template name="page.number.format">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:call-template>
      </xsl:attribute>

      <xsl:attribute name="initial-page-number">
        <xsl:call-template name="initial.page.number">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:call-template>
      </xsl:attribute>

      <xsl:attribute name="force-page-count">
        <xsl:call-template name="force.page.count">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:call-template>
      </xsl:attribute>

      <xsl:attribute name="hyphenation-character">
        <xsl:call-template name="gentext">
          <xsl:with-param name="key" select="'hyphenation-character'"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:attribute name="hyphenation-push-character-count">
        <xsl:call-template name="gentext">
          <xsl:with-param name="key" select="'hyphenation-push-character-count'"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:attribute name="hyphenation-remain-character-count">
        <xsl:call-template name="gentext">
          <xsl:with-param name="key" select="'hyphenation-remain-character-count'"/>
        </xsl:call-template>
      </xsl:attribute>

      <xsl:apply-templates select="." mode="running.head.mode">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="." mode="running.foot.mode">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:apply-templates>

      <fo:flow flow-name="xsl-region-body">
        <xsl:call-template name="set.flow.properties">
          <xsl:with-param name="element" select="local-name(.)"/>
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:call-template>

        <fo:block id="{$id}">
          <xsl:call-template name="reference.titlepage"/>
        </fo:block>
        <!-- Create one page sequence if no pagebreaks needed -->
        <xsl:if test="$refentry.pagebreak = 0">
          <xsl:apply-templates select="refentry"/>
        </xsl:if>
      </fo:flow>
    </fo:page-sequence>
  </xsl:if>
  <xsl:apply-templates select="partintro"/>
  <xsl:if test="$refentry.pagebreak != 0">
    <xsl:apply-templates select="refentry"/>
  </xsl:if>
</xsl:template>

<xsl:template match="reference" mode="reference.titlepage.mode">
  <xsl:call-template name="reference.titlepage"/>
</xsl:template>

<xsl:template match="reference/partintro">
  <xsl:variable name="id">
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="ancestor::reference"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="master-reference">
    <xsl:call-template name="select.pagemaster"/>
  </xsl:variable>

  <fo:page-sequence hyphenate="{$hyphenate}"
                    master-reference="{$master-reference}">
    <xsl:attribute name="language">
      <xsl:call-template name="l10n.language"/>
    </xsl:attribute>
    <xsl:attribute name="format">
      <xsl:call-template name="page.number.format">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:attribute name="initial-page-number">
      <xsl:call-template name="initial.page.number">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:attribute name="force-page-count">
      <xsl:call-template name="force.page.count">
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:attribute name="hyphenation-character">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'hyphenation-character'"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="hyphenation-push-character-count">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'hyphenation-push-character-count'"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="hyphenation-remain-character-count">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'hyphenation-remain-character-count'"/>
      </xsl:call-template>
    </xsl:attribute>

    <xsl:apply-templates select="." mode="running.head.mode">
      <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="." mode="running.foot.mode">
      <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:apply-templates>

    <fo:flow flow-name="xsl-region-body">
      <xsl:call-template name="set.flow.properties">
        <xsl:with-param name="element" select="local-name(.)"/>
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>
      <fo:block id="{$id}">
        <xsl:apply-templates select=".." mode="reference.titlepage.mode"/>
      </fo:block>
      <xsl:if test="title">
        <xsl:call-template name="partintro.titlepage"/>
      </xsl:if>
      <xsl:apply-templates/>
      <!-- Create one page sequence if no pagebreaks needed -->
      <xsl:if test="$refentry.pagebreak = 0">
        <xsl:apply-templates select="../refentry"/>
      </xsl:if>
    </fo:flow>
  </fo:page-sequence>
</xsl:template>

<xsl:template match="reference/docinfo|refentry/refentryinfo"></xsl:template>
<xsl:template match="reference/title"></xsl:template>
<xsl:template match="reference/subtitle"></xsl:template>

<!-- ==================================================================== -->

<xsl:template match="refentry">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:variable name="master-reference">
    <xsl:call-template name="select.pagemaster"/>
  </xsl:variable>

  <xsl:variable name="refentry.content">
    <fo:block id="{$id}">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="not(parent::*) or 
                    (parent::reference and $refentry.pagebreak != 0) or 
                    parent::part">
      <!-- make a page sequence -->
      <fo:page-sequence hyphenate="{$hyphenate}"
                        master-reference="{$master-reference}">
        <xsl:attribute name="language">
          <xsl:call-template name="l10n.language"/>
        </xsl:attribute>
        <xsl:attribute name="format">
          <xsl:call-template name="page.number.format">
            <xsl:with-param name="master-reference" select="$master-reference"/>
          </xsl:call-template>
        </xsl:attribute>

        <xsl:attribute name="initial-page-number">
          <xsl:call-template name="initial.page.number">
            <xsl:with-param name="master-reference" select="$master-reference"/>
          </xsl:call-template>
        </xsl:attribute>

        <xsl:attribute name="force-page-count">
          <xsl:call-template name="force.page.count">
            <xsl:with-param name="master-reference" select="$master-reference"/>
          </xsl:call-template>
        </xsl:attribute>

        <xsl:attribute name="hyphenation-character">
          <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'hyphenation-character'"/>
          </xsl:call-template>
        </xsl:attribute>
        <xsl:attribute name="hyphenation-push-character-count">
          <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'hyphenation-push-character-count'"/>
          </xsl:call-template>
        </xsl:attribute>
        <xsl:attribute name="hyphenation-remain-character-count">
          <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'hyphenation-remain-character-count'"/>
          </xsl:call-template>
        </xsl:attribute>

        <xsl:apply-templates select="." mode="running.head.mode">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:apply-templates>
        <xsl:apply-templates select="." mode="running.foot.mode">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:apply-templates>

        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="set.flow.properties">
            <xsl:with-param name="element" select="local-name(.)"/>
            <xsl:with-param name="master-reference" select="$master-reference"/>
          </xsl:call-template>

          <xsl:copy-of select="$refentry.content"/>
        </fo:flow>
      </fo:page-sequence>
    </xsl:when>
    <xsl:otherwise>
      <fo:block>
        <xsl:if test="$refentry.pagebreak != 0">
          <xsl:attribute name="break-before">page</xsl:attribute>
        </xsl:if>
        <xsl:copy-of select="$refentry.content"/>
      </fo:block>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="refmeta">
</xsl:template>

<xsl:template match="manvolnum">
  <xsl:if test="$refentry.xref.manvolnum != 0">
    <xsl:text>(</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>)</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="refmiscinfo">
</xsl:template>

<xsl:template match="refentrytitle">
  <xsl:call-template name="inline.charseq"/>
</xsl:template>

<xsl:template match="refnamediv">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block id="{$id}">

    <!-- if refentry.generate.name is non-zero, then we need to generate a -->
    <!-- localized "Name" subheading for this refnamdiv (unless it has a -->
    <!-- preceding sibling that is a refnamediv, in which case we have already -->
    <!-- generated a "Name" subheading, so we don't need to do it again -->
    <xsl:if test="$refentry.generate.name != 0">
        <xsl:choose>
          <xsl:when test="preceding-sibling::refnamediv">
            <!-- no generated title on secondary refnamedivs! -->
          </xsl:when>
          <xsl:otherwise>
            <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format"
                      xsl:use-attribute-sets="refnamediv.titlepage.recto.style"
                      font-family="{$title.fontset}">
              <!-- Contents of what is now the format.refentry.subheading -->
              <!-- template were formerly intended to be used only to -->
              <!-- process those subsections of Refentry that have "real" -->
              <!-- title children. So as a kludge to get around the fact -->
              <!-- that the template still basically "expects" to be -->
              <!-- processing that kind of a node, when we call the -->
              <!-- template to process generated titles, we must call it -->
              <!-- with values for the "offset" and "section" parameters -->
              <!-- that are different from the default values in the -->
              <!-- format.refentry.subheading template itself. Because -->
              <!-- those defaults are the values appropriate for processing -->
              <!-- "real" title nodes. -->
              <xsl:call-template name="format.refentry.subheading">
                <xsl:with-param name="section" select="self::*"/>
                <xsl:with-param name="offset" select="1"/>
                <xsl:with-param name="gentext.key" select="'RefName'"/>
              </xsl:call-template>
            </fo:block>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>

      <xsl:if test="$refentry.generate.title != 0">
  <xsl:variable name="section.level">
    <xsl:call-template name="refentry.level">
      <xsl:with-param name="node" select="ancestor::refentry"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="reftitle">
        <xsl:choose>
          <xsl:when test="../refmeta/refentrytitle">
            <xsl:apply-templates select="../refmeta/refentrytitle"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="refname[1]"/>
          </xsl:otherwise>
        </xsl:choose>
  </xsl:variable>

  <!-- xsl:use-attribute-sets takes only a Qname, not a variable -->
    <xsl:choose>
      <xsl:when test="preceding-sibling::refnamediv">
	<!-- no title on secondary refnamedivs! -->
      </xsl:when>
      <xsl:when test="$section.level = 1">
        <fo:block xsl:use-attribute-sets="refentry.title.properties">
          <fo:block xsl:use-attribute-sets="section.title.level1.properties">
            <xsl:value-of select="$reftitle"/>
          </fo:block>
        </fo:block>
      </xsl:when>
      <xsl:when test="$section.level = 2">
        <fo:block xsl:use-attribute-sets="refentry.title.properties">
          <fo:block xsl:use-attribute-sets="section.title.level2.properties">
            <xsl:value-of select="$reftitle"/>
          </fo:block>
        </fo:block>
      </xsl:when>
      <xsl:when test="$section.level = 3">
        <fo:block xsl:use-attribute-sets="refentry.title.properties">
          <fo:block xsl:use-attribute-sets="section.title.level3.properties">
            <xsl:value-of select="$reftitle"/>
          </fo:block>
        </fo:block>
      </xsl:when>
      <xsl:when test="$section.level = 4">
        <fo:block xsl:use-attribute-sets="refentry.title.properties">
          <fo:block xsl:use-attribute-sets="section.title.level4.properties">
            <xsl:value-of select="$reftitle"/>
          </fo:block>
        </fo:block>
      </xsl:when>
      <xsl:when test="$section.level = 5">
        <fo:block xsl:use-attribute-sets="refentry.title.properties">
          <fo:block xsl:use-attribute-sets="section.title.level5.properties">
            <xsl:value-of select="$reftitle"/>
          </fo:block>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block xsl:use-attribute-sets="refentry.title.properties">
          <fo:block xsl:use-attribute-sets="section.title.level6.properties">
            <xsl:value-of select="$reftitle"/>
          </fo:block>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
    </xsl:if>

    <fo:block>
      <xsl:if test="not(following-sibling::refnamediv)">
	<xsl:attribute name="space-after">1em</xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="../refmeta/refentrytitle">
          <xsl:apply-templates select="../refmeta/refentrytitle"/>
        </xsl:when>
	<xsl:when test="refdescriptor">
          <xsl:apply-templates select="refdescriptor[1]"/>
	</xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="refname[1]"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="refpurpose"/>
    </fo:block>

    <!-- what was this for?
    <fo:block>
      <xsl:choose>
	<xsl:when test="refdescriptor">
	  <xsl:apply-templates select="refdescriptor"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:for-each select="refname">
	    <xsl:apply-templates select="."/>
	    <xsl:if test="following-sibling::refname">
	      <xsl:text>, </xsl:text>
	    </xsl:if>
	  </xsl:for-each>
	</xsl:otherwise>
      </xsl:choose>
    </fo:block>
    -->
  </fo:block>
</xsl:template>

<xsl:template match="refname">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="refpurpose">
  <xsl:text> </xsl:text>
  <xsl:call-template name="dingbat">
    <xsl:with-param name="dingbat">em-dash</xsl:with-param>
  </xsl:call-template>
  <xsl:text> </xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="refdescriptor">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="refclass">
  <fo:block font-weight="bold">
    <xsl:if test="@role">
      <xsl:value-of select="@role"/>
      <xsl:text>: </xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="refsynopsisdiv">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block id="{$id}">
    <xsl:call-template name="refsynopsisdiv.titlepage"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="refsection">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block id="{$id}">
    <xsl:call-template name="refsection.titlepage"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="refsect1">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block id="{$id}">
    <xsl:call-template name="refsect1.titlepage"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="refsect2">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block id="{$id}">
    <xsl:call-template name="refsect2.titlepage"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="refsect3">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block id="{$id}">
    <xsl:call-template name="refsect3.titlepage"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="refsynopsisdiv/title
                     |refsection/title
                     |refsect1/title
                     |refsect2/title
                     |refsect3/title">
  <!-- nop; titlepage.mode instead -->
</xsl:template>

<xsl:template match="refsynopsisdiv/title
                     |refsection/title
                     |refsect1/title
                     |refsect2/title
                     |refsect3/title"
              mode="titlepage.mode"
              priority="2">
  <xsl:call-template name="format.refentry.subheading"/>
</xsl:template>

<xsl:template name="format.refentry.subheading">
<!-- This template is now called to process generated titles for -->
<!-- Refnamediv and Refsynopsisdiv, as well as "real" titles for -->
<!-- Refsynopsisdiv, Refsection, and Refsect[1-3]. -->
<!-- -->
<!-- But the contents of this template were formerly intended to be used -->
<!-- only to process those subsections of Refentry that have "real" title -->
<!-- children. So as a kludge to get around the fact that the template -->
<!-- still basically "expects" to be processing that kind of a node, the -->
<!-- "offset" parameter was added and the "section" variable was changed to -->
<!-- a parameter so that when called for a generated title on a Refnamediv -->
<!-- or Refsynopsisdiv, we can call it like this: -->
<!-- -->
<!--     <xsl:call-template name="format.refentry.subheading"> -->
<!--       <xsl:with-param name="section" select="self::*"/> -->
<!--       <xsl:with-param name="offset" select="1"/> -->
<!--       <xsl:with-param name="gentext.key" select="'RefName'"/> -->
<!--     </xsl:call-template> -->
<!-- -->
  <xsl:param name="section" select="parent::*"/>
  <xsl:param name="offset" select="0"/>
  <xsl:param name="gentext.key"/>

  <fo:block keep-with-next.within-column="always">
    <xsl:variable name="id">
      <xsl:call-template name="object.id">
        <xsl:with-param name="object" select="$section"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="level">
      <xsl:call-template name="section.level">
        <xsl:with-param name="node" select="$section"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="title">
      <!-- If we have a non-empty value for the $gentext.key param, then we -->
      <!-- generate an appropriate title here. Otherwise, we have a real -->
      <!-- title child, so we copy contents of that to the result tree. -->
      <xsl:choose>
        <xsl:when test="$gentext.key != ''">
          <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="$gentext.key"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="$section" mode="object.title.markup">
            <xsl:with-param name="allow-anchors" select="1"/>
          </xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:if test="$passivetex.extensions != 0">
      <fotex:bookmark xmlns:fotex="http://www.tug.org/fotex" 
                      fotex-bookmark-level="{$level + 2 + $offset}" 
                      fotex-bookmark-label="{$id}">
        <xsl:value-of select="$title"/>
      </fotex:bookmark>
    </xsl:if>

    <xsl:if test="$axf.extensions != 0">
      <xsl:attribute name="axf:outline-level">
        <xsl:value-of select="count(ancestor::*)-1 + $offset"/>
      </xsl:attribute>
      <xsl:attribute name="axf:outline-expand">false</xsl:attribute>
      <xsl:attribute name="axf:outline-title">
        <xsl:value-of select="$title"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:call-template name="section.heading">
      <xsl:with-param name="level" select="$level + $offset"/>
      <xsl:with-param name="title" select="$title"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- ==================================================================== -->

</xsl:stylesheet>
