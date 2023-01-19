#!/bin/bash
wget https://github.com/runatlantis/atlantis/releases/download/v0.19.3/atlantis_linux_amd64.zip
sudo apt -y install unzip
unzip atlantis_linux_amd64
sudo apt update
sudo apt -y install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt -y install ansible 
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
sudo apt install python3-pip -y
pip install boto3
curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh |sudo sh