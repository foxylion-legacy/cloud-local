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
    host.vm.network "public_network"

    host.vm.provision "shell", path: "vagrant/provison-cloud-vm.sh"

    host.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
    end
  end
end
