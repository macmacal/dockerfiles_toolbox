#!/bin/sh
set -e

jupyter lab --no-browser

exec "$@"
