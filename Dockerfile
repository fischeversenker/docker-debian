#
# Debian Dockerfile
#
# https://github.com/yangqi/docker-debian
#

# Pull base image.
FROM debian:9

MAINTAINER BenLue <benlue@s3root.ovh>
ENV DEBIAN_FRONTEND noninteractive
# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get clean

# Add user
RUN useradd -ms /bin/bash benlue

# Add folder
RUN mkdir -p /home/benlue/shared

# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts
ADD shared/install_repo.sh /home/benlue/shared/install_repo.sh

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]


