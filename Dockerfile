FROM ubuntu:jammy AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update && sudo apt-get install -y sudo && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y software-properties-common curl git build-essential && \
    sudo apt-add-repository -y ppa:ansible/ansible && \
    sudo apt-get update && \
    sudo apt install ansible-core && \
    sudo apt-get install -y curl git ansible build-essential && \
    sudo apt-get install -y liblua5.1-dev liblua5.3-dev libluajit-5.1-dev && \
    sudo apt-get clean autoclean && \
    sudo apt-get autoremove -y

# Install Neovim without using the PPA directly


FROM base AS prime
ARG TAGS
RUN adduser --disabled-password --gecos "" stan && \
    usermod -aG sudo stan && \
    echo "stan ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER stan
WORKDIR /home/stan

FROM prime
COPY . .
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
CMD ["sh", "-c", "sh ansible.sh"]


# FROM base AS prime
# ARG TAGS
# RUN addgroup --gid 1001 stanislav
# RUN adduser --gecos stanislav --uid 1001 --gid 1001 --disabled-password stanislav
# USER stanislav
# WORKDIR /home/stanislav

# FROM prime
# COPY . .
# # CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
# CMD ["sh", "-c", "sh ansible.sh"]


