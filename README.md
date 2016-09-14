# multideploy: Example of modular deployment with ARM tempaltes. 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMincom%2Fepm-devops%2Fmaster%2FVelocity%2Fvelocity-deploymain.json%3Ftoken%3DAMNanCaM834JbjKZFWcgPjeV35WgLExLks5X4ZZZwA%3D%3D" target="_blank">
    <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FMincom%2Fepm-devops%2Fmaster%2FDeployment%2FVelocity%2Fvso-template-multisvrdeploy_withkey.cse.domain.json%3Ftoken%3DAMNanKrJXyH06GHq590vS7QJHUPwfgklks5X4ZIWwA%3D%3D" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This system will support the provisioning of the following virtual machine classifications:

1. GIS Analyst VM(s)
2. Analyst VM(s)
3. Data Services VM(s)

The following scenarios are supported with this system:

Add new VM classification type scenario
=======================================
To provision a new GIS analyst VM you would need to modify the following file: vso-parameters-key.gisanalysts.svrs.json

To provision a new analyst VM you would need to modify the following file: vso-parameters-key.analysts.svrs.json

To provision a new data services VM you would need to modify the following file: vso-parameters-key.gisanalysts.svrs.json

NOTE: The following example assumes there was 1 machine already provisioned and you are proceeding to add the second one. 

The following items needs to be modified in order to sucessfully add a new VM with any of the above classifications:

1. sitecount

    This number has to be incremented by 1 from the last value. 
2. vmnames

    You would need to add the new virtual machine name. 
    
    An example would be: "value": [ "usw-usrwksg01", "usw-usrwksg02" ]
3. vmSizes

    You would need to add an additional vmsize to represent the new virtual machine. 
    
    An example would be: "value": [ "Standard_DS2", "Standard_DS2" ]
4. Diskcount
    
    You would need to add an additional row to represent the new diskcount of the new VM. 

    An example would be: "value": [ 1, 1 ]
5. disksizes
    
    You would need to add an additional row to represent the disk sizes of the new VM. 

    An example would be:
    
      "value": [
        [ 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
        [ 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
      ]
6. initdisksizes

    You would need to add an additional row for init disk sizes of your new VM. 

    An example would be: "value": [ "95", "95" ]
7. vmtype
    
    You would need to add an additional row for the vmtype of your new vm. 

    An example would be: "value": [ "gisanalyst", "gisanalyst" ]
8. windowsOSversion
    
    You would need to add an additional ro for the windowsOS version of your new vm. 

    An example would be: "value": [ "2012-R2-Datacenter", "2012-R2-Datacenter" ]
9. VHDStorageAccountNames
 
    For the most part the value of this will remain the same. The following storage account and role pairing is currrently in placed:

abbw1vsosto05:GIS Analyst VM(s)

abbw1vsosto06:Analyst VM(s)

abbw1vsosto07:Data Services VM(s)

You have to be aware that ideally you should place around 30 VM per storage account. When you have reach that point for a specific role, you should create a new storage account from the portal and change the value to represent the new storage account name. 

Deployment Phase instructions
=============================
Once you have modified all the parameter settings to your liking you would then save the updated values and check into github. Because you are using a private github,the token values will most likely have changed and the previous url reference in velocity-deploymain.json will no longer be valid. Please see the attached document updateparameters document for detailed instructions on how to retrieve and update the new URL. After following those steps you can then proceed to click on the "Deploy to Azure" picture and follow the following instructions:

1. Upon clicking the deploy to azure, it should redirect you to the azure portal page. You would then see a custom deployment window. 
2. 

