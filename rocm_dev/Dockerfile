FROM ubuntu:24.04

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install common dependencies
COPY ./install_base.sh install_base.sh
RUN bash ./install_base.sh && rm install_base.sh

# Create user
COPY ./install_user.sh install_user.sh
RUN bash ./install_user.sh && rm install_user.sh

# Install ROCm
COPY ./install_rocm.sh install_rocm.sh
RUN bash ./install_rocm.sh && rm install_rocm.sh

# Install PyTorch
COPY ./install_pytorch.sh install_pytorch.sh
RUN bash ./install_pytorch.sh && rm install_pytorch.sh

# Install Conda
COPY ./install_conda.sh install_conda.sh
RUN bash ./install_conda.sh && rm install_conda.sh

ENV ROCM_PATH /opt/rocm
ENV PATH /opt/rocm/bin:$PATH
ENV PATH /opt/rocm/llvm/bin:$PATH

ENV LD_LIBRARY_PATH=/opt/rocm/lib:/usr/local/lib:/usr/lib

CMD ["/bin/bash"]
