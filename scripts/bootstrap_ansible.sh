#!/bin/bash

# NOTE: based-on DevOps toolkit 2.0

set -e

echo "Installing Ansible..."

apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible-2.6
apt-get update
apt-get install -y --force-yes ansible

cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg
