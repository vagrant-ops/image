# VagrantOps Starter Image

VagrantOps will work off of the base image here.

This image does a few things:

1. Create a base server from which VagrantOps will work off of. This base server of this base image will be the latest Ubuntu LTS.
2. Install the bare necessities and common packages, including utilities (git, tmux, vim, wget) and also some extras needed to run Ansible, such as Pip and Ansible itself.
3. Installs all Ansible roles so they exist on the base image and can therefore be run without extra dependencies on users' host machines.

## Ansible Roles to Start With

* Nginx
* MySQL (MariaDB?)
* PostgreSQL
* Redis
* PHP (FPM)
* Python Dev Tools (pip, virtualenv)
* Ruby Dev Tools (Rails? rbenv or "best"?)

## File-based config

We can use a yaml file to let users define roles and variables. This will be the default and "phase 1".