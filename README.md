# ansible-developer-vm
A blueprint on how developer VM's can be provisioned from any host with Vagrant installed. Let's make us developers' lives easier!

# Getting started

## Prerequisites
1. Have vagrant (version 1.8.6) installed
2. Have virtualbox installed
3. Have some space on your machine left. 5 GB will be more than sufficient. 
4. Internet connection

## Provision machine
1. Adjust the provisioning in the directory `provisioning` to your needs (add roles, extend playbook, whatever...)
2. If you're using passwords create a vault and a vaultpassword file as described in the file provisioning/group_vars/vars
3. Open a command line interface next to the Vagrantfile: `vagrant up` and grab a coffee.
4. Your wonderful new dev vm should be up and running now

# Open points
* Automated testing and CI
* more roles (and maybe a mechanism to automatically download them)
