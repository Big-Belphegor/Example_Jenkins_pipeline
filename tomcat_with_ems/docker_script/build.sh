#!/bin/bash
WAR_PATH=$1
IMAGE_NAME=$2
SCRPIT_PATH=$3
TEMP_IMAGE_NAME="tempimage"

docker build -t $TEMP_IMAGE_NAME -f $SCRPIT_PATH/Dockerfile .
docker run -d --name tmp_container -v /usr/java/jdk1.8.0_111:/usr/local/jdk -p 9999:8080 $TEMP_IMAGE_NAME
docker cp $WAR_PATH tmp_container:/usr/local/tomcat/webapps
docker commit tmp_container $IMAGE_NAME
docker login hub.alien.com:8080 -u alien -p Harbor123456
docker push $IMAGE_NAME
docker rm -f tmp_container
docker rmi $IMAGE_NAME $TEMP_IMAGE_NAME
