#!/bin/sh
mkdir -p data/
cd data/
wget -O coastlines.zip http://data.openstreetmapdata.com/coastlines-split-4326.zip
wget -O land.zip http://data.openstreetmapdata.com/land-polygons-complete-4326.zip
wget -O water.zip http://data.openstreetmapdata.com/water-polygons-split-4326.zip
unzip coastlines.zip
unzip land.zip
unzip water.zip
rm -rf coastlines.zip land.zip water.zip
mv coastlines-split-4326/lines.shp coastlines.shp
mv coastlines-split-4326/lines.prj coastlines.prj
mv coastlines-split-4326/lines.dbf coastlines.dbf
mv coastlines-split-4326/lines.shx coastlines.shx
mv land-polygons-complete-4326/land_polygons.* .
mv water-polygons-split-4326/water_polygons.* .
rm -rf coastlines-split-4326/ land-polygons-complete-4326/ water-polygons-split-4326
