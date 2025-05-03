#!/bin/bash

normal_dir="../data/processed/normal"
pneumonia_dir="../data/processed/pneumonia"
target_dir="../data/raw/x-ray-pneumonia-data"

# Ensure destination directories exist
mkdir -p "$normal_dir"
mkdir -p "$pneumonia_dir"


for data in "$target_dir"/*; do
    if [[ "$data" == "$target_dir"/data[1-6] ]]; then
        filename="${data##*/}"

        for data1 in "$data/chest_xray"/*; do
            echo "$filename processing"
            if [ "$data1" = "$data/chest_xray/test" ]; then

                # go through test
                for types in "$data1"/*; do

                    if [ "$types" = "$data1/NORMAL" ]; then
                        echo "$filename test normal processing"
                        # move all normal files to destination
                        # mv "$types"/* "$normal_dir"

                        # using copy for test purposes
                        cp "$types"/* "$normal_dir"
                    else
                        echo "$filename test pneumonia processing"
                        # move all pneumonia files to destination
                        # mv "$types"/* "$pneumonia_dir"

                        # using copy for test purposes
                        cp "$types"/* "$pneumonia_dir"
                    fi
                done

            else
                for types in "$data1"/*; do
                    if [ "$types" = "$data1/NORMAL" ]; then
                        echo "$filename train normal processing"
                        # move all normal files to destination
                        # mv "$types"/* "$normal_dir"

                        # using copy for test purposes
                        cp "$types"/* "$normal_dir"
                    else
                        echo "$filename train pneumonia processing"
                        # move all pneumonia files to destination
                        # mv "$types"/* "$pneumonia_dir"

                        # using copy for test purposes
                        cp "$types"/* "$pneumonia_dir"
                    fi
                done
            fi
        done
    fi

    echo "Done"
done

echo "Finished processing all files."
exit 0