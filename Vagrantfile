# If you don't have to change anything about the base box, do not change this file.
# Rather change the playbook.yml in the directory provisioning.

Vagrant.configure("2") do |config|
  config.vm.box = "tknerr/baseimage-ubuntu-16.04"

  config.vm.provider "virtualbox" do |vbox, override|
    vbox.gui = true
    vbox.memory = 16384
    vbox.cpus = 4
    override.vm.box = "mpbauer/ubuntu1804-desktop"
  end

  config.vm.provider "docker" do |docker, override|
    #config.vm.box = "tknerr/baseimage-ubuntu-16.04"
    #config.vm.box_version = "1.0.0"
    #docker.image = "ubuntu/18.04"
    docker.has_ssh = true
  end

  config.vm.provider "vmware_desktop" do |v|
    v.gui = true
  end

  # This is the dev VM which is going to be provisioned. Only add basic stuff here!
  # Installation and configuration is to be done via playbook
  config.vm.define "devvm" do |devvm|
    devvm.vm.hostname = "developmentVM"
  end

  # Run ansible playbook
  config.vm.provision :shell,
    privileged: true,
    path: "run-ansible-playbook.sh"

  # Verify the provisioning
  config.vm.provision :shell,
    privileged: true,
    path: "verify-provisioning.sh"

end
