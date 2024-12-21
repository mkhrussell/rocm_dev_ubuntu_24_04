#!/bin/bash

set -ex

# Install common dependencies
pip3 install --break-system-packages wheel matplotlib pandas

export BASE_URL="https://repo.radeon.com/rocm/manylinux/rocm-rel-${ROCM_VERSION}/"

# Download the wheel files
wget ${BASE_URL}torch-2.4.0%2Brocm6.3.0-cp312-cp312-linux_x86_64.whl
wget ${BASE_URL}pytorch_triton_rocm-3.0.0%2Brocm6.3.0.75cc27c26a-cp312-cp312-linux_x86_64.whl
wget ${BASE_URL}torchvision-0.19.0%2Brocm6.3.0-cp312-cp312-linux_x86_64.whl
wget ${BASE_URL}torchaudio-2.4.0%2Brocm6.3.0-cp312-cp312-linux_x86_64.whl

# Install ROCm PyTorch, TorchVision, Torchaudio, and PyTorch Triton
pip3 install --break-system-packages torch-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    pytorch_triton_rocm-3.0.0+rocm6.3.0.75cc27c26a-cp312-cp312-linux_x86_64.whl \
    torchvision-0.19.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    torchaudio-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl

# Install ONNXRuntime and TensorFlow ROCm
pip3 install --break-system-packages onnxruntime-rocm -f ${BASE_URL}
pip3 install --break-system-packages tensorflow_rocm -f ${BASE_URL}

# Cleanup
rm -rf torch-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    pytorch_triton_rocm-3.0.0+rocm6.3.0.75cc27c26a-cp312-cp312-linux_x86_64.whl \
    torchvision-0.19.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    torchaudio-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl

rm -rf /tmp/* /var/tmp/* ~/.cache/pip
