#!/bin/bash

version=$(<version.txt)
volume=$(<volume.txt)
target=$(<target.txt)


if [[ -z $(docker images -q mongo:$version) ]]; then
   echo "No Mongo:$version image found. Pulling from docker hub"
   docker pull mongo:$version
   
else
    echo "Found already existing image mongo:$version"
   
fi
sudo docker run -d -p 27017:27017 -v $volume:$target mongo:$version

