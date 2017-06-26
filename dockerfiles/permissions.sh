#!/bin/bash
sudo chown -R jovyan:users /home/jovyan/work/shared
sudo chown -R jovyan:users /home/jovyan/work/modules
sudo chown -R jovyan:users /home/jovyan/work/geoserver
sudo chown -R jovyan:users /home/jovyan/work/notebooks
sudo chmod a+w -R /home/jovyan/work/shared
sudo chmod a+w -R /home/jovyan/work/modules
sudo chmod a+w -R /home/jovyan/work/geoserver
sudo chmod a+w -R /home/jovyan/work/notebooks
sudo chmod a+w -R /home/jovyan/.local/
