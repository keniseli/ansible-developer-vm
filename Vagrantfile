# If you don't have to change anything about the base box, do not change this file.
# Rather change the playbook.yml in the directory provisioning.

Vagrant.configure("2") do |config|
  config.vm.box = "tknerr/ubuntu1604-desktop"

  # This is the dev VM which is going to be provisioned. Only add basic stuff here!
  # Installation and configuration is to be done via playbook
  config.vm.define "devVM" do |devVM|
    devVM.vm.network :private_network, ip: "192.168.33.13"
    devVM.vm.hostname = "devVM"
    devVM.vm.synced_folder ".", "/vagrant", disabled: true
  end

  # this is our ansible controller VM which provisions the other VMs
  config.vm.define "controllerVM" do |controllerVM|
    controllerVM.vm.network :private_network, ip: "192.168.33.15"
    controllerVM.vm.hostname = "controllerVM"
    # run ansible playbook
    controllerVM.vm.provision "shell",
      privileged: true,
      path: "controller-provisioning/run-ansible-playbook.sh"  ,
      keep_color: true
    controllerVM.vm.provision "shell",
      inline: "shutdown",
      privileged: true
  end

end