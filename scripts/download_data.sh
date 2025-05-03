#!/bin/bash

TARGET_DIR="../data/raw"

mkdir -p "$TARGET_DIR"

curl -L -o "$TARGET_DIR/x-ray-pneumonia-data.zip"\
  https://www.kaggle.com/api/v1/datasets/download/jijivishaphuoc/x-ray-pneumonia-data

