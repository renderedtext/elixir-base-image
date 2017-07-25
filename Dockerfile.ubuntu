FROM ubuntu:16.04

ENV TERM=xterm
ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get install -y wget curl make iproute2 vim-tiny inotify-tools
RUN apt-get install -y --no-install-recommends locales git postgresql-client

RUN echo $LANG UTF-8 > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=$LANG

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y erlang-dev elixir=1.4.4-1 erlang-parsetools erlang-eunit

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

ENV HOME /home/developer
WORKDIR /home/developer/prj


CMD /bin/bash

