#
# Minimum Docker image for Mono development
#
FROM shugaoye/docker-aosp:ubuntu16.04-JDK8

MAINTAINER Roger Ye <shugaoye@yahoo.com>

# Install Mono
# See http://source.android.com/source/initializing.html#setting-up-a-linux-build-environment
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN apt update
RUN apt install apt-transport-https ca-certificates
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt install -y mono-devel mono-complete monodevelop

WORKDIR /tmp


# The persistent data will be in these two directories, everything else is
# considered to be ephemeral
# VOLUME ["/tmp/ccache", "/mono"]

# Work in the build directory, repo is expected to be init'd here
# WORKDIR /mono

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
# ENTRYPOINT ["/root/docker_entrypoint.sh"]
