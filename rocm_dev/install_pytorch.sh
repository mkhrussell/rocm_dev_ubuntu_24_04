#!/bin/bash

set -ex

# Install common dependencies
pip3 install --break-system-packages wheel matplotlib pandas

# Download the wheel files
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3/torch-2.4.0%2Brocm6.3.0-cp312-cp312-linux_x86_64.whl
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3/torchvision-0.19.0%2Brocm6.3.0-cp312-cp312-linux_x86_64.whl
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3/pytorch_triton_rocm-3.0.0%2Brocm6.3.0.75cc27c26a-cp312-cp312-linux_x86_64.whl
wget https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3/torchaudio-2.4.0%2Brocm6.3.0-cp312-cp312-linux_x86_64.whl

# Install ROCm PyTorch, TorchVision, Torchaudio, and PyTorch Triton
pip3 install --break-system-packages torch-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    torchvision-0.19.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    torchaudio-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    pytorch_triton_rocm-3.0.0+rocm6.3.0.75cc27c26a-cp312-cp312-linux_x86_64.whl

# Install ONNX Runtime ROCm
pip3 install --break-system-packages onnxruntime-rocm -f https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3/

# Install TensorFlow ROCm
pip3 install --break-system-packages https://repo.radeon.com/rocm/manylinux/rocm-rel-6.3/tensorflow_rocm-2.17.0-cp312-cp312-manylinux_2_28_x86_64.whl

# Cleanup
rm -rf torch-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    torchvision-0.19.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    torchaudio-2.4.0+rocm6.3.0-cp312-cp312-linux_x86_64.whl \
    pytorch_triton_rocm-3.0.0+rocm6.3.0.75cc27c26a-cp312-cp312-linux_x86_64.whl

