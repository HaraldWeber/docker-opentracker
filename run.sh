#!/bin/bash
#
# This script runs the docker-opentracker container and binds the tcp port 6969 to 6969

NAME=$1
if [[ -z $NAME ]]
then
    NAME=opentracker
fi

if docker images | grep -q $NAME 
then
    echo $NAME exists
    docker run -p 6969:6969 -d $NAME
else
    echo Image $NAME does not exist.
    exit -1
fi
