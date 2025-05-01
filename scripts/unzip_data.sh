# script to unzip data

#!/bin/bash

# Set the directory containing the zip files
zip_dir="../data/raw"

# Check if the directory is provided
if [ -z "$zip_dir" ]; then
  echo "Usage: $0 <zip_directory>"
  exit 1
fi

# Check if the directory exists
if [ ! -d "$zip_dir" ]; then
  echo "Error: Directory '$zip_dir' not found."
  exit 1
fi

# Loop through all zip files in the directory
for zip_file in "$zip_dir"/*.zip; do
  # Check if the file exists
  if [ -f "$zip_file" ]; then
    # Extract the filename without the extension
    file_name=$(basename "$zip_file" .zip)
    
    # Create a directory with the same name as the zip file
    mkdir -p "$zip_dir/$file_name"
    
    # Unzip the file into the newly created directory
    unzip -o "$zip_file" -d "$zip_dir/$file_name"
    
    # Check if the unzip command was successful
    if [ $? -eq 0 ]; then
      echo "Successfully extracted '$zip_file' to '$zip_dir/$file_name'."
    else
      echo "Error: Failed to extract '$zip_file'."
    fi
  else
    echo "Warning: File '$zip_file' not found."
  fi
done

echo "Finished processing all zip files."
exit 0

