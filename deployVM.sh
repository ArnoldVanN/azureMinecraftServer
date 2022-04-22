#!/bin/bash
#Author: kxisxr
greenColour="\x1B[0;32m\033[1m"
endColour="\033[0m\x1B[0m"
redColour="\x1B[0;31m\033[1m"
blueColour="\x1B[0;34m\033[1m"
yellowColour="\x1B[0;33m\033[1m"
purpleColour="\x1B[0;35m\033[1m"
turquoiseColour="\x1B[0;36m\033[1m"
grayColour="\x1B[0;37m\033[1m"

#Creating the resource group
echo -e "${greenColour}"'Creating the resource group... '"${endColour}"
az group create -l westeurope -n MinecraftGroup

sleep 3

#Creating and deploying the Virtual Machine
echo -e "${greenColour}"'Creating and deploying the Virtual Machine... '"${endColour}"

az vm create --resource-group MinecraftGroup --name MinecraftAzure --image UbuntuLTS --admin-username minecraftuser --authentication-type ssh --generate-ssh-keys --public-ip-sku Standard --size Standard_D2ads_v5 --storage-sku Standard_LRS --os-disk-name MineOSHDD --os-disk-size-gb 30 --os-disk-caching ReadWrite --data-disk-sizes-gb 32 --data-disk-caching ReadWrite | tee results.txt

sleep 3

ip=$(cat results.txt | grep "publicIpAddress" | awk '{print $2}' | tr '"' ' ' | tr "," " " | tr -d " ")
echo -e "${greenColour}"'Connect to the VM with this command:'"${endColour}" "${turquoiseColour}"'ssh minecraftuser@'$ip''"${endColour}"
rm -rf results.txt
