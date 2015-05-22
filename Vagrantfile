# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "vagrantops"

  config.ssh.insert_key = false

  # Run The Base Provisioning Script
  config.vm.provision "shell" do |s|
    s.path = "./scripts/init.sh"
  end
end
