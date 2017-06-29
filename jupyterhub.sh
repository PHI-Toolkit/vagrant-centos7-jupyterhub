#!/bin/bash
cd /home/vagrant
git clone -b geeks-scipy --single-branch https://github.com/PHI-Toolkit/jupyterhub-deploy-docker.git
sudo chown -R vagrant jupyterhub-deploy-docker
cd jupyterhub-deploy-docker
chmod a+x /vagrant/dockerfiles/*.sh
chmod a+x /vagrant/*.sh
# creates secrets directory and generate self-signed certificate and key
/vagrant/create-certs.sh
# replace GitHub files with our custom-built ones (e.g., no OAuth but dummy authenticator for jupyterhub_config.py)
cp /vagrant/dockerfiles/jupyterhub_config.py ./jupyterhub_config.py
cp /vagrant/dockerfiles/userlist ./userlist
cp /vagrant/dockerfiles/starthub.sh ./starthub.sh
cp /vagrant/dockerfiles/.env ./.env
cp /vagrant/dockerfiles/Dockerfile.jupyterhub ./Dockerfile.jupyterhub
cp /vagrant/dockerfiles/Dockerfile-singleuser-scipy ./Dockerfile-singleuser-scipy
cp /vagrant/dockerfiles/start-docker.sh ./start-docker.sh
mkdir -p modules
cp /vagrant/dockerfiles/load-*.sh ./modules/.
cp /vagrant/dockerfiles/permissions.sh ./permissions.sh
# build docker images and launch jupyterhub
./starthub.sh
