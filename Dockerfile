FROM elixir:1.4

# ENV LANG=en_US.UTF-8

RUN apt-get update && \
    apt-get install -y vim-tiny inotify-tools postgresql-client && \
    rm -rf /var/lib/apt/lists/*

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

ENV HOME /home/developer
WORKDIR /home/developer/prj


CMD /bin/bash

