#!/bin/bash

HOME_DIR=$(cd $(dirname "$0"); pwd)
echo $HOME_DIR

BUILD_DIR=$HOME_DIR/build
mkdir -p $BUILD_DIR

SRC_DIR=$BUILD_DIR/hadoop-2.0.0-cdh4.2.1/src

if [ ! -d "$SRC_DIR" ] 
then
    echo "src dir is not exist"
    exit 1
fi

cd $SRC_DIR

mvn package -DskipTests >> /dev/null

#pick wanted tar
today=`date +%Y%m%d`

cp hadoop-hdfs-project/hadoop-hdfs/target/hadoop-hdfs-2.0.0-cdh4.2.1.jar  $BUILD_DIR/hadoop-hdfs-2.0.0-cdh4.2.1-${today}.jar 
cp hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-resourcemanager/target/hadoop-yarn-server-resourcemanager-2.0.0-cdh4.2.1.jar $BUILD_DIR/hadoop-yarn-server-resourcemanager-2.0.0-cdh4.2.1-${today}.jar


