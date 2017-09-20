FROM debian:9
MAINTAINER Felix Glas <felix.glas@afconsult.com>

ARG USER=proto

RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    libtool \
    curl \
    make \
    g++ \
    unzip \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash $USER

USER $USER
WORKDIR /home/$USER

RUN curl -L -k -O https://github.com/google/protobuf/releases/download/v3.4.1/protobuf-cpp-3.4.1.tar.gz \
    && tar -zxvf protobuf-cpp-3.4.1.tar.gz


RUN cd protobuf-3.4.1 \
    && ./configure \
    && make \
    && make check \
    && make install \
    && ldconfig

CMD /bin/bash
