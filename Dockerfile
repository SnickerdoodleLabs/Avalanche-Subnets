FROM ubuntu:20.04

RUN apt update -y \
  && apt install -y vim \
                    tmux \
                    curl

WORKDIR /root

# install the subnet cli
RUN curl -sSfL https://raw.githubusercontent.com/ava-labs/avalanche-cli/main/scripts/install.sh | sh -s

ENV PATH="${PATH}:/root/bin"