#!/bin/bash

source ./table_names

mkdir -p data/
cd data/

wget -O coastlines.zip http://data.openstreetmapdata.com/coastlines-split-4326.zip
wget -O land.zip http://data.openstreetmapdata.com/land-polygons-complete-4326.zip
wget -O water.zip http://data.openstreetmapdata.com/water-polygons-split-4326.zip

unzip coastlines.zip
unzip land.zip
unzip water.zip

rm -rf coastlines.zip land.zip water.zip

mv coastlines-split-4326/lines.shp ${COASTLINE_NAME}.shp
mv coastlines-split-4326/lines.prj ${COASTLINE_NAME}.prj
mv coastlines-split-4326/lines.dbf ${COASTLINE_NAME}.dbf
mv coastlines-split-4326/lines.shx ${COASTLINE_NAME}.shx

mv land-polygons-complete-4326/land_polygons.shp ${LANDMASS_NAME}.shp
mv land-polygons-complete-4326/land_polygons.prj ${LANDMASS_NAME}.prj
mv land-polygons-complete-4326/land_polygons.dbf ${LANDMASS_NAME}.dbf
mv land-polygons-complete-4326/land_polygons.shx ${LANDMASS_NAME}.shx

mv water-polygons-split-4326/water_polygons.shp ${WATER_NAME}.shp
mv water-polygons-split-4326/water_polygons.prj ${WATER_NAME}.prj
mv water-polygons-split-4326/water_polygons.dbf ${WATER_NAME}.dbf
mv water-polygons-split-4326/water_polygons.shx ${WATER_NAME}.shx

rm -rf coastlines-split-4326/ land-polygons-complete-4326/ water-polygons-split-4326
