FROM ubuntu:jammy AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

# Install Neovim without using the PPA directly


FROM base AS prime
ARG TAGS
RUN addgroup --gid 1001 stanislav
RUN adduser --gecos stanislav --uid 1001 --gid 1001 --disabled-password stanislav
USER stanislav
WORKDIR /home/stanislav

FROM prime
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]