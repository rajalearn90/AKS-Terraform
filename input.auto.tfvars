aks_vnet_name = "aksvnet"

sshkvsecret = "kvsshkey"

clientidkvsecret = "kvspClientId"

spnkvsecret = "kvspSecret"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/25"]

keyvault_rg = "RG_AvivaProj1"

keyvault_name = "AvivaKeyVault1"

azure_region = "East US"

resource_group = "RG_AvivaProj1"

cluster_name = "aksdemocluster"

dns_name = "aksdemocluster"

admin_username = "aksuser"

kubernetes_version = "1.33.3"

agent_pools = {
      name            = "pool1"
      count           = 2
      vm_size         = "Standard_D2s_v3"
      os_disk_size_gb = "30"
}
