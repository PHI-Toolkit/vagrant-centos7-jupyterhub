# Vagrant Centos-7 VirtualBox with Docker-based JupyterHub and Jupyter Notebooks

This VM was created as a template for the 2017 Growing Expertise in E-Health Knowledge and Skills (GEEKS) Program in Bangkok, Thailand. Assuming you are able to put in the right configuration items below, all you need to do is type "vagrant up" at the command line and after 10 minutes, you will have JupyterHub and Jupyter Notebook available on the browser.

## Requirements behind this setup
1. Centos-7 VM set up using Vagrant (to replicate the GEEKS training server in Thailand)
2. JupyterHub with DockerSpawner
3. Jupyter Notebook with Python 2 and 3 kernels
4. Option to load more Python 2/3 modules and the R kernel

## Customizing Vagrantfile:

### Forwarded ports
Port 443 and 8000 are standard ports for JupyterHub. Expose the same ports on the VM.
> config.vm.network "forwarded_port", guest: 443, host: 9443

> config.vm.network "forwarded_port", guest: 8000, host: 8001

### IP Address
Be sure to change this to an IP address compatible with your network. The "bridge" is the name of the network device on the computer system where the VM is hosted.
> config.vm.network "public_network", ip: "192.168.50.200", bridge: "enp0s31f6"

### Disk size
Before using this configuration, please install the vagrant disk size plugin. On the command line, type:
> $ vagrant plugin install vagrant-disksize

Then adjust the size of the disk in GB, considering how much storage is available in your computer system.
> config.disksize.size = '100GB'

### Memory
VM memory is configured for 16GB with the value below. You can change this to accommodate available memory in your computer system.
> vb.memory = "16384"

### Shell provisioners
This set up uses two provisioners:
1. "provision.sh" - This further configures the VM environment.
> config.vm.provision "shell", path: "./provision.sh"

2. "jupyterhub.sh" - This downloads code from GitHub, and then uses this code to set up two Docker images based on Dockerfile.jupyterhub and Dockerfile-singleuser-scipy.
> config.vm.provision "shell", path: "./jupyterhub.sh"

## Running the Vagrantfile
This is not intended to be a tutorial on Vagrant but you can get by with four Vagrant commands to manage the Vagrant VM:

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

### JupyterHub Authentication

Dummy Authentication is used (see jupyterhub_config.py settings). 

### Post-launch action items
After launching JupyterHub you can install the rest of the Python 2/3 modules and R. Launch a terminal from Jupyter Notebook, and on the command prompt, type:

> $ cd modules

> ~/modules$ ./load-python-modules.sh

> ~/modules$ ./load-mran-r.sh

> ~/modules$ ./load-r-modules.sh

## JupyterLab
You can switch to the new (alpha preview) JupyterLab user interface by switching "lab" for tree in the browser URL. Click on the Jupyter icon first, then switch "lab" for tree (see below).


## Beyond testing...
Things to configure:
1. GitHub OAuth - You can put the correct client ID, secret key and callback URL in the ".env" file. Uncomment the OAuth sections of "jupyterhub_config.py" and comment the dummy authenticator.
2. Get Letsencrypt certificate and key and replace the self-signed certificate and key in the "secrets" directory inside the VM.
3. You might need a domain name for #1 for the callback URL.
4. You can put the service behind an nginx or apache proxy.
