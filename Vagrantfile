# If you don't have to change anything about the base box, do not change this file.
# Rather change the playbook.yml in the directory provisioning.

Vagrant.configure("2") do |config|

  # This is the dev VM which is going to be provisioned. Only add basic stuff here!
  # Installation and configuration is to be done via playbook
  config.vm.define "devvm" do |devvm|
    devvm.vm.network :private_network, type: "dhcp"
    devvm.vm.hostname = "developmentVM"
    devvm.vm.box = "tknerr/baseimage-ubuntu-16.04"
  end

  config.vm.provider "virtualbox" do |v, override|
    v.gui = true
    v.memory = 16384
    v.cpus = 4
    override.vm.box = "mpbauer/ubuntu1804-desktop"
  end

  config.vm.provider "vmware_desktop" do |v, override|
    v.gui = true
    v.memory = 16384
    v.cpus = 4
    override.vm.box = "mpbauer/ubuntu1804-desktop"
  end

  config.vm.provider "docker" do |docker, override|
    override.vm.box_version = "1.0.0"
    override.vm.hostname = "developmentvm"
    override.ssh.port = 2222
    override.ssh.username = "vagrant"
    override.ssh.password = "vagrant"
    docker.name = "developmentvm"
    docker.vagrant_machine = "developmentvm"
    docker.image = "tknerr/baseimage-ubuntu:16.04"
    docker.has_ssh = true
    docker.create_args = [
      "-d",
    ]
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

