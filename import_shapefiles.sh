#!/bin/bash
set -e

COASTLINES=/data/osmboundaries/coastlines.shp
WATER=/data/osmboundaries/water_polygons.shp
LAND=/data/osmboundaries/land_polygons.shp

ogr2ogr_command(){
  ogr2ogr --config PG_USE_COPY YES \
    -f "PostgreSQL" \
    PG:"host=${POSTGRES_HOST} user=${POSTGRES_USER} dbname=${POSTGRES_DB} password=${POSTGRES_PASSWORD}" \
    -overwrite "$1"
}

# ogr2ogr_command=ogr2ogr -f "PostgreSQL" PG:"host=${POSTGRES_HOST} user=${POSTGRES_USER} dbname=${POSTGRES_DB} password=${POSTGRES_PASSWORD}"

echo "importing coastlines"
ogr2ogr_command ${COASTLINES}
echo "coastlines imported"

echo ""
echo "importing water"
ogr2ogr_command ${WATER}
echo "water imported"

echo ""
echo "importing land"
ogr2ogr_command ${LAND}
echo "land imported"

echo "all imports done"
