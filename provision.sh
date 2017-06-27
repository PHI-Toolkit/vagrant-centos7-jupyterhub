#!/bin/bash
sudo yum -y update
sudo cp /vagrant/selinux-config /etc/selinux/config
sudo yum install -y gcc make kernel-devel
sudo yum install -y net-tools wget nano git

# docker, and docker-compose
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y makecache fast
sudo yum install -y docker-ce
sudo mkdir -p /etc/docker
sudo mkdir -p /data/docker-data
sudo cp /vagrant/daemon.json /etc/docker/daemon.json
sudo systemctl enable docker
sudo usermod -aG docker vagrant
sudo systemctl start docker
sudo yum install -y epel-release
sudo yum install -y python-pip
sudo pip install --upgrade pip
sudo pip install docker-compose
sudo yum upgrade python*
sudo ls -la /home/vagrant
sudo ls -la /vagrant

# create docker shared volumes for notebook
sudo mkdir -p /data/shared
sudo mkdir -p /data/modules
sudo mkdir -p /data/geoserver
sudo chmod -R a+w /data/shared
sudo chmod -R a+w /data/modules
sudo chmod -R a+w /data/geoserver
