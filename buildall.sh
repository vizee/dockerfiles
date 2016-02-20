#! /bin/bash

set -e

for d in `ls -d */`
do
    if [ -f "$d"build.sh ]; then
        . "$d"/build.sh
    elif [ -f "$d"Dockerfile ]; then
        name=${d:0:-1}
        echo buiding image $name
        #docker build -t vizee/$name $d
    fi
done
