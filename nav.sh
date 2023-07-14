#!/bin/bash
# Script to carry out different setup activities
# Ask the user to launch a few external command-line tools
echo "Some command external tools to run press enter to continue 1. net-tools"
read enter
# Put in the net-tools
sudo apt install net-tools
echo "===================================================================="
# Change hostname to 'autosrv'
sudo hostnamectl set-hostname autosrv
echo "Hostnamer changed to autosrv"
echo "===================================================================="
# Request the interface name from the user before configuring the IP
echo "Enter one interface name to change IPs"
ip link show | awk ' !/link/ {print $2}'
read intface
# Add IP settings to the netplan configuration file
$intface >> /etc/netplan/*.yaml
dhcp4: no >> /etc/netplan/*.yaml
addresses: 192.168.16.21/24 >> /etc/netplan/*.yaml
gateway4: 192.268.16.1 >> /etc/netplan/*.yaml
search: [home, arpa, localdomain] >> /etc/netplan/*.yaml
echo "Interface setting changed"
echo "===================================================================="
# Setup necessary software
echo "Installing software enter Y as per instrucuions"
sudo apt install openssh-server
sudo apt install apache2
sudo apt install squid
# Set up the firewall
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 3128
echo "Firewall rules updated, current rules are below:"
sudo ufw status
echo "===================================================================="
# Users Add
echo "Adding user"
sudo useradd -m -s /bin/bash dennis
sudo useradd -m -s /bin/bash aubrey
sudo useradd -m -s /bin/bash snibbles
sudo useradd -m -s /bin/bash brownie
sudo useradd -m -s /bin/bash scooter
sudo useradd -m -s /bin/bash sandy
sudo useradd -m -s /bin/bash perrier
sudo useradd -m -s /bin/bash cindy
sudo useradd -m -s /bin/bash tiger
sudo useradd -m -s /bin/bash yoda
echo "Generate SSH keys"
sudo ssh-keygen -t rsa -b 4096 -f /home/dennis/.ssh/id_rsa -C "dennis@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/dennis/.ssh/id_ed25519 -C "dennis@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/aubrey/.ssh/id_rsa -C "aubrey@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/aubrey/.ssh/id_ed25519 -C "aubrey@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/snibbles/.ssh/id_rsa -C "snibbles@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/snibbles/.ssh/id_ed25519 -C "snibbles@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/brownie/.ssh/id_rsa -C "brownie@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/brownie/.ssh/id_ed25519 -C "brownie@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/scooter/.ssh/id_rsa -C "scooter@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/scooter/.ssh/id_ed25519 -C "scooter@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/sandy/.ssh/id_rsa -C "sandy@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/sandy/.ssh/id_ed25519 -C "sandy@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/perrier/.ssh/id_rsa -C "perrier@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/perrier/.ssh/id_ed25519 -C "perrier@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/cindy/.ssh/id_rsa -C "cindy@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/cindy/.ssh/id_ed25519 -C "cindy@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/tiger/.ssh/id_rsa -C "tiger@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/tiger/.ssh/id_ed25519 -C "tiger@generic-vm"
sudo ssh-keygen -t rsa -b 4096 -f /home/yoda/.ssh/id_rsa -C "yoda@generic-vm"
sudo ssh-keygen -t ed25519 -f /home/yoda/.ssh/id_ed25519 -C "yoda@generic-vm"
echo "Add the SSH public keys to the authorized_keys"
# Each user's authorized_keys file should contain their SSH public keys.
sudo sh -c 'cat /home/dennis/.ssh/id_rsa.pub >> /home/dennis/.ssh/authorized_keys'
sudo sh -c 'cat /home/dennis/.ssh/id_ed25519.pub >> /home/dennis/.ssh/authorized_keys'
sudo sh -c 'echo "ssh-ed25519 AAAAC3NzaC11ZDI1NTE5AAAAIG4rT3vTt990x5kndS4HmgTrKBT8SKzhK4rhGKEVGICI student@generic-vm" >> /home/dennis/.ssh/authorized_keys'

sudo sh -c 'cat /home/aubrey/.ssh/id_rsa.pub >> /home/aubrey/.ssh/authorized_keys'
sudo sh -c 'cat /home/aubrey/.ssh/id_ed25519.pub >> /home/aubrey/.ssh/authorized_keys'

sudo sh -c 'cat /home/snibbles/.ssh/id_rsa.pub >> /home/snibbles/.ssh/authorized_keys'
sudo sh -c 'cat /home/snibbles/.ssh/id_ed25519.pub >> /home/snibbles/.ssh/authorized_keys'

sudo sh -c 'cat /home/brownie/.ssh/id_rsa.pub >> /home/brownie/.ssh/authorized_keys'
sudo sh -c 'cat /home/brownie/.ssh/id_ed25519.pub >> /home/brownie/.ssh/authorized_keys'

sudo sh -c 'cat /home/scooter/.ssh/id_rsa.pub >> /home/scooter/.ssh/authorized_keys'
sudo sh -c 'cat /home/scooter/.ssh/id_ed25519.pub >> /home/scooter/.ssh/authorized_keys'

sudo sh -c 'cat /home/sandy/.ssh/id_rsa.pub >> /home/sandy/.ssh/authorized_keys'
sudo sh -c 'cat /home/sandy/.ssh/id_ed25519.pub >> /home/sandy/.ssh/authorized_keys'

sudo sh -c 'cat /home/perrier/.ssh/id_rsa.pub >> /home/perrier/.ssh/authorized_keys'
sudo sh -c 'cat /home/perrier/.ssh/id_ed25519.pub >> /home/perrier/.ssh/authorized_keys'

sudo sh -c 'cat /home/cindy/.ssh/id_rsa.pub >> /home/cindy/.ssh/authorized_keys'
sudo sh -c 'cat /home/cindy/.ssh/id_ed25519.pub >> /home/cindy/.ssh/authorized_keys'

sudo sh -c 'cat /home/tiger/.ssh/id_rsa.pub >> /home/tiger/.ssh/authorized_keys'
sudo sh -c 'cat /home/tiger/.ssh/id_ed25519.pub >> /home/tiger/.ssh/authorized_keys'

sudo sh -c 'cat /home/yoda/.ssh/id_rsa.pub >> /home/yoda/.ssh/authorized_keys'
sudo sh -c 'cat /home/yoda/.ssh/id_ed25519.pub >> /home/yoda/.ssh/authorized_keys'

echo "Giving dennis sudo previlages"
sudo visudo
echo"done"

