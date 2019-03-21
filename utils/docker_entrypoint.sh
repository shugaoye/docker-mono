#!/bin/bash
set -e

# This script designed to be used a docker ENTRYPOINT "workaround" missing docker
# feature discussed in docker/docker#7198, allow to have executable in the docker
# container manipulating files in the shared volume owned by the USER_ID:GROUP_ID.
#
# It creates a user named `mono` with selected USER_ID and GROUP_ID (or
# 1000 if not specified).

# Example:
#
#  docker run -ti -e USER_ID=$(id -u) -e GROUP_ID=$(id -g) imagename bash
#

# Reasonable defaults if no USER_ID/GROUP_ID environment variables are set.
if [ -z ${USER_ID+x} ]; then USER_ID=1000; fi
if [ -z ${GROUP_ID+x} ]; then GROUP_ID=1000; fi
if [ -z ${USERNAME+x} ]; then USERNAME=mono; fi
if [ -z ${GROUPNAME+x} ]; then GROUPNAME=mono; fi

# ccache
export CCACHE_DIR=/tmp/ccache
export USE_CCACHE=1

msg="docker_entrypoint: Creating user UID/GID [$USER_ID/$GROUP_ID]" && echo $msg
groupadd -g $GROUP_ID -r $USERNAME && \
useradd -u $USER_ID --create-home -r -g $USERNAME $GROUPNAME -s /bin/bash
echo "$msg - done"

msg="docker_entrypoint: Copying .gitconfig and .ssh/config to new user home" && echo $msg
cp /root/.gitconfig /home/$USERNAME/.gitconfig && \
chown $USERNAME:$GROUPNAME /home/$USERNAME/.gitconfig && \
mkdir -p /home/$USERNAME/.ssh && \
cp /root/.ssh/config /home/$USERNAME/.ssh/config && \
chown $USERNAME:$GROUPNAME -R /home/$USERNAME/.ssh &&
echo "$msg - done"

# msg="docker_entrypoint: Creating /tmp/ccache and /$USERNAME directory" && echo $msg
# mkdir -p /tmp/ccache /$USERNAME
# chown $USERNAME:$GROUPNAME /tmp/ccache /$USERNAME
# echo "$msg - done"

echo ""

# Default to 'bash' if no arguments are provided
args="$@"
if [ -z "$args" ]; then
  args="bash"
fi

# Execute command as the default user
export HOME=/home/$USERNAME
exec sudo -E -u $USERNAME $args
