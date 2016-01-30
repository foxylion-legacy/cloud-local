Vagrant.configure("2") do |config|
  config.ssh.shell = "bash"

  config.vm.define "dev" do |host|
    host.vm.box = "ubuntu/wily64"
    host.vm.provision :shell, inline: "hostnamectl set-hostname dev.local"
    host.vm.network "private_network", ip: "10.10.10.10"

    host.vm.provision "shell", path: "vagrant/provison-dev-vm.sh"

    host.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 4
    end
  end

  config.vm.define "cloud" do |host|
    host.vm.box = "ubuntu/wily64"
    host.vm.provision :shell, inline: "hostnamectl set-hostname cloud.local"
    host.vm.network "private_network", ip: "10.10.10.100"

    # HTTP
    host.vm.network "forwarded_port", guest: 80,  host: 80
    host.vm.network "forwarded_port", guest: 443, host: 443
    # Mail (SMTP)
    host.vm.network "forwarded_port", guest: 25,  host: 25
    host.vm.network "forwarded_port", guest: 587, host: 587
    # Mail (IMAP)
    host.vm.network "forwarded_port", guest: 143, host: 143
    host.vm.network "forwarded_port", guest: 993, host: 993
    # Mail (POP3)
    host.vm.network "forwarded_port", guest: 110, host: 110
    host.vm.network "forwarded_port", guest: 995, host: 995

    host.vm.provision "shell", path: "vagrant/provison-cloud-vm.sh"

    #host.vm.synced_folder "vagrant-data/cloud-letsencrypt-config", "/cloud/letsencrypt/config"

    host.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end
  end
end
