#!/bin/bash

TAR="/home/qiujw/hadoop_change/hadoop-2.0.0-cdh4.2.1.tar.gz"

HOME_DIR=$(cd $(dirname "$0"); pwd)
echo $HOME_DIR

BUILD_DIR=$HOME_DIR/build
mkdir -p $BUILD_DIR

SRC_DIR=$BUILD_DIR/hadoop-2.0.0-cdh4.2.1/src

if [ ! -d "$SRC_DIR" ] 
then
    echo "untar the tar file"
    cd $BUILD_DIR
    tar -zxf $TAR 
    cd $SRC_DIR
    #git init-db
    #git add *
fi

cd $SRC_DIR
for file in `ls $HOME_DIR/patch`
do
    echo "applying patch : $file "
    git apply  --whitespace=nowarn $HOME_DIR/patch/$file
done



