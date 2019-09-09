#!/bin/bash


#./vagrant/vagrant_scripts/yum-install-if-missing.sh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

set -e

echo "Installing virtualenv..."
yum install -y python-virtualenv libselinux-python

echo "Creating virtualenv for Ansible..."
virtualenv /root/ansible2.6.17
source /root/ansible2.6.17/bin/activate

echo "Installing Ansible within virtualenv..."
pip install ansible==2.6.17

#cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg

PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/dev.yml -c local
