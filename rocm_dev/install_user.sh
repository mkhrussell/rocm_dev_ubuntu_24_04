#!/bin/bash

set -ex

# getent group render | cut -d: -f3
# Result: 992
addgroup --gid 992 render && \
    usermod -aG render ubuntu

# Since version 24 the system ships with user 'ubuntu' that has id 1000
id -u ubuntu &>/dev/null || useradd -m -s /bin/bash ubuntu && \
    echo "ubuntu:password" | chpasswd && \
    usermod -aG sudo,video,render ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create /home/ubuntu
mkdir -p /home/ubuntu/bin && \
    mkdir -p /home/ubuntu/.local/bin && \
    mkdir -p /home/ubuntu/Developer

echo $'
# User specific environment
if ! [[ \"$PATH\" =~ \"$HOME/.local/bin:$HOME/bin:\" ]]; then
    PATH=\"$HOME/.local/bin:$HOME/bin:$PATH\"
fi
export PATH

# Conda
if [ -f /opt/conda/etc/profile.d/conda.sh ]; then
    . /opt/conda/etc/profile.d/conda.sh
fi

'>> /home/ubuntu/.bashrc

# Change ownership of /home/ubuntu
chown ubuntu:ubuntu -R /home/ubuntu

