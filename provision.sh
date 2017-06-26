#!/bin/bash
sudo yum -y update
sudo cp /vagrant/selinux-config /etc/selinux/config
sudo yum install -y gcc make kernel-devel
sudo yum install -y net-tools wget nano git

# virtualbox guest additions
cd /opt
sudo wget -c http://download.virtualbox.org/virtualbox/5.0.20/VBoxGuestAdditions_5.0.20.iso \
                   -O VBoxGuestAdditions_5.0.20.iso
sudo mount VBoxGuestAdditions_5.0.20.iso -o loop /mnt
cd /mnt
sudo sh VBoxLinuxAdditions.run --nox11
cd /opt
rm *.iso

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
sudo chmod a+x /vagrant/*.sh

# create docker shared volumes for notebook
sudo mkdir -p /data/shared
sudo mkdir -p /data/modules
sudo mkdir -p /data/geoserver
sudo chmod -R a+w /data/shared
sudo chmod -R a+w /data/modules
sudo chmod -R a+w /data/geoserver
