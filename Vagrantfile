# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

require 'yaml'

# Archivo con la configuración del servidor
CONF = YAML.load_file('server_config.yml')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = CONF['box']

  CONF['forward_ports'].each do |port|
      config.vm.network "forwarded_port", guest: port['guest'], host: port['host']
  end

  config.vm.network "private_network", ip: CONF['private_ip']
  config.vm.hostname = CONF['hostname']

  config.vm.provider "virtualbox" do |vb|
    vb.name = CONF['name']
    vb.customize ["modifyvm", :id, "--memory", CONF['memory']]
  end

  CONF['scripts'].each do |file|
      config.vm.provision "shell", path: file['config']
  end

  CONF['sync_folders'].each do |folder|
      config.vm.synced_folder folder['guest'], folder['host']
  end
end
