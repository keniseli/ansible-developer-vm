#!/bin/bash

big_step() {
    echo ""
    echo "====================================="
    echo ">>>>>> $1"
    echo "====================================="
    echo ""
}

step() {
    echo ""
    echo ""
    echo ">>>>>> $1"
    echo "-------------------------------------"
    echo ""
}

check_and_install_ansible() {
    step "checking ansible..."
    if [[ $(which ansible) ]]; then
        echo "ansible already installed"
    else
        step "installing ansible..."
        apt-get install ansible --yes
    fi
}

check_and_install_sshpass() {
    if [[ ! $(which sshpass) ]]; then
        step "installing sshpass..."
        apt-get install sshpass --yes
    fi
}

provision() {
    step "preparing playbook..."
    rm -rf /tmp/provisioning
    cp -r /vagrant/provisioning /tmp/provisioning
    cd /tmp/provisioning
    chmod -x hosts
    export ANSIBLE_HOST_KEY_CHECKING=False
    if [[ -f vaultpassword ]]; then
        chmod -x vaultpassword
        step "running playbook with vault..."
        sshpass -p vagrant ansible-playbook playbook.yml -u vagrant --inventory-file hosts --ask-pass --ssh-extra-args='-o StrictHostKeyChecking=no' --vault-password-file vaultpassword
    else 
        step "running playbook without vault..."
        sshpass -p vagrant ansible-playbook playbook.yml -u vagrant --inventory-file hosts --ask-pass --ssh-extra-args='-o StrictHostKeyChecking=no'
    fi
}

#
# main flow
#
big_step "provisioning..."
check_and_install_ansible
check_and_install_sshpass
provision