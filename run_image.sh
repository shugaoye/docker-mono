#!/bin/sh

USER_ID=`id -u`
USERNAME=`echo $USER`
GROUP_ID=`id -g`
GROUPNAME=$USERNAME
IMAGE=shugaoye/docker-mono:ubuntu16.04_mono_x11

docker run -ti --rm -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/docker:/home/$USERNAME \
  -v $HOME/.Xauthority:$HOME/.Xauthority \
  --net=host \
  -e USER_ID=${USER_ID} -e GROUP_ID=${GROUP_ID} \
  -e USERNAME=${USERNAME} -e GROUPNAME=${GROUPNAME} \
  ${IMAGE} /bin/bash
