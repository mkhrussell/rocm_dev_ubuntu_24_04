# rocm_dev_ubuntu_24_04
ROCm 6.3 with PyTorch 2.4.0, TorchVision 0.19.0, Torchaudio 2.4.0, PyTorch Triton 3.0.0, ONNX Runtime 1.19.0, and TensorFlow 2.17.0

### Build and start the container:

docker compose up --build -d

### Access the container:

docker exec -it rocm_dev_ubuntu_24_04 /bin/bash

### Remove Containers and Volumes:

docker compose down --volumes --remove-orphans

## Verify ROCm Installation

rocminfo

*******                  
Agent 2                  
*******                  
  Name:                    gfx1100                            
  Uuid:                    GPU-083669bd370e6e27               
  Marketing Name:          Radeon RX 7900 XTX                 
  Vendor Name:             AMD



clinfo

Number of platforms                               1
  Platform Name                                   AMD Accelerated Parallel Processing
  Platform Vendor                                 Advanced Micro Devices, Inc.
  Platform Version                                OpenCL 2.1 AMD-APP (3635.0)
  Platform Profile                                FULL_PROFILE


  Platform Name                                   AMD Accelerated Parallel Processing
Number of devices                                 1
  Device Name                                     gfx1100
  Device Vendor                                   Advanced Micro Devices, Inc.
  Device Vendor ID                                0x1002
  Device Version                                  OpenCL 2.0 
  Driver Version                                  3635.0 (HSA1.1,LC)
  Device OpenCL C Version                         OpenCL C 2.0 
  Device Type                                     GPU
  Device Board Name (AMD)                         Radeon RX 7900 XTX

## Verify PyTorch installation

python3 -c 'import torch' 2> /dev/null && echo 'Success' || echo 'Failure'

Success

-----------------------

python3 -c 'import torch; print(torch.cuda.is_available())'

True

-----------------------

python3 -c "import torch; print(f'device name [0]:', torch.cuda.get_device_name(0))"

device name [0]: Radeon RX 7900 XTX

------------------------

python3 -m torch.utils.collect_env

PyTorch version: 2.4.0+rocm6.3.0
Is debug build: False
CUDA used to build PyTorch: N/A
ROCM used to build PyTorch: 6.3.42131-fa1d09cbd

OS: Ubuntu 24.04.1 LTS (x86_64)
GCC version: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0

Python version: 3.12.3 (main, Nov  6 2024, 18:32:19) [GCC 13.2.0] (64-bit runtime)
Python platform: Linux-6.8.0-51-generic-x86_64-with-glibc2.39
Is CUDA available: True
GPU models and configuration: Radeon RX 7900 XTX (gfx1100)
HIP runtime version: 6.3.42131
MIOpen runtime version: 3.3.0

-------------------------