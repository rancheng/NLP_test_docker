#!/bin/bash

file_dir=`dirname $0`

# get parameter from system
user=`id -un`
group=`id -gn`
uid=`id -u`
gid=`id -g`

readonly SCRIPT_DIR=$(dirname "$(readlink -f "${BASH_SOURCE}")") 

# build docker images
docker build -t ${user}/nlp_test_env \
    --build-arg USER=${user} \
    --build-arg UID=${uid} \
    --build-arg GROUP=${group} \
    --build-arg GID=${gid} \
    ${file_dir}