#
# Minimum Docker image for Mono development
#
FROM shugaoye/docker-mono:ubuntu16.04_mono

MAINTAINER Roger Ye <shugaoye@yahoo.com>

# Install vi
RUN apt update
RUN apt install -y net-tools gettext vim-common vim-tiny

# WORKDIR /tmp


# The persistent data will be in these two directories, everything else is
# considered to be ephemeral
# VOLUME ["/tmp/ccache", "/mono"]

# Work in the build directory, repo is expected to be init'd here
# WORKDIR /mono

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
ENTRYPOINT ["/root/docker_entrypoint.sh"]
