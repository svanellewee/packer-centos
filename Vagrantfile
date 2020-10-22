# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |main|
  main.vm.box = "centos-kubernetes"
  main.ssh.private_key_path = "./insecure_keys/id_vagrant"
  main.vm.synced_folder ".", "/home/vagrant/shared"
  main.vm.box_check_update = false

  main.vm.define "base" do |base|
     base.vm.network "private_network", ip: "192.168.33.10"
     base.vm.provider "virtualbox" do |vb|
       # Display the VirtualBox GUI when booting the machine
       #vb.gui = true
       #
       # Customize the amount of memory on the VM:
       vb.memory = "4048"
     end
     #base.vm.provision "shell", path: "./vagrant-scripts/setup-docker"
     #base.vm.provision "shell", path: "./vagrant-scripts/setup-k8s"
  end

end
