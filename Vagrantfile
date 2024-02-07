Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = "70GB" # vagrant plugin install vagrant-disksize
  config.vm.hostname = "openstack-controller"
  
  config.vm.network "private_network", ip: "192.168.50.5"
  config.vm.network "public_network", ip: "192.168.10.116", bridge: "Ethernet"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "10240"
     vb.cpus = 10
     vb.name = "openstack-controller"
   end

   config.vm.provision "shell", path: "openstack-init.sh"
end
