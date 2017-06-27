#!/bin/bash
cd /tmp
wget https://mran.microsoft.com/install/mro/3.4.0/microsoft-r-open-3.4.0.tar.gz
tar zxvf microsoft-r-open-3.4.0.tar.gz
cd microsoft-r-open
sudo ./install.sh -a
cd ..
rm microsoft-r-open-3.4.0.tar.gz
rm -fvR microsoft-r-open
cd /home/jovyan/work
sudo mkdir -p /usr/local/lib/R/site-library && \
sudo chmod a+w -R /usr/local/lib/R/site-library && \
sudo chmod a+w -R /usr/lib64/microsoft-r/3.4/lib64/R/library
