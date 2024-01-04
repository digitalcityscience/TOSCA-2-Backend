# Description: Downloads GeoServer and its dependencies
#!/bin/bash

# Define an associative array to store URL-ZIP=FILE pairs
declare -A FILES
FILES["https://sourceforge.net/projects/geoserver/files/GeoServer/2.23.1/geoserver-2.23.1-bin.zip"]="./installation_files/geoserver.zip"
# Do not forget "extentions" folder for extentions
FILES["https://build.geoserver.org/geoserver/2.23.x/ext-latest/geoserver-2.23-SNAPSHOT-vectortiles-plugin.zip"]="./installation_files/extentions/vectortiles.zip"
FILES["https://build.geoserver.org/geoserver/2.23.x/ext-latest/geoserver-2.23-SNAPSHOT-mbstyle-plugin.zip"]="./installation_files/extentions/mbstyle-plugin.zip"

# Function to check if a file exists
file_exists() {
  [ -e "$1" ]
}

# Iterate through the associative array
for URL in "${!FILES[@]}"; do 
  ZIP_FILE="${FILES[$URL]}"

  # Download file if not already downloaded
  if ! file_exists "$ZIP_FILE"; then
    curl -L -o "$ZIP_FILE" "$URL"
    echo "$ZIP_FILE downloaded successfully."
  else
    echo "$ZIP_FILE already exists. Skipping download."
  fi
done

echo "Downloads completed successfully."
