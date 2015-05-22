#!/usr/bin/env bash

# Add ability to add repositories
sudo apt-get update
sudo apt-get install -y software-properties-common

# Add Ansible repository and base items
sudo add-apt-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

# Add some Python requirements
## sudo pip install pyyaml