#!/bin/bash

# Add develop key to cloud vagrant machine
sudo su -c 'cat /vagrant/vagrant/id_rsa.pub > /root/.ssh/authorized_keys'

# Init hosts file
cat <<EOF > /etc/hosts
127.0.0.1 localhost

10.10.10.100 cloud.local
EOF
