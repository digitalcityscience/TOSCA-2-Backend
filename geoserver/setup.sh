!/bin/bash

GEOSERVER_URL="https://sourceforge.net/projects/geoserver/files/GeoServer/2.23.1/geoserver-2.23.1-bin.zip"
GEOSERVER_ZIP="./installation_files/geoserver.zip"

# Download GeoServer
curl -L -o $GEOSERVER_ZIP  $GEOSERVER_URL

# Download Vector Tiles Plugin
VECTOR_TILES_URL="https://build.geoserver.org/geoserver/2.23.x/ext-latest/geoserver-2.23-SNAPSHOT-vectortiles-plugin.zip"
VECTOR_TILES_ZIP="./installation_files/vectortiles.zip"
curl -L -o $VECTOR_TILES_ZIP $VECTOR_TILES_URL


echo "Downloads completed successfully."