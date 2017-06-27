#!/bin/bash
make notebook_image
docker network create jupyterhub-network
docker volume create --name=jupyterhub-data
docker-compose build
docker-compose up -d
