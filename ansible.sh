#!/usr/bin/env bash

apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible sshpass


ln -sf /vagrant/hosts /etc/ansible/hosts




rm /home/vagrant/.ssh/known_hosts

cat >> /etc/hosts <<EOL
# vagrant environment nodes
192.168.2.6  mgmt
192.168.2.5  lb
192.168.2.11 www1
10.0.15.12 www2

EOL

ssh-keyscan lb >> /home/vagrant/.ssh/known_hosts
ssh-keyscan www1 >> /home/vagrant/.ssh/known_hosts
ssh-keyscan www2 >> /home/vagrant/.ssh/known_hosts
ssh-keyscan mgr >> /home/vagrant/.ssh/known_hosts

chown vagrant:vagrant /home/vagrant/.ssh/known_hosts

#to start the provisioning right 
ansible-playbook /vagrant/provisioning.yml



