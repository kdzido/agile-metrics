# -*- mode: ruby -*-
# vi: set ft=ruby :

$create_swapfile = <<SCRIPT
echo "Preparing 2GB swap file..."
# Create swap space
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon -s
SCRIPT

# TODO consider centos/7
# TODO ubuntu/bionic64

Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", type: "virtualbox", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  end

  config.vm.define "metrics" do |d|
    d.vm.box = "ubuntu/xenial64"
    d.vm.hostname = "metrics"
    d.vm.network "private_network", ip: "10.44.0.100"
    d.vm.network "forwarded_port", guest: 5601, host: 5601
    d.vm.network "forwarded_port", guest: 9200, host: 9200
    d.vm.network "forwarded_port", guest: 5044, host: 5044
    d.vm.network "forwarded_port", guest: 8081, host: 8081
    d.vm.network "forwarded_port", guest: 8081, host: 8081
    d.vm.network "forwarded_port", guest: 8090, host: 8090

    d.vm.provision :shell, :inline => $create_swapfile
    # d.vm.provision :shell, inline: "sudo apt-get install -y python2.7"
    d.vm.provision :shell, path: "scripts/bootstrap_ansible.sh"
    d.vm.provision :shell, inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/ansible/dev.yml -c local"
    d.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.memory = 2048
      v.cpus = 2
    end
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_install = true
    config.vbguest.no_remote = true
  end
end
