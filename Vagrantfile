# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "canonical-ubuntu-12.04"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  
  # Ensure Chef is installed for provisioning
  config.omnibus.chef_version = :latest

  config.vm.network :private_network, ip: "33.33.33.33"

  config.berkshelf.enabled = true
  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  
  config.vm.hostname = "soa-tools.local"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "2"]
  end
  
  config.vm.provision :chef_solo do |chef|
    #chef.rest_timeout = 86400
    chef.json = {
      run_list: ["recipe[soa_tools::wso2greg]"]
    }
  end
end
