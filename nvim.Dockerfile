FROM ubuntu:jammy AS base
ENV TAGS=""
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y sudo && \
    apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-add-repository -y ppa:neovim-ppa/unstable && \
    apt update && \
    apt install -y curl git ansible build-essential && \
    apt install -y cmake libuv1-dev liblua5.1-dev liblua5.3-dev libluajit-5.1-dev build-essential
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]


