#!/bin/bash

#This makes debconf use a frontend that expects no interactive input at all
export DEBIAN_FRONTEND=noninteractive

#Disables Host Key checking for Ansible
export ANSIBLE_HOST_KEY_CHECKING=False

big_step() {
    echo ""
    echo "================================================"
    echo ">>>> $1"
    echo "================================================"
    echo ""
}

step() {
    echo ""
    echo ""
    echo ">>>> $1"
    echo "------------------------------------------------"
    echo ""
}

remove_locks_if_exist() {
    step "checking and removing locks..."
    check_and_remove_file /var/lib/apt/lists/lock
    check_and_remove_file /var/cache/apt/archives/lock
    check_and_remove_file /var/lib/dpkg/lock
}

check_and_remove_file() {
    if [ -f $1 ]; then
        rm $1
    fi
}

check_and_install_ansible() {
    step "checking ansible..."
    if [[ $(which ansible) ]]; then
        echo "Ansible is already installed ... not updating"
    else
        step "Installing latest version of Ansible..."

        apt-get update -qq && \
        apt-get install software-properties-common --yes -qq && \
        apt-add-repository ppa:ansible/ansible && \
        apt-get update -qq && \
        apt-get install ansible --yes -qq

        step "Ansible successfully installed"
    fi
}

# This is required if you access the machine with a password instead of an ssh-key
check_and_install_sshpass() {
    if [[ ! $(which sshpass) ]]; then
        step "installing sshpass..."
        apt-get install sshpass --yes
    fi
}

# This is installing all specified roles from 'requirements.yml' within the root directory
# --force so that the newest version of the tools are being downloaded
install_roles_from_ansible_galaxy() {
    step "installing roles from ansible-galaxy ..."
   ansible-galaxy install --force -r /vagrant/requirements.yml
}

provision() {
    step "preparing playbook..."

    mkdir -p /tmp/provisioning
    cp -R /vagrant/provisioning/* /tmp/provisioning/
    cd /tmp/provisioning
    chmod -x inventory

    if [[ -f vaultpassword ]]; then
        chmod -x vaultpassword
        step "running playbook with vault..."
        sshpass -p vagrant ansible-playbook playbook.yml -u vagrant --inventory-file inventory --ask-pass --become --ssh-extra-args='-o StrictHostKeyChecking=no' --vault-password-file vaultpassword
    else
        step "running playbook without vault..."
        sshpass -p vagrant ansible-playbook playbook.yml -u vagrant --inventory-file inventory --ask-pass --become --ssh-extra-args='-o StrictHostKeyChecking=no'
    fi
}

#
# main flow
#
big_step "Provisioning development VM ..."
remove_locks_if_exist
check_and_install_ansible
check_and_install_sshpass
install_roles_from_ansible_galaxy
provision
