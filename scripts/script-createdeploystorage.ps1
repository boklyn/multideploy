<# Start Pre-req section#>
add-azurermaccount

<# Start Constants #>
#yoursubid
$subid = "2115081f-a797-4728-9525-96db764bda0c"
$tenid = "9f610bd7-5ae6-42b6-b758-5cf2ddc6c058"
$workingdir = "C:\Users\boklyn\OneDrive - Microsoft\Engagements\Microsoft\MultiDeploySolution\"
<# Availabile locations #>
<#'eastus,eastus2,eastus2stage,westus,westeurope,eastasia,southeastasia,japaneast,japanwest,northcentralus,southcentralus,centralus,northeurope,brazilsouth,aus
traliaeast,australiasoutheast,southindia,centralindia,westindia,canadaeast,canadacentral'#>
$storlocation = "eastus"
$resourcegrp = "multideploydemo1"
$storagename = "cust1e1deploy"
$containername = "pubtest"
<# End Constants   #>

New-AzureRmResourceGroup -Name $resourcegrp -Location "East US"

Select-AzureRMSubscription -SubscriptionId $subid -TenantId $tenid
Set-Location -Path $workingdir
#create storage account
New-AzureRmStorageAccount -ResourceGroupName $resourcegrp -Name $storagename -Type Standard_LRS -Location $storlocation
$storkey = Get-AzureRmStorageAccountKey -Name $storagename -ResourceGroupName $resourcegrp
$storcontext = New-AzureStorageContext -StorageAccountName $storagename -StorageAccountKey $storkey.Key1
#create container struture. 
New-AzureStorageContainer -Name $containername -Permission Container -Context $storcontext
$assets = Get-ChildItem assets

foreach ($asset in $assets){
    Set-AzureStorageBlobContent -File $asset.FullName -Container $containername -Blob $asset.Name -Context $storcontext
}
 
