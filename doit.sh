#!/bin/bash

for i in ubuntu:latest dockerfile/nginx:latest orchardup/php5:latest orchardup/mysql:latest mysql:latest busybox:latest ; do
    COUNT=`date +%s`
    TAG=registry.dockerclass.com/dummy/image_$COUNT
    cat > Dockerfile <<EOF
FROM $i
RUN touch /new_file
EOF
    docker build -t $TAG .
    docker push $TAG
    sleep 1
done
