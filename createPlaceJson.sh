#!/bin/bash

curl -O "https://term.museum-digital.de/dumps/museum-digital/places_json_de.zip" && mkdir places_json_de && unzip places_json_de.zip -d places_json_de &&

echo "Data downloaded and unzipped."

echo "Extract and convert into data.json"
for f in places_json_de/*.json
  do jq '{id, name,latitude,longitude,note}' "$f" 2>/dev/null
done | jq -s '.' > data.json &&

echo "Generated data.json"

echo "Cleaning up ..."
rm -r places_json_de
#rm places_json_de.zip

echo "Done!"

