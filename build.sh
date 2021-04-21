#!/bin/sh

HARMONY_PROJECT_PATH=/opt/harmony/v2_02_00b/apps/$1
HARMONY_SRC_PATH=/opt/harmony/v2_02_00b/apps/src

echo "Docker Container Building $1:$2"

set -x -e

cp -r $1 $HARMONY_PROJECT_PATH
cp -r src $HARMONY_SRC_PATH

/opt/mplabx/mplab_platform/bin/prjMakefilesGenerator.sh $HARMONY_PROJECT_PATH@$2 || exit 1
make -C $HARMONY_PROJECT_PATH CONF=$2 build || exit 2
