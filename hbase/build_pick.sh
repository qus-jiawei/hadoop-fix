#!/bin/bash

HOME_DIR=$(cd $(dirname "$0"); pwd)
echo $HOME_DIR

BUILD_DIR=$HOME_DIR/build
mkdir -p $BUILD_DIR

SRC_DIR=$BUILD_DIR/hbase-0.94.2-cdh4.2.1

if [ ! -d "$SRC_DIR" ] 
then
    echo "src dir is not exist"
    exit 1
fi

cd $SRC_DIR

mvn clean package -Dhadoop.profile=23 -DskipTests -Psecurity

#pick wanted tar
today=`date +%Y%m%d`

cp target/hbase-0.94.2-cdh4.2.1-security.jar  $BUILD_DIR/hbase-0.94.2-cdh4.2.1-security-${today}.jar 


