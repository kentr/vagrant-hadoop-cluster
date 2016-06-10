# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Custom minimal Vagrantfile to install hadoop cluster.
# See https://dzone.com/articles/setting-hadoop-virtual-cluster

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1024"
    ]
  end

#   config.vm.define "hadoop_httpfs" do |hadoop_httpfs|
#   end
#   config.vm.provider "virtualbox" do |vb|
#     vb.name = "hadoop_httpfs"
#   end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "base-hadoop.pp"
    puppet.module_path = "modules"
  end

#   config.vm.define :backup do |backup_config|
#     backup_config.vm.network :private_network, ip: "10.10.0.51"
#     backup_config.vm.host_name = "backup"
#   end
#
#   config.vm.define :hadoop1 do |hadoop1_config|
#     hadoop1_config.vm.network :private_network, ip: "10.10.0.53"
#     hadoop1_config.vm.host_name = "hadoop1"
#   end
#
#   config.vm.define :hadoop2 do |hadoop2_config|
#     hadoop2_config.vm.network :private_network, ip: "10.10.0.54"
#     hadoop2_config.vm.host_name = "hadoop2"
#   end
#
#   config.vm.define :hadoop3 do |hadoop3_config|
#     hadoop3_config.vm.network :private_network, ip: "10.10.0.55"
#     hadoop3_config.vm.host_name = "hadoop3"
#   end

  config.vm.define :master do |master_config|
    master_config.vm.network :private_network, ip: "10.10.0.52"
    master_config.vm.host_name = "master.example.com"

    master_config.vm.network "forwarded_port", guest: 50070, host: 50070,
      auto_correct: true
  end

end
