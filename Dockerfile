# .NET SDK and Mono image
# Please refer to README.md for more information.

FROM shugaoye/docker-mono:6.12.0.107

LABEL maintainer="shugaoye@yahoo.com"

RUN apt-get update \
  && apt-get install -y openssh-server net-tools python3 python3-pip clang \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN pip3 install pycparser==2.17 && pip3 install pythonnet==2.5.2
