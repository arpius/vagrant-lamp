# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-6.7-i386"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "vagrant-lamp"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-lamp"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.synced_folder "htdocs", "/var/www/html"
  config.vm.provision "shell", path: "config.sh"
end
