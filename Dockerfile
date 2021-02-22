# .NET SDK and Mono image
# Please refer to README.md for more information.

FROM shugaoye/docker-mono:buster-p2.5.2

LABEL maintainer="shugaoye@yahoo.com"

RUN apt-get update \
  && apt-get install -y sudo tmux vim-common vim-tiny \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir /var/run/sshd
RUN export LC_ALL=C

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN pip3 install python-nubia

#EXPOSE 22
#CMD    ["/usr/sbin/sshd", "-D"]

COPY utils/bash.bashrc /root/bash.bashrc
RUN chmod 755 /root /root/bash.bashrc
COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
ENTRYPOINT ["/root/docker_entrypoint.sh"]
