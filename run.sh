#!/bin/bash

echo "Type the project path followed by [ENTER]:"
read -e project

if [ "$project" == "" ]; then
    echo "Bad project path: " $project
    exit 1
else
    docker run --rm -it -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $project:/home/andrei/project/ \
        rust-alpine:latest
    exit 0
fi
