#!/bin/bash
cd /home/vagrant
git clone -b geeks-scipy --single-branch https://github.com/PHI-Toolkit/jupyterhub-deploy-docker.git
sudo chown -R vagrant jupyterhub-deploy-docker
cd jupyterhub-deploy-docker
./create-certs.sh
chmod a+x /vagrant/dockerfiles/*.sh
chmod a+x /vagrant/*.sh
/vagrant/create-certs.sh # creates secrets directory
cp /vagrant/dockerfiles/userlist ./userlist
cp /vagrant/dockerfiles/starthub.sh ./starthub.sh
cp /vagrant/dockerfiles/.env ./.env
mkdir -p modules
cp /vagrant/dockerfiles/load-*.sh ./modules/.
./starthub.sh
