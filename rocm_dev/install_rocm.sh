#!/bin/bash

set -ex

# Install ROCm libraries
apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated \
    "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"

wget https://repo.radeon.com/amdgpu-install/6.3/ubuntu/noble/amdgpu-install_6.3.60300-1_all.deb && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --allow-unauthenticated ./amdgpu-install_6.3.60300-1_all.deb

apt-get update && \
    amdgpu-install -y --accept-eula --no-32 --usecase=dkms,opencl,rocm,lrt,rocmdev,rocmdevtools,openclsdk,hip,hiplibsdk,mlsdk,openmpsdk,mllib --opencl=rocr

# Cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f amdgpu-install_6.3.60300-1_all.deb
