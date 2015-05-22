#!/usr/bin/env bash

# Add ability to add repositories
sudo apt-get update
sudo apt-get install -y software-properties-common

# Add Ansible repository and base items
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

# Charset/Locale
sudo locale-gen C.UTF-8
export LANG=C.UTF-8
echo "export LANG=C.UTF-8" >> /home/vagrant/.bashrc

# Swap
sudo fallocate -l 512M /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile   none    swap    sw    0   0" | sudo tee -a /etc/fstab
printf "vm.swappiness=10\nvm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf && sysctl -p

# Ansible.cfg file?

# Add some Python requirements
## sudo pip install pyyaml