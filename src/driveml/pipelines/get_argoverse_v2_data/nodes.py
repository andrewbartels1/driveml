"""
This is a boilerplate pipeline 'get_argoverse_v2_data'
generated using Kedro 0.19.8
"""

# put this into a loop and aria2p api interface script
# https://pypi.org/project/aria2p/
# https://pawamoy.github.io/aria2p/

# #!/usr/bin/env bash

# # Dataset URIs
# # s3://argoverse/datasets/av2/sensor/
# # s3://argoverse/datasets/av2/lidar/
# # s3://argoverse/datasets/av2/motion-forecasting/
# # s3://argoverse/datasets/av2/tbv/

# export DATASET_NAME="lidar"  # sensor, lidar, motion_forecasting or tbv.
# export TARGET_DIR=""$HOME/argoverse/datasets/av2/lidar"  # Target directory on your machine.

# s5cmd --no-sign-request cp "s3://argoverse/datasets/av2/$DATASET_NAME/*" $TARGET_DIR
