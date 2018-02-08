<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:lido="http://www.lido-schema.org" xmlns:gml="http://www.opengis.net/gml"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Last updated on:</xd:b> Feb 27, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> yg42</xd:p>
            <xd:p>LIDO to VuFind Solr Fields</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output encoding="UTF-8" indent="yes" method="xml" omit-xml-declaration="no" version="1.0"/>

    <xsl:strip-space elements="*"/>

    <!-- parameters set by user -->
    <xsl:param name="repository"/>
    <xsl:param name="set"/>
    <xsl:param name="setString"/>

    <!-- variables set by user -->
    <xsl:variable name="access">
        <xsl:choose>
            <!-- 
                <xsl:when test="$repository='YUAG'">
                <xsl:text>Open access</xsl:text>
                </xsl:when>
            -->
            <xsl:when test="$repository='lidoYCBA'">
                <xsl:text>Open access</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>

    <xsl:template match="lido:lido">
        <xsl:element name="metadata">
            <xsl:call-template name="institution">
                <xsl:with-param name="repository" select="$repository"/>
            </xsl:call-template>
            <xsl:call-template name="collection">
                <xsl:with-param name="set" select="$set"/>
            </xsl:call-template>
            <xsl:call-template name="record_complete">
                <xsl:with-param name="setString" select="$setString"/>
            </xsl:call-template>
            
            <xsl:for-each select="lido:descriptiveMetadata">
                <xsl:call-template name="building"/>
                <!-- includes building, building_subSite, building_floor, building_bay -->
                <xsl:call-template name="type"/>
                <xsl:call-template name="format"/>
                <!-- includes format, auth_format -->
                <xsl:call-template name="author"/>
                <!-- includes author, auth_author, author_nationality, author_earliestDate, author_latestDate, 
                    author_gender, author_role, author_deathPlaceName, author_deathPlaceCoordinates, 
                    author_birthPlaceName, author_birthPlaceCoordinates, author_placeOfActivityName, 
                    author_placeOfActivityCoordinates, author_placeOfVisitName, author_placeOfVisitCoordinates -->
                <xsl:call-template name="title"/>
                <!-- includes title, title_sort, title_short, title_full -->
                <xsl:call-template name="physical"/>
                <!-- includes physical, physical_heightUnit, physical_heightValue, physical_widthUnit, 
                    physical_widthValue, physical_depthUnit, physical_depthValue, physical_diameterUnit, 
                    physical_diameterValue, physical_weightUnit, physical_weightValue -->
                <xsl:call-template name="publishDate"/>
                <xsl:call-template name="edition"/>
                <xsl:call-template name="description"/>
                <xsl:call-template name="callnumber"/>
                <xsl:call-template name="title_alt"/>
                <xsl:call-template name="title_collective"/>
                <xsl:call-template name="earliestDate"/>
                <xsl:call-template name="latestDate"/>
                <xsl:call-template name="topic"/>
                <!-- includes topic, topic_actor, topic_frameStyle, topic_frameAlteration, topic_frameCrossSection, 
                    topic_frameFeature, topic_frameOrnament, topic_frameStatus, topic_frameQuality -->
                <xsl:call-template name="genre"/>
                <!-- includes genre (merges genre_name and object_name), genre_name (names of genres), object_name (names of objects) -->
                <xsl:call-template name="geographic"/>
                <!-- includes geographic (merges all fields), geographic_continent, geographic_country, geographic_stateProvince, 
                    geographic_county, geographic_locality -->
                <xsl:call-template name="geographic_culture"/>
                <xsl:call-template name="geographic_gis"/>
                <!-- coordinates for smallest political entity or first if political entity not designated -->
                <xsl:call-template name="era"/>
                <xsl:call-template name="eventType"/>

                <xsl:call-template name="topic_subjectActor"/>
                <xsl:call-template name="topic_subjectConcept"/>
                <xsl:call-template name="topic_subjectEvent"/>
                <xsl:call-template name="topic_subjectObject"/>
                <xsl:call-template name="topic_subjectPlace"/>

                <xsl:call-template name="oclc_number"/>
                <xsl:call-template name="citation"/>
            </xsl:for-each>
            <xsl:for-each select="lido:administrativeMetadata">
                <xsl:call-template name="credit_line"/>
                <xsl:call-template name="rights"/>
                <xsl:call-template name="rights_resource"/>
                <xsl:call-template name="resource"/>
                <xsl:call-template name="access"/>
                <xsl:call-template name="url"/>
                <xsl:call-template name="thumbnail"/>
                <xsl:call-template name="resourceURL"/>
                <xsl:call-template name="recordSource"/>
                <xsl:call-template name="recordID"/>
                <xsl:call-template name="recordLevel"/>
                <xsl:element name="cds_repository_code_s">YCBA</xsl:element>
                <xsl:call-template name="cds_object_id"/>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template name="cds_object_id">
        <xsl:for-each select="lido:recordWrap/lido:recordID/text()">
            <xsl:element name="cds_object_id_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="institution">
        <xsl:param name="repository"/>
        <xsl:element name="institution_facet">          
            <xsl:choose>
                <xsl:when test="$repository='lidoYCBA'">
                    <xsl:text>Yale Center for British Art</xsl:text>
                </xsl:when>
                <!-- 
                    <xsl:when test="$repository='YUAG'">
                    <xsl:text>Yale University Art Gallery</xsl:text>
                    </xsl:when>
                -->
            </xsl:choose>
        </xsl:element>
        <xsl:element name="institution_t">          
            <xsl:choose>
                <xsl:when test="$repository='lidoYCBA'">
                    <xsl:text>Yale Center for British Art</xsl:text>
                </xsl:when>
                <!-- 
                    <xsl:when test="$repository='YUAG'">
                    <xsl:text>Yale University Art Gallery</xsl:text>
                    </xsl:when>
                -->
            </xsl:choose>
        </xsl:element>
    </xsl:template>

  	<xsl:template name="record_complete">
  	 	<xsl:param name="setString"/>
     		<xsl:choose>
            	<xsl:when test="contains($setString, 'incomplete')">     	
                	<xsl:element name="record_complete_facet">
                    	<xsl:text>Incompelete</xsl:text>
            		</xsl:element>
            	</xsl:when> 
            	<xsl:otherwise>
                 	<xsl:element name="record_complete_facet">
                    	<xsl:text>Complete</xsl:text>
            		</xsl:element>
            	</xsl:otherwise>    
     		</xsl:choose>
  	</xsl:template>

    <xsl:template name="collection">
        <xsl:param name="set"/>
        <xsl:choose>
            <xsl:when test="$set='ycba:ps'">
                <xsl:element name="collection_facet">
                    <xsl:text>Paintings and Sculpture</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ycba:frames'">
                <xsl:element name="collection_facet">
                    <xsl:text>Frames</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ycba:pd'">
                <xsl:element name="collection_facet">
                    <xsl:text>Prints and Drawings</xsl:text>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$set='ycba:ps'">
                <xsl:element name="collection_t">
                    <xsl:text>Paintings and Sculpture</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ycba:frames'">
                <xsl:element name="collection_t">
                    <xsl:text>Frames</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$set='ycba:pd'">
                <xsl:element name="collection_t">
                    <xsl:text>Prints and Drawings</xsl:text>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="building">
        <xsl:for-each
            select="lido:objectIdentificationWrap/lido:repositoryWrap/lido:repositorySet/lido:repositoryLocation/lido:partOfPlace/lido:namePlaceSet/lido:appellationValue">
            <xsl:choose>
                <xsl:when test="@lido:label='Site'">
                    <xsl:element name="building_facet">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@lido:label='SubSite'">
                    <xsl:element name="building_subSite_facet">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@lido:label='Floor'">
                    <xsl:element name="building_floor_facet">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@lido:label='UnitType'">
                    <xsl:element name="building_bay_facet">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="@lido:label='Site'">
                    <xsl:element name="building_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@lido:label='SubSite'">
                    <xsl:element name="building_subSite_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@lido:label='Floor'">
                    <xsl:element name="building_floor_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="@lido:label='UnitType'">
                    <xsl:element name="building_bay_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="type">
        <xsl:for-each
            select="lido:objectClassificationWrap/lido:classificationWrap/lido:classification/lido:term">
            <xsl:element name="type_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="type_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="format">
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event/lido:eventMaterialsTech/lido:displayMaterialsTech">
            <xsl:element name="format_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event/lido:eventMaterialsTech/lido:materialsTech/lido:termMaterialsTech/lido:term">
            <xsl:element name="auth_format_t">
            </xsl:element>
            <xsl:element name="auth_format_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="author">
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event[lido:eventType/lido:term='production']">
            <!-- <xsl:for-each select="lido:eventActor[1]/lido:actorInRole/lido:actor/lido:nameActorSet/lido:appellationValue[@lido:pref='preferred'][1]"> -->
            <xsl:for-each select="lido:eventActor/lido:displayActorInRole">
                <xsl:element name="author_t">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="lido:eventActor">
                <xsl:for-each select="lido:actorInRole">
                    <xsl:for-each select="lido:actor">
                        <xsl:for-each
                            select="lido:nameActorSet/lido:appellationValue[@lido:pref='alternate']">
                            <xsl:element name="auth_author_facet">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                            <xsl:element name="auth_author_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>                       
                        <xsl:for-each
                            select="lido:nameActorSet/lido:appellationValue[@lido:pref='preferred'][1]">
                            <xsl:element name="auth_author_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                            <xsl:element name="auth_author_facet">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:nationalityActor/lido:term">
                            <xsl:element name="author_nationality_facet">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:vitalDatesActor/lido:earliestDate">
                            <xsl:element name="author_earliestDate_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:vitalDatesActor/lido:latestDate">
                            <xsl:element name="author_latestDate_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:genderActor">
                            <xsl:element name="author_gender_facet">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:for-each>
                    <xsl:for-each
                        select="lido:roleActor[lido:conceptID/@lido:type='Life role']/lido:term">
                        <xsl:element name="author_role_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="lido:eventPlace[@lido:type='Death place']/lido:place">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="author_deathPlaceName_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="lido:gml/gml:Point/gml:coordinates">
                    <xsl:element name="author_deathPlaceCoordinates_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="lido:eventPlace[@lido:type='Birth place']/lido:place">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="author_birthPlaceName_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="lido:gml/gml:Point/gml:coordinates">
                    <xsl:element name="author_birthPlaceCoordinates_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each
                select="lido:eventPlace[@lido:type='Place of Activity']/lido:place">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="author_placeOfActivityName_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="lido:gml/gml:Point/gml:coordinates">
                    <xsl:element name="author_placeOfActivityCoordinates_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each
                select="lido:eventPlace[@lido:type='Place of Visit/Tour']/lido:place">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="author_placeOfVisitName_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="lido:gml/gml:Point/gml:coordinates">
                    <xsl:element name="author_placeOfVisitCoordinate_t">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="title">
        <xsl:for-each
            select="lido:objectIdentificationWrap/lido:titleWrap/lido:titleSet[@lido:type='Repository title']/lido:appellationValue[@lido:pref='preferred']">
            <xsl:element name="title_s">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element> 
            <xsl:element name="title_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element> 
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="physical">
        <xsl:for-each
            select="lido:objectIdentificationWrap/lido:objectMeasurementsWrap/lido:objectMeasurementsSet">
            <xsl:for-each select="lido:displayObjectMeasurements">
                <xsl:element name="physical_t">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="lido:objectMeasurements/lido:measurementsSet">
                <xsl:choose>
                    <xsl:when test="lido:measurementType='height'">
                        <xsl:for-each select="lido:measurementUnit">
                            <xsl:element name="physical_heightUnit_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:measurementValue">
                            <xsl:element name="physical_heightValue_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="lido:measurementType='width'">
                        <xsl:for-each select="lido:measurementUnit">
                            <xsl:element name="physical_widthUnit_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:measurementValue">
                            <xsl:element name="physical_widthValue_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="lido:measurementType='depth'">
                        <xsl:for-each select="lido:measurementUnit">
                            <xsl:element name="physical_depthUnit_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:measurementValue">
                            <xsl:element name="physical_depthValue_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="lido:measurementType='diameter'">
                        <xsl:for-each select="lido:measurementUnit">
                            <xsl:element name="physical_diameterUnit_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:measurementValue">
                            <xsl:element name="physical_diameterValue_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="lido:measurementType='weight'">
                        <xsl:for-each select="lido:measurementUnit">
                            <xsl:element name="physical_weightUnit_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                        <xsl:for-each select="lido:measurementValue">
                            <xsl:element name="physical_weightValue_t">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="publishDate">
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event[lido:eventType/lido:term='production']/lido:eventDate/lido:displayDate">
            <xsl:element name="publishDate_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="edition">
        <xsl:for-each select="lido:objectIdentificationWrap/lido:displayStateEditionWrap">
            <xsl:for-each select="displayState|displayEdition">
                <xsl:element name="edition_t">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="description">
        <xsl:for-each
            select="lido:objectIdentificationWrap/lido:inscriptionsWrap/lido:inscriptions/lido:inscriptionTranscription">
            <xsl:if test=".!=''">
                <xsl:element name="description_t">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="credit_line">
        <xsl:for-each select="lido:rightsWorkWrap/lido:rightsWorkSet/lido:creditLine">
            <xsl:element name="credit_line_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="rights">
        <xsl:for-each
            select="lido:rightsWorkWrap/lido:rightsWorkSet[lido:rightsType/lido:conceptID/@lido:type='object copyright']/lido:rightsHolder/lido:legalBodyName/lido:appellationValue">
            <xsl:element name="rights_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="rights_resource">
        <xsl:for-each
            select="lido:resourceWrap/lido:resourceSet/lido:rightsResource/lido:rightsHolder/lido:legalBodyID[@lido:type='url']">
            <xsl:element name="rights_resource_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="resource">
        <xsl:element name="resource_facet">
            <xsl:choose>
                <xsl:when
                    test="lido:resourceWrap/lido:resourceSet/lido:resourceRepresentation/lido:linkResource">
                    <xsl:text>Resource available online</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Resource not available online</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
        <xsl:element name="resource_t">
            <xsl:choose>
                <xsl:when
                    test="lido:resourceWrap/lido:resourceSet/lido:resourceRepresentation/lido:linkResource">
                    <xsl:text>Resource available online</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Resource not available online</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xsl:template name="access">
        <xsl:if
            test="lido:resourceWrap/lido:resourceSet/lido:resourceRepresentation/lido:linkResource">
            <xsl:element name="access_facet">
                <xsl:value-of select="$access"/>
            </xsl:element>
            <xsl:element name="access_t">
                <xsl:value-of select="$access"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template name="url">
        <xsl:for-each
            select="lido:recordWrap/lido:recordInfoSet/lido:recordInfoLink[@lido:formatResource='html']">
            <xsl:element name="url_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="thumbnail">
        <xsl:for-each
            select="lido:resourceWrap/lido:resourceSet/lido:resourceRepresentation[@lido:type='thumb']/lido:linkResource">
            <xsl:element name="thumbnail_s">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="resourceURL">
        <xsl:for-each
            select="lido:resourceWrap/lido:resourceSet/lido:resourceRepresentation[@lido:type='large']/lido:linkResource">
            <xsl:element name="resourceURL_s">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="callnumber">
        <xsl:for-each
            select="lido:objectIdentificationWrap/lido:repositoryWrap/lido:repositorySet/lido:workID[@lido:type='inventory number']">
            <xsl:element name="callnumber_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="title_alt">
        <xsl:for-each
            select="lido:objectIdentificationWrap/lido:titleWrap/lido:titleSet[not(@lido:type='collective title')]/lido:appellationValue[@lido:pref='alternate']">
            <xsl:element name="title_alt_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="title_collective">
        <xsl:for-each
            select="lido:objectIdentificationWrap/lido:titleWrap/lido:titleSet[@lido:type='Collective title']/lido:appellationValue[@lido:pref='alternate']">
            <xsl:element name="title_collective_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="earliestDate">
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event[lido:eventType/lido:term='production']/lido:eventDate/lido:date/lido:earliestDate">
            <xsl:element name="earliestDate_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="latestDate">
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event[lido:eventType/lido:term='production']/lido:eventDate/lido:date/lido:latestDate">
            <xsl:element name="latestDate_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="topic">
        <xsl:for-each select="lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject">
            <xsl:choose>
                <xsl:when test="@lido:type='iconography'">
                    <xsl:for-each select="lido:subjectConcept/lido:term">
                        <xsl:element name="topic_facet">>
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="@lido:type='description'">
                    <xsl:for-each select="lido:subjectConcept[lido:conceptID/@lido:type='frame style']/lido:term">
                        <xsl:element name="topic_frameStyle_facet">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_frameStyle_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>

                    <xsl:for-each select="lido:subjectConcept[lido:conceptID/@lido:type='frame alteration']/lido:term">
                        <xsl:element name="topic_frameAlteration_facet">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_frameAlteration_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>

                    <xsl:for-each select="lido:subjectConcept[lido:conceptID/@lido:type='frame cross-section']/lido:term">
                        <xsl:element name="topic_frameCrossSection_facet">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_frameCrossSection_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>

                    <xsl:for-each select="lido:subjectConcept[lido:conceptID/@lido:type='frame feature']/lido:term">
                        <xsl:element name="topic_frameFeature_facet">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_frameFeature_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>

                    <xsl:for-each select="lido:subjectConcept[lido:conceptID/@lido:type='frame ornament']/lido:term">
                        <xsl:element name="topic_frameOrnament_facet">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_frameOrnament_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>

                    <xsl:for-each select="lido:subjectConcept[lido:conceptID/@lido:type='frame status']/lido:term">
                        <xsl:element name="topic_frameStatus_facet">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_frameStatus_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>

                    <xsl:for-each select="lido:subjectConcept[lido:conceptID/@lido:type='frame quality']/lido:term">
                        <xsl:element name="topic_frameQuality_facet">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                        <xsl:element name="topic_frameQuality_t">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="genre">
        <xsl:for-each
            select="lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType">
            <xsl:if test="string-length(lido:term) != 0">
            <xsl:element name="genre_t">
                <xsl:value-of select="normalize-space(lido:term)"/>
            </xsl:element>
            <xsl:element name="genre_facet">
                <xsl:value-of select="normalize-space(lido:term)"/>
            </xsl:element>
            </xsl:if>
            
            <xsl:choose>       
                <xsl:when test="lido:conceptID/@lido:type='Genre'"> 
                    <xsl:if test="string-length(lido:term) != 0">
                    <xsl:element name="genre_name_t">
                        <xsl:value-of select="normalize-space(lido:term)"/>
                    </xsl:element>
                    <xsl:element name="genre_name_facet">
                        <xsl:value-of select="normalize-space(lido:term)"/>
                    </xsl:element>
                    </xsl:if> 
                </xsl:when>              
                <xsl:when test="lido:conceptID/@lido:type='Object name'">
                    <xsl:if test="string-length(lido:term) != 0">
                    <xsl:element name="object_name_t">
                        <xsl:value-of select="normalize-space(lido:term)"/>
                    </xsl:element>
                    <xsl:element name="object_name_facet">
                        <xsl:value-of select="normalize-space(lido:term)"/>
                    </xsl:element>
                    </xsl:if> 
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="geographic">
        <xsl:for-each
            select="lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject[@lido:type='subjectPlace']/lido:subjectPlace/lido:place">
            <!--
            <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                <xsl:element name="geographic">
                    <xsl:attribute name="analyze">true</xsl:attribute>
                    <xsl:attribute name="store">true</xsl:attribute>
                    <xsl:attribute name="facet">true</xsl:attribute>
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:for-each>

            <xsl:if test="@lido:politicalEntity='continent'">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="geographic_continent">
                        <xsl:attribute name="analyze">true</xsl:attribute>
                        <xsl:attribute name="store">true</xsl:attribute>
                        <xsl:attribute name="facet">true</xsl:attribute>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="@lido:politicalEntity='country'">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="geographic_country">
                        <xsl:attribute name="analyze">true</xsl:attribute>
                        <xsl:attribute name="store">true</xsl:attribute>
                        <xsl:attribute name="facet">true</xsl:attribute>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="@lido:politicalEntity='state' or @lido:politicalEntity='province'">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="geographic_stateProvince">
                        <xsl:attribute name="analyze">true</xsl:attribute>
                        <xsl:attribute name="store">true</xsl:attribute>
                        <xsl:attribute name="facet">true</xsl:attribute>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="@lido:politicalEntity='county'">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="geographic_county">
                        <xsl:attribute name="analyze">true</xsl:attribute>
                        <xsl:attribute name="store">true</xsl:attribute>
                        <xsl:attribute name="facet">true</xsl:attribute>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="@lido:politicalEntity='locality'">
                <xsl:for-each select="lido:namePlaceSet/lido:appellationValue">
                    <xsl:element name="geographic_locality">
                        <xsl:attribute name="analyze">true</xsl:attribute>
                        <xsl:attribute name="store">true</xsl:attribute>
                        <xsl:attribute name="facet">true</xsl:attribute>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:if>
            -->
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="geographic_gis">
        <xsl:for-each select="lido:objectRelationWrap/lido:subjectWrap">
            <xsl:variable name="gis">
                <xsl:choose>
                    <xsl:when
                        test="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='locality']/lido:gml/gml:Point/gml:coordinates!=''">
                        <xsl:for-each
                            select="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='locality'][lido:gml/gml:Point/gml:coordinates!=''][1]">
                            <xsl:value-of select="normalize-space(lido:gml/gml:Point/gml:coordinates)"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when
                        test="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='county']/lido:gml/gml:Point/gml:coordinates!=''">
                        <xsl:for-each
                            select="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='county'][lido:gml/gml:Point/gml:coordinates!=''][1]">
                            <xsl:value-of select="normalize-space(lido:gml/gml:Point/gml:coordinates)"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when
                        test="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='state' or @lido:politicalEntity='province']/lido:gml/gml:Point/gml:coordinates!=''">
                        <xsl:for-each
                            select="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='state' or @lido:politicalEntity='province'][lido:gml/gml:Point/gml:coordinates!=''][1]">
                            <xsl:value-of select="normalize-space(lido:gml/gml:Point/gml:coordinates)"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when
                        test="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='country']/lido:gml/gml:Point/gml:coordinates!=''">
                        <xsl:for-each
                            select="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='country'][lido:gml/gml:Point/gml:coordinates!=''][1]">
                            <xsl:value-of select="normalize-space(lido:gml/gml:Point/gml:coordinates)"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when
                        test="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='continent']/lido:gml/gml:Point/gml:coordinates!=''">
                        <xsl:for-each
                            select="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[@lido:politicalEntity='continent'][lido:gml/gml:Point/gml:coordinates!=''][1]">
                            <xsl:value-of select="normalize-space(lido:gml/gml:Point/gml:coordinates)"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when
                        test="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place/lido:gml/gml:Point/gml:coordinates!=''">
                        <xsl:for-each
                            select="lido:subjectSet/lido:subject[@lido:type='geographicName']/lido:subjectPlace/lido:place[lido:gml/gml:Point/gml:coordinates!=''][1]">
                            <xsl:value-of select="normalize-space(lido:gml/gml:Point/gml:coordinates)"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>none</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:if test="$gis!='none'">
                <xsl:element name="geographic_gis_facet">
                    <xsl:value-of select="$gis"/>
                </xsl:element>
                <xsl:element name="geographic_gis_t">
                    <xsl:value-of select="$gis"/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="geographic_culture">
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event[lido:eventType/lido:term='production']/lido:culture/lido:term">
            <xsl:element name="geographic_culture_facet">           
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="geographic_culture_t">           
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="era">
        <xsl:for-each
            select="lido:eventWrap/lido:eventSet/lido:event[lido:eventType/lido:term='production']/lido:periodName/lido:term">
            <xsl:if test="string-length(.) != 0"> 
            <xsl:element name="era_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="era_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            </xsl:if> 
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="eventType">
        <xsl:for-each select="lido:eventWrap/lido:eventSet/lido:event/lido:eventType/lido:term">
            <xsl:if test=".!='production'">
                <xsl:element name="eventType_t">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
                <xsl:element name="eventType_facet">                
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="recordSource">
        <xsl:for-each select="lido:recordWrap/lido:recordSource/lido:legalBodyWeblink">
            <xsl:element name="recordSource_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="recordID">
        <xsl:for-each select="lido:recordWrap/lido:recordID[@lido:type='local']">
            <xsl:element name="recordID_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="recordLevel">
        <xsl:for-each select="lido:recordWrap/lido:recordType/lido:term">
            <xsl:element name="recordLevel_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="recordLevel_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

     <!--
     2012 September changes
     -->
    <xsl:template name="topic_subjectConcept">
        <xsl:for-each select="lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject[@lido:type='description']/lido:subjectConcept[lido:conceptID/@lido:type='subjectConcept']/lido:term">
            <xsl:element name="topic_subjectConcept_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="topic_subjectActor">
        <xsl:for-each select="lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject[@lido:type='description']/lido:subjectActor/lido:displayActor">
            <xsl:element name="topic_subjectActor_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="topic_subjectEvent">
        <xsl:for-each select="lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject[@lido:type='description']/lido:subjectEvent/lido:event/lido:eventType/lido:term">
            <xsl:element name="topic_subjectEvent_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="topic_subjectPlace">
        <xsl:for-each select="lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject[@lido:type='description']/lido:subjectPlace/lido:displayPlace">
            <xsl:element name="topic_subjectPlace_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="geographic_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="geographic_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="topic_subjectObject">
        <xsl:for-each select="lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject[@lido:type='description']/lido:subjectObject/lido:displayObject">
            <xsl:element name="topic_subjectObject_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="topic_facet">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="oclc_number">
        <xsl:for-each select="lido:objectRelationWrap/lido:relatedWorksWrap/lido:relatedWorkSet/lido:relatedWork/lido:object/lido:objectID[@lido:type='local' and @lido:source='OCLC Number']">
            <xsl:element name="oclc_number_t">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="citation">
        <xsl:for-each select="lido:objectRelationWrap/lido:relatedWorksWrap/lido:relatedWorkSet/lido:relatedWork">
            <xsl:element name="citation_t">
                <xsl:value-of select="normalize-space(lido:displayObject)"/>
                <xsl:value-of select="normalize-space(lido:object/lido:objectNote)"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
