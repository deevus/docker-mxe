FROM ubuntu
MAINTAINER Simon Hartcher "simon@simonhartcher.com"
ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y autoconf automake bash bison bzip2 cmake flex gettext \
  git g++ intltool libffi-dev libtool libltdl-dev libssl-dev \ 
  libxml-parser-perl make openssl patch perl pkg-config scons sed unzip wget \
  xz-utils g++-multilib libc6-dev-i386

RUN git clone -b stable https://github.com/mxe/mxe.git /opt/mxe
WORKDIR /opt/mxe
RUN make gcc -j2

ENV PATH /opt/mxe/usr/bin:$PATH