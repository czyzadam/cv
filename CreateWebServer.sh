# Variables
rgName="A838492_adamczyz"
vmName="testweb"
location="swedencentral"
adminUser="azureuser"
adminPassword="Rowerek123321" 
vmSize="Standard_DS1_v2" 
publisher="Canonical"
offer="0001-com-ubuntu-server-jammy"
sku="22_04-lts-gen2"
version="latest"

# Create a resource group
#az group create --name $rgName --location $location

# Create a VM
az vm create \
  --resource-group $rgName \
  --name $vmName \
  --image $publisher:$offer:$sku:$version \
  --admin-username $adminUser \
  --admin-password $adminPassword \
  --size $vmSize \
  --public-ip-address-dns-name $vmName \
  --custom-data cloud-init.txt 

# Open port 80 for web traffic
az vm open-port --port 80 --resource-group $rgName --name $vmName