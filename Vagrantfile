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

  
  main.vm.define "controller" do |controller|
     controller.vm.network "private_network", ip: "192.168.30.10"
     controller.vm.provider "virtualbox" do |vb|
       #vb.gui = true
       vb.cpus = 2
       vb.memory = "2048"
     end
     #controller.vm.provision "shell", path: "./vagrant-scripts/setup-docker"
     #controller.vm.provision "shell", path: "./vagrant-scripts/setup-k8s"
  end

  main.vm.define "worker" do |worker|
     worker.vm.network "private_network", ip: "192.168.40.10"
     worker.vm.provider "virtualbox" do |vb|
        vb.cpus = 1
        vb.memory = "1024"
     end
  end
end
