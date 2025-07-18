#### Parameters

$keyvaultname = "aviva-akscluster-kv"
$location = "East US"
$keyvaultrg = "RG_AvivaProj1"

$sshkeysecret = "xxxxx" # e.g. ekspublickey

$spnclientid = "xxxxxx" # service principle's client ID
$clientidkvsecretname = "xxxxxx" # e.g. spn-id
$spnclientsecret = "xxxxxx" # generated client secret of the service principle, usually should not store in the repo
$spnkvsecretname = "xxxxx" # e.g. spn-secret
$spobjectID = "xxxxx" # service principle's Object ID
$userobjectid = "bc35ed36-da42-4065-9178-6d3206f96c8a" # same service principle's Object ID


#### Create Key Vault

New-AzResourceGroup -Name $keyvaultrg -Location $location

New-AzKeyVault -Name $keyvaultname -ResourceGroupName $keyvaultrg -Location $location
# New-AzKeyVault -Name aviva-akscluster-kv -ResourceGroupName "RG_AvivaProj1" -Location "East US" #vault names are golablly unique

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultname -UserPrincipalName $userobjectid -PermissionsToSecrets get,set,delete,list
#Set-AzKeyVaultAccessPolicy -VaultName aviva-akscluster-kv -ObjectId "bc35ed36-da42-4065-9178-6d3206f96c8a" -PermissionsToSecrets get,set,delete,list

#### create an ssh key for setting up password-less login between agent nodes.

ssh-keygen  -f ~/.ssh/id_rsa_terraform


#### Add SSH Key in Azure Key vault secret

$pubkey = cat ~/.ssh/id_rsa_terraform.pub

$Secret = ConvertTo-SecureString -String $pubkey -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $sshkeysecret -SecretValue $Secret


#### Store service principal Client id in Azure KeyVault

$Secret = ConvertTo-SecureString -String $spnclientid -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $clientidkvsecretname -SecretValue $Secret


#### Store service principal Secret in Azure KeyVault

$Secret = ConvertTo-SecureString -String $spnclientsecret -AsPlainText -Force

Set-AzKeyVaultSecret -VaultName $keyvaultname -Name $spnkvsecretname -SecretValue $Secret


#### Provide Keyvault secret access to SPN using Keyvault access policy

Set-AzKeyVaultAccessPolicy -VaultName $keyvaultname -ServicePrincipalName $spobjectID -PermissionsToSecrets Get,Set
