#!/bin/bash

apt-get update
apt-get install -y software-properties-common make git

# Install docker-engine
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine

# Install ansible
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y ansible

# Init .profile for vagrant user
cat <<EOF > /home/vagrant/.profile
# Automatic switch to /vagrant on login
cd /vagrant

# Set id_rsa as vagrant users ssh id
cp -f /vagrant/vagrant/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
cp -f /vagrant/vagrant/id_rsa /home/vagrant/.ssh/id_rsa 2> /dev/null
chmod 0600 /home/vagrant/.ssh/id_rsa

# Copy the inventory
sudo cp -f /vagrant/vagrant/ansible-inventory /etc/ansible/hosts
sudo chmod 0666 /etc/ansible/hosts
EOF

# Init hosts file
cat <<EOF > /etc/hosts
127.0.0.1 localhost

10.10.10.10  dev.local
10.10.10.100 cloud.local
EOF
