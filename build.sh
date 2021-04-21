#!/bin/sh

echo "Docker Container Building $1:$2"

set -x -e

cp -r $1 /opt/harmony/v2_02_00b/apps/$1
cp -r src /opt/harmony/v2_02_00b/apps/src

/opt/mplabx/mplab_platform/bin/prjMakefilesGenerator.sh $1@$2 || exit 1
make -C $1 CONF=$2 build || exit 2
