#!/bin/sh

COMPILER_ROOT=/opt/xc32/v3.01/
PROJECT_PATH=$1
MAKE_TARGET=$2
set -x -e

make -j -C $PROJECT_PATH $MAKE_TARGET || exit 2

cp -r $PROJECT_PATH/ /github/workspace/output
