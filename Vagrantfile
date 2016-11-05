# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$shell = <<SCRIPT
echo 'Congratulations!!! Install Success. Please access http://localhost:10080'
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  CURRENT_DIR = File.expand_path(File.dirname(__FILE__))

  # Delete synced folder
  config.trigger.before [:up, :reload], stdout: true do
    SYNCED_FOLDER = CURRENT_DIR + "/.vagrant/machines/default/virtualbox/synced_folders"
    if File.exist?(SYNCED_FOLDER) then
      begin
        File.delete(SYNCED_FOLDER)
        info "Delete #{SYNCED_FOLDER}."
      rescue Exception => ex
        warn "Could not delete folder #{SYNCED_FOLDER}."
        warn ex.message
      end
    end
  end

  config.omnibus.chef_version = :latest
  config.vbguest.auto_update = false

  # CentOS 7.1
  config.vm.box = "bento/centos-7.1"
  config.vm.hostname = "eccube3vm.local"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # Synced folder
  config.vm.synced_folder "eccube", "/home/vagrant/eccube",
    mount_options: ["dmode=777", "fmode=666"],
    owner: "vagrant",
    create: true

  config.vm.network :forwarded_port, guest: 80, host: 10080
  config.vm.network :forwarded_port, guest: 443, host: 10443
  config.vm.network :forwarded_port, guest: 5432, host: 15432

  # Chef zero
  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = "./chef-repo/cookbooks"
    chef.nodes_path = "./chef-repo/nodes"
    chef.roles_path = "./chef-repo/roles"
    chef.add_role "development"
  end

  config.vm.provision "shell", inline: $shell
end
