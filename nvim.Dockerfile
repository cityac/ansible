ARG DEBIAN_FRONTEND=noninteractive
FROM ubuntu:jammy
WORKDIR /usr/local/bin
RUN apt update && apt install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-add-repository -y ppa:neovim-ppa/unstable && \
    apt update && \
    apt install -y curl git ansible build-essential neovim && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
COPY . .
ENTRYPOINT ["sh", "-c"]
CMD ["ansible-playbook $TAGS local.yml"]