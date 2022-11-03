#!/bin/bash
set -e

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/.mujoco/mujoco210/bin
jupyter lab --no-browser

exec "$@"
