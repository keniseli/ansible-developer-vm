#!/bin/bash

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

check_and_install_serverspec() {
    step "Installing ruby..."
    apt-get install ruby -y
    gem install serverspec
}

run_tests() {
    step "Running tests..."
    cd /vagrant/verify/
    rake spec
}

#
# main flow
#
big_step "Verifying..."
check_and_install_serverspec
run_tests
