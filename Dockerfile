FROM ubuntu:16.04

ENV TERM=xterm

RUN apt-get update && apt-get install -y wget curl make iproute2 vim-tiny
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y erlang-dev elixir=1.4.4-1

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

ENV HOME /home/developer
WORKDIR /home/developer/prj


CMD /bin/bash

