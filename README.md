# Vagrant Centos-7 VirtualBox with Docker-based JupyterHub and Jupyter Notebooks

This VM was created for the 2017 Growing Expertise in E-Health Knowledge and Skills (GEEKS) Program in Bangkok, Thailand.

## Requirements behind this setup
1. Centos-7 VM (replicate the GEEKS training server)
2. JupyterHub with DockerSpawner
3. Jupyter Notebook  with Python 2 and 3 kernels

## Customizing Vagrantfile:

### Forwarded ports

> config.vm.network "forwarded_port", guest: 443, host: 9443
> config.vm.network "forwarded_port", guest: 8000, host: 8001

### IP Address
> config.vm.network "public_network", ip: "192.168.50.200", bridge: "enp0s31f6"

### Disk size
Before using this configuration, please install the vagrant disk size plugin. On the command line, type:
> $ vagrant plugin install vagrant-disksize

Then adjust the size of the disk in GB, considering how much storage is available in your computer system.
> config.disksize.size = '100GB'

### Memory
VM memory is configured for 16GB. You can change this to accommodate available memory in your computer system.
> vb.memory = "16384"

### Shell provisioners
This set up uses two provisioners:
1. "provision.sh" - This further configures the VM environment.
> config.vm.provision "shell", path: "./provision.sh"

2. "jupyterhub.sh" - This downloads code from GitHub, and then uses this code to set up two Docker images based on Dockerfile.jupyterhub and Dockerfile-singleuser-scipy.
> config.vm.provision "shell", path: "./jupyterhub.sh"

## Running the Vagrantfile
This is not intended to be a tutorial on Vagrant. You can use four commands to manage the Vagrant VM:

1. "vagrant up --provision": This sets up the VM using the specifications in the Vagrantfile and runs the shell provisioners (see above). This takes a while to implement, and include building the two Docker images mentioned above. Once completed (back to shell prompt), you can go to your browser and type this URL: http://(IP-Address-in-Vagrantfile):8000. Make sure you use the same IP address you used in the Vagrantfile.
2. "vagrant halt": This stops the VM.
3. "vagrant destroy": This deletes the VM and all associated files.
4. "vagrant ssh": This enables you to enter the VM itself and inspect and modify its contents. When you enter the VM it will show the following prompt:
> [vagrant@localhost ~]$

 Inside the VM, you can use "docker" and "docker-compose" commands:

 > $ docker ps

 > $ docker images

### Using JupyterHub and Jupyter Notebook

Once inside the VM (after "vagrant ssh") you can manage the JupyterHub and Jupyter Notebook servers:

> $ cd jupyterhub-deploy-docker

> $ docker-compose up

> $ docker-compose down

"docker-compose up" brings up the JupyterHub server.
