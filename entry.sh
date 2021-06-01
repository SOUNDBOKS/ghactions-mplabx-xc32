#!/bin/sh

HARMONY_ROOT=/opt/harmony/v2_02_00b/
COMPILER_ROOT=/opt/xc32/v2.50/
MPLABX_ROOT=opt/mplabx/

PROJECT_PATH=/

if [ "$3" -eq "0" ]
  then
    PROJECT_PATH=/
else
  PROJECT_PATH=$HARMONY_ROOT/apps/$3
  mkdir -p $PROJECT_PATH
  cp -r $1 $PROJECT_PATH/$1
  cp -r src $PROJECT_PATH/src
fi

ls $HARMONY_ROOT/apps

if [ "$4" == "true" ]
  then
    echo "Docker Container testing"
    cd $PROJECT_PATH
    bundle install
    ceedling test:all
fi

echo "Docker Container Building $1:$2"

set -x -e

/opt/mplabx/mplab_platform/bin/prjMakefilesGenerator.sh $PROJECT_PATH/$1@$2 || exit 1
make -C $PROJECT_PATH/$1 CONF=$2 build || exit 2

cp -r $PROJECT_PATH/$1/ /github/workspace/output
