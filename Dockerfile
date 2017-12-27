FROM ubuntu:16.04
ENV DEBIAN_FRONTEND "noninteractive"

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update -y
RUN apt-get -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" dist-upgrade

RUN apt-get install -y --no-install-recommends \
  dconf-tools \
  curl wget \
  tar zip unzip zlib1g-dev bzip2 libbz2-dev \
  openssl libssl-dev \
  zsh vim screen tree htop \
  net-tools lynx iftop traceroute \
  sudo \
  apt-transport-https \
  software-properties-common \
  ppa-purge \
  apt-utils \
  ca-certificates \
  vim \
  git


RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN add-apt-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends \
  build-essential binutils cmake autoconf automake autogen pkg-config libtool \
  gcc-6 g++-6 gcc-7 g++-7 gdb \
  clang-5.0 lldb-5.0 lld-5.0
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 20
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 20

WORKDIR /opt
RUN git clone https://github.com/intel/IntelSEAPI.git
WORKDIR /opt/IntelSEAPI
RUN python ./buildall.py --force_bits=64 --no_java --verbose --clean --install

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/IntelSEAPI/bin/
RUN ldconfig

WORKDIR /opt/
