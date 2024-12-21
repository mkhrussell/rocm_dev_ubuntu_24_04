#!/bin/bash

set -ex

# Install common dependencies
apt-get update

ccache_deps="asciidoc docbook-xml docbook-xsl xsltproc"
deploy_deps="libffi-dev libbz2-dev libreadline-dev libncurses5-dev libncursesw5-dev libgdbm-dev libsqlite3-dev uuid-dev tk-dev"
numpy_deps="gfortran"

# Run apt-get to install common dependencies
DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated --no-install-recommends \
    $ccache_deps \
    $numpy_deps \
    $deploy_deps \
    file \
    apt-transport-https \
    autoconf \
    automake \
    build-essential \
    cmake \
    ca-certificates \
    curl \
    git \
    git-lfs \
    libatlas-base-dev \
    libc6-dbg \
    libyaml-dev \
    libz-dev \
    libjemalloc2 \
    libjpeg-dev \
    libasound2-dev \
    libsndfile-dev \
    libnuma-dev \
    software-properties-common \
    wget \
    sudo \
    vim \
    jq \
    libtool \
    vim \
    unzip \
    gpg-agent \
    gdb \
    bc \
    gpg-agent \
    kmod \
    nano \
    libc++1 \
    libc++abi1 \
    libgnutls30 \
    python3 \
    python3-pip

# Install symlink for python
ln -sf /usr/bin/python3 /usr/bin/python

# Init git-lfs
git-lfs install

# Cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
