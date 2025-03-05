#!/bin/bash

cd $HOME/krr_ws
curl -O https://raw.githubusercontent.com/kas-lab/krr_bringup/refs/heads/main/dependencies.repos
vcs import --force src < src/krr_bringup/dependencies.repos

rm -rf src/mirte-ros-packages/mirte_telemetrix_cpp/

source "/opt/ros/humble/setup.bash"
colcon build --symlink-install
