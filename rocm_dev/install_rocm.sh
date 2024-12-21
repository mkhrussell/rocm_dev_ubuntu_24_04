#!/bin/bash

set -ex

# Install ROCm libraries
apt-get update

apt-get install -y --allow-unauthenticated \
    "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"

wget "https://repo.radeon.com/amdgpu-install/${ROCM_VERSION}/ubuntu/noble/${AMD_GPU_INSTALLER_DEB}" && \
    apt-get install -y --allow-unauthenticated ./${AMD_GPU_INSTALLER_DEB}

apt-get update && \
    amdgpu-install -y --accept-eula --no-32 --usecase=dkms,opencl,rocm,lrt,rocmdev,rocmdevtools,openclsdk,hip,hiplibsdk,mlsdk,openmpsdk,mllib --opencl=rocr

# Cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -f ${AMD_GPU_INSTALLER_DEB}
