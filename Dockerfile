#
# Debian Dockerfile
#
# https://github.com/yangqi/docker-debian
#

# Pull base image.
FROM debian:stable-slim

MAINTAINER BenLue <benlue@s3root.ovh>
ENV DEBIAN_FRONTEND noninteractive

# System Update.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get clean

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo

RUN mkdir -p /lineage-16.0 && cd /lineage-16.0
RUN repo init --depth=1 -u https://github.com/LineageOS/android.git -b lineage-16.0
RUN repo sync -f --force-sync --force-broken --no-clone-bundle --no-tags -j2


# build tools
RUN apt-get update && apt-get -y --no-install-recommends install \
    openjdk-8-jdk \
    python \
    bc \
    yasm \
    rsync \
    schedtool \
    imagemagick \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    libssl-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

# Add user
RUN useradd -ms /bin/bash benlue

# Add folder
RUN mkdir -p /home/benlue/shared

# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts
ADD shared/install_repo.sh /home/benlue/shared/install_repo.sh
ADD shared/sync_lineage-16.0.sh /home/benlue/shared/sync_lineage-16.0.sh

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]


