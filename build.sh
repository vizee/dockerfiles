#! /bin/bash

for d in `ls -d */`
do
    if [ -f "$d"Dockerfile ]; then
        docker build -t vizee/${d:0:-1} $d
    fi
done
