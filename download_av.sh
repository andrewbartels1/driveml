 #!/usr/bin/env zsh
# Filename: /home/andrew/dev/driveml/download_av.sh
# Path: /home/andrew/dev/driveml
# Created Date: Monday, September 9th 2024, 12:50:10 pm
# Author: bartelsaa
# 
# Copyright (c) 2024 Georgia Institute of Technology

# Dataset URIs
# s3://argoverse/datasets/av2/sensor/ 
# s3://argoverse/datasets/av2/lidar/
# s3://argoverse/datasets/av2/motion-forecasting/
# s3://argoverse/datasets/av2/tbv/
test='sensor lidar motion-forecasting tbv'
for element in ${(ps: :)test}; do 

echo ${element}
export DATASET_NAME="${element}"  # sensor, lidar, motion-forecasting or tbv.
export TARGET_DIR="/media/data/argoverse/datasets/av2/$DATASET_NAME"  # Target directory on your machine.

echo $DATASET_NAME 
echo $TARGET_DIR

s5cmd --no-sign-request cp "s3://argoverse/datasets/av2/$DATASET_NAME/*" $TARGET_DIR

done
