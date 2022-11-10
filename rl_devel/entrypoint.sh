#!/bin/bash
set -e

tensorboard --logdir=~/ray_results & > /dev/null
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/.mujoco/mujoco210/bin
jupyter lab --no-browser

exec "$@"
