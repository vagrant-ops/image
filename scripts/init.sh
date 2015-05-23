#!/usr/bin/env bash

# Don't taze me, bro
DEBIAN_FRONTEND="noninteractive"
export DEBIAN_FRONTEND

# Update to latest 14.04
sudo apt-get update
sudo apt-get -qq upgrade

# Add ability to add repositories
sudo apt-get install -qq software-properties-common

# Add Ansible repository and base items
sudo add-apt-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -qq install ansible

# Charset/Locale
sudo locale-gen C.UTF-8
export LANG=C.UTF-8
echo "export LANG=C.UTF-8" | sudo tee -a /home/vagrant/.bashrc

# Swap
sudo fallocate -l 512M /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile   none    swap    sw    0   0" | sudo tee -a /etc/fstab
printf "vm.swappiness=10\nvm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf && sysctl -p


# Backup original ansible.cfg
sudo cp /etc/ansible/ansible.cfg /etc/ansible/ansible.old.cfg

# Add Ansible.cfg file with customized ssh_args
sudo tee /etc/ansible/ansible.cfg << EOF
[defaults]
inventory      = /etc/ansible/hosts
remote_tmp     = \$HOME/.ansible/tmp
pattern        = *
forks          = 5
poll_interval  = 15
sudo_user      = root
transport      = smart
module_lang    = C

gathering = implicit
sudo_exe = sudo
timeout = 10
ansible_managed = Ansible managed: {file} modified on %Y-%m-%d %H:%M:%S by {uid} on {host}
action_plugins     = /usr/share/ansible_plugins/action_plugins
callback_plugins   = /usr/share/ansible_plugins/callback_plugins
connection_plugins = /usr/share/ansible_plugins/connection_plugins
lookup_plugins     = /usr/share/ansible_plugins/lookup_plugins
vars_plugins       = /usr/share/ansible_plugins/vars_plugins
filter_plugins     = /usr/share/ansible_plugins/filter_plugins

fact_caching = memory

[ssh_connection]
ssh_args = -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ControlMaster=auto -o ControlPersist=60s

[accelerate]
accelerate_port = 5099
accelerate_timeout = 30
accelerate_connect_timeout = 5.0
accelerate_daemon_timeout = 30
EOF

# Add some Python requirements
## sudo pip install pyyaml