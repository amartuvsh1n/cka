#!/usr/bin/bash


echo ""
echo ' ________  ______  _______    ______          ______   __        ______   __    __  _______  '
echo '|        \|      \|       \  /      \        /      \ |  \      /      \ |  \  |  \|       \ '
echo '| $$$$$$$$ \$$$$$$| $$$$$$$\|  $$$$$$\      |  $$$$$$\| $$     |  $$$$$$\| $$  | $$| $$$$$$$\'
echo '| $$__      | $$  | $$/ $$| $$  | $$      | $$   \$$| $$     | $$  | $$| $$  | $$| $$  | $$'
echo '| $$  \     | $$  | $$    $$| $$  | $$      | $$      | $$     | $$  | $$| $$  | $$| $$  | $$'
echo '| $$$$$     | $$  | $$$$$$$\| $$  | $$      | $$   __ | $$     | $$  | $$| $$  | $$| $$  | $$'
echo '| $$       | $$ | $$/ $$| $$/ $$      | $$/  \| $$| $$__/ $$| $$__/ $$|/ $$'
echo '| $$      |   $$ \| $$    $$ \$$    $$       \$$    $$| $$     \\$$    $$ \$$    $$| $$    $$'
echo ' \$$       \$$$$$$ \$$$$$$$   \$$$$$$         \$$$$$$  \$$$$$$$$ \$$$$$$   \$$$$$$  \$$$$$$$ '
echo ""
echo ""
echo ""


echo -e "\e[96m------- install necessary libs ------- "
tput init
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl



echo -e "\e[96m------- add gpg key ------- "
tput init
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg




echo -e "\e[96m------- add kubernetes repository ------- "
tput init
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo -e "\e[96m------- update and install kubelet kubeadm kubectl ------- "
tput init
sudo apt-get update
sudo apt-get install -y kubelet=1.23.6-00 kubeadm=1.23.6-00 kubectl=1.23.6-00

echo -e "\e[96m------- hold kubelet kubeadm kubectl version ------- "
tput init
sudo apt-mark hold kubelet kubeadm kubectl


echo -e "\e[96m------- disable swap ------- "
tput init
sudo swapoff -a  
echo "swap disabled"


echo -e "\e[96m------- allow see bridged traffic ------- "
tput init
sudo modprobe br_netfilter
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf

# Enable iptables immediately
sudo sysctl -p
