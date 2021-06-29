FROM ubuntu:xenial

LABEL maintainer='ran.cheng2@mail.mcgill.ca '

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get clean && \
    apt-get update && \
    apt-get install -y locales build-essential cmake git wget

# NEEDED to use PIP
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# Arguments
ARG USER=initial
ARG GROUP=initial
ARG UID=1000
ARG GID=${UID}
ARG SHELL=/bin/bash

# Setup users and groups
RUN groupadd --gid ${GID} ${GROUP} \
  && useradd --gid ${GID} --uid ${UID} -ms ${SHELL} ${USER} \
  && mkdir -p /etc/sudoers.d \
  && echo "${USER}:x:${UID}:${UID}:${USER},,,:$HOME:${shell}" >> /etc/passwd \
  && echo "${USER}:x:${UID}:" >> /etc/group \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" \
  && chmod 0440 "/etc/sudoers.d/${USER}"

WORKDIR /home/${USER}

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN conda install -y python=3.6.8

RUN mkdir /home/${USER}/ && cd /home/${USER} && \
    git config --global url."https://hub.fastgit.org".insteadOf https://github.com && \
    git clone https://github.com/HIT-SCIR/pyltp && \
    cd pyltp && \
    git submodule init && \
    git submodule update && \
    python setup.py bdist_wheel

ENTRYPOINT ["bash"]