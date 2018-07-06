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
    override.vm.box_version = "1.0.0"
    override.vm.hostname = "testdevvm"
    override.ssh.port = 22
    override.ssh.username = "vagrant"
    override.ssh.password = "vagrant"
    docker.name = "testdevvm"
    docker.vagrant_machine = "testdevvm"
    docker.image = "tknerr/baseimage-ubuntu:16.04"
    docker.has_ssh = true
    docker.create_args = [
      "-d",
    ]
  end

  config.vm.provider "vmware_desktop" do |v|
    v.gui = true
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
