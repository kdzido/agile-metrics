# -*- mode: ruby -*-
# vi: set ft=ruby :

$create_2g_swapfile = <<SCRIPT
echo "Preparing 2GB swap file..."
# Create swap space
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon -s
SCRIPT


Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end

  config.vm.define "metrics" do |d|
    d.vm.box = "centos/7"
    d.vm.hostname = "metrics"
    d.vm.network "private_network", ip: "10.44.0.100"
    d.vm.provision :shell, :inline => $create_2g_swapfile
    d.vm.provision :shell, path: "vagrant_scripts/bootstrap_ansible.sh"
    d.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.memory = 4096
      v.cpus = 2
    end
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = true
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
