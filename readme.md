# VagrantOps Starter Image

VagrantOps will work off of the base image here.

This image does a few things:

1. Create a base server image for VagrantOps to use.
2. This repository uses the latest Ubuntu LTS point release, e.g. `14.04.2`.
2. Install the Ansible and add a basic configuration that will make running Ansible locally easier.


## Development

To create your own base image, or to test PR's:

1. Clone this repository
2. Edit the `Vagrantfile` or `init.sh` provisioning script
3. Use `vagrant up` to start the server up and build it. You may wish to comment out `config.ssh.insert_key = false` within the `Vagantfile` so you can inspect the image after building it.
4. Run `build.sh` to build a new Vagrant image usable by others.
