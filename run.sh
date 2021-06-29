#!/bin/bash

# get parameter from system
user=`id -un`

# start sharing xhost
xhost +local:root

# run docker
docker run --rm \
  --net=host \
  --ipc=host \
  --gpus all \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v $HOME/.Xauthority:$docker/.Xauthority \
  -v $HOME/:$HOME/ \
  -v /mnt/Data/Dataset:/data/Dataset \
  -v /mnt/Data/Projects:/data/Projects \
  -e XAUTHORITY=$home_folder/.Xauthority \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -it --name "nlp_test" ${user}/nlp_test_env