# Ansible Developer VM Provisioning

[![Build Status](https://travis-ci.org/keniseli/ansible-developer-vm.svg?branch=master)](https://travis-ci.org/keniseli/ansible-developer-vm)

A blueprint on how developer VM's can be provisioned from any host with Vagrant installed. Let's make us developers' lives easier!

## Prerequisites

1. Have vagrant (version 1.8.6) installed
2. Have virtualbox installed
3. Have some space on your machine left. 5 GB will be more than sufficient.
4. Internet connection

## Getting started

Next to this README file there is another file called `Vagrantfile` which defines how your virtual
machine is going to be configured.

1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Download and Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Open a terminal and navigate into the directory where the `Vagrantfile` is placed inside
4. Run `$ vagrant up` if you are starting the VirtualMachine for the first time. If the VM is already available and you just want to provision the machine run `$ vagrant provision`
5. Internet connection

### Supported tools / versions

The following combinations of tools have been tested and working

|Vagrant    |VirtualBox |VmWareFusion   |vagrant-vmware-desktop |VmWare Workstation |
|---        |---        |---            |---                    |---                |
|2.0.2      |5.2.6      |               |1.0.3                  |14.1.2             |
|2.1.2      |5.2.14     |10.1.2         |1.0.3                  |                   |

## Configure your machine

1. Adjust the provisioning in the directory `provisioning` to your needs (add roles, extend playbook, whatever...)
2. If you're using passwords create a vault and a vaultpassword file as described in the file provisioning/group_vars/vault
3. Open a command line interface next to the Vagrantfile: `$ vagrant up` and grab a coffee.
4. Your wonderful new dev vm should be up and running now

## Open points

* More roles from Ansible-Galaxy (Download of specific versions to avoid breaking changes)
* Templating example
