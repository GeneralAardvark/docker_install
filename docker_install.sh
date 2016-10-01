#!/bin/bash
#
set -e

USER=$1

apt-get update -qq
apt-get -qq install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get -qq purge lxc-docker
apt-get -qq install linux-image-extra-$(uname -r) docker-engine

groupadd docker
usermod -aG docker $USER
systemctl enable docker
service docker start
