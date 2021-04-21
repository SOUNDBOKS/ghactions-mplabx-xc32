#!/bin/sh

HARMONY_PATH=/opt/harmony/v2_02_00b/
PROJECT_PATH=/

if [ "$3" -eq "0" ]
  then
    PROJECT_PATH=/
else
  PROJECT_PATH=$HARMONY_PATH/apps/$3
  cp -r $1 $PROJECT_PATH$1
  cp -r src $PROJECT_PATH/src
fi

echo "Docker Container Building $1:$2"

set -x -e

/opt/mplabx/mplab_platform/bin/prjMakefilesGenerator.sh $PROJECT_PATH$1@$2 || exit 1
make -C $PROJECT_PATH CONF=$2 build || exit 2
