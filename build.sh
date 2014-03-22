#!/bin/bash
#
# This script compiles the opentracker project and builds a docker image

which git 
if [[ $? -ne 0 ]]
then
    echo Install git first
    exit -1
else
    git submodule update --init --recursive
    cd libowfat
    make
    cd ..

#    cvs -d:pserver:anoncvs@cvs.erdgeist.org:/home/cvsroot co opentracker
    cd opentracker
    # Change the Makefile here
    sed -i 's@FEATURES+=-DWANT_FULLSCRAPE@#FEATURES+=-DWANT_FULLSCRAPE@g' Makefile
    sed -i '/^LDFLAGS+=-L$(LIBOWFAT_LIBRARY) -lowfat -pthread -lpthread -lz/ s@$@ -static@' Makefile
    make
    cp opentracker ../docker/opentracker
    cd ..

    cp opentracker.conf docker/opentracker.conf

    cd docker
    NAME=$1
    if [[ -z $NAME ]]
    then
        NAME=opentracker
    fi
    docker build -t $NAME .
fi
