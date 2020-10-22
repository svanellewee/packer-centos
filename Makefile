./insecure_keys/id_vagrant:
	mkdir -p ./insecure_keys
	ssh-keygen -f ./insecure_keys/id_vagrant -N ""

output/packer_centos_virtualbox-2020.10.01.box:  ./insecure_keys/id_vagrant
	PACKER_LOG=1 packer build -only=virtualbox-iso template.json


import: output/packer_centos_virtualbox-2020.10.01.box
	vagrant box remove centos-packer
	vagrant box add output/packer_centos_virtualbox-2020.10.01.box --name centos-packer
