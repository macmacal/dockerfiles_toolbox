#!/bin/zsh
set -e

echo "source '/opt/ros/foxy/setup.zsh' && \
      echo '[ROS2] Sourced ROS2 ${ROS_DISTRO}' && \
      source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh" >> ~/.zshrc

exec "$@"
