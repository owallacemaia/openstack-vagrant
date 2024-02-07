sudo apt update -y && sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo chmod +x /opt/stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
sudo -u stack -i
git clone https://opendev.org/openstack/devstack 
cd devstack
sudo echo '[[local|localrc]]
ADMIN_PASSWORD=admin
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD 
HOST_IP=192.168.10.116
#FLAT_INTERFACE=Ethernet
#FLOATING_RANGE=192.168.10.225/24
#FIXED_RANGE=10.11.12.0/24
#FIXED_NETWORK_SIZE=256
#SWIFT_REPLICAS=1

enable_service s-proxy s-object s-container s-account
enable_plugin heat https://opendev.org/openstack/heat
enable_plugin heat-dashboard https://opendev.org/openstack/heat-dashboard
enable_plugin magnum https://opendev.org/openstack/magnum
enable_plugin magnum-ui https://opendev.org/openstack/magnum-ui' > local.conf

sudo chown stack:stack -R /opt/stack