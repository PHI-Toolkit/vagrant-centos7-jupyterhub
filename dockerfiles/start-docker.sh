#!/bin/bash
# you can use ths to debug docker-compose
docker run -it --rm --name jupyterhub \
-e DOCKER_NETWORK_NAME=jupyterhub-network \
-e NOTEBOOK_IMAGE_DOCKERFILE=Dockerfile-singleuser-scipy \
-e DOCKER_NOTEBOOK_IMAGE=jupyterhub/singleuser \
-e DOCKER_NOTEBOOK_DIR=/home/jovyan/work \
-e DOCKER_SPAWN_CMD=start-singleuser.sh \
-e CONFIGPROXY_AUTH_TOKEN=`openssl rand -hex 32` \
-v /var/run/docker.sock:/var/run/docker.sock:rw \
-v data:/data \
-p 0.0.0.0:8000:8000 \
-p 0.0.0.0:443:443 \
jupyterhub \
jupyterhub -f /srv/jupyterhub/jupyterhub_config.py
