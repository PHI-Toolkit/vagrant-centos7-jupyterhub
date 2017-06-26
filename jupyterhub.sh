#!/bin/bash
cd /home/vagrant
git clone -b geeks-scipy --single-branch https://github.com/PHI-Toolkit/jupyterhub-deploy-docker.git
sudo chown -R vagrant jupyterhub-deploy-docker
cd jupyterhub-deploy-docker
/vagrant/create-certs.sh
cp /vagrant/dockerfiles/userlist ./userlist
cp /vagrant/dockerfiles/starthub.sh ./starthub.sh
chmod a+x ./starthub.sh
cp /vagrant/dockerfiles/permissions.sh ./permissions.sh
cp /vagrant/dockerfiles/jupyterhub_config.py ./jupyterhub_config.py
cp /vagrant/dockerfiles/Dockerfile.jupyterhub ./Dockerfile.jupyterhub
cp /vagrant/dockerfiles/Dockerfile-singleuser-scipy ./Dockerfile-singleuser-scipy
cp /vagrant/dockerfiles/.env ./.env
