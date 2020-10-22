KEYS=./insecure_keys/id_vagrant
BOX=./output/packer_centos_kubernetes.box
STAGE1_MANIFEST=output/stage-1-manifest.json

$(KEYS):
	mkdir -p ./insecure_keys
	ssh-keygen -f ./insecure_keys/id_vagrant -N ""

.PHONY: keys
keys: $(KEYS)


$(STAGE1_MANIFEST): $(KEYS)
	PACKER_LOG=1 packer build -only=virtualbox-iso stage1-template.json

.PHONY: stage1
stage1: $(STAGE1_MANIFEST)

.PHONY: stage2
stage2: stage1
	$(eval OVF := $(shell cat $(STAGE1_MANIFEST) | jq '.builds[0].files[].name' -r | grep -Po '[a-z0-9\-/]+.ovf'))
	PACKER_LOG=1 packer build -var "ovf_path=$(OVF)"  stage2-template.json

.PHONY: import
import: $(BOX)
	vagrant box remove -f centos-kubernetes || true
	vagrant box add $(BOX) --name centos-kubernetes

.PHONY: clean
clean:
	rm -fr output insecure_keys

.PHONY: get-ovf
get-ovf:
	$(eval OVF := $(shell cat $(STAGE1_MANIFEST) | jq '.builds[0].files[].name' -r | grep -Po '[a-z0-9\-/]+.ovf'))

.PHONY: print-ovf
print-ovf: get-ovf
	@echo ">>$(OVF)"

