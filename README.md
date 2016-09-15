# multideploy: Example of modular deployment with ARM templates. 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fboklyn%2Fmultideploy%2Fmaster%2Ftemplate-deploymain.json" target="_blank">
    <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fboklyn%2Fmultideploy%2Fmaster%2Fbasic-template-multisvrdeploy-all.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This solution provides an example of how you can configure a modular deployment of windows servers using the concept of base templates with modular swaping in and out of code segements to add/remove functionality. This example would provide begininers with a framework to learn ARM concepts. All of the following examples leverage the multi-disk secondary template option. This solution allows you to provision a maximum of 16 additional disks with a max capacity of 16 TB. The solution have the following dependencies:

1. An already pre-provisioned network. 
2. An already pre-provisioned domain environment, if you are leveraging the domain join templates. 
3. At least one storage account to hold the virtual disks, and the windows OS diagnostic logs. Ideally you can specify two. 

This solution have example templates with the folowing scenarios:
1. Provision any number of servers with static ip address assignment
2. Provision any number of servers with dynamic ip address assignment
3. Provision any number of servers with static ip address assignment and join them to domain. 
4. Provision any number of servers with static ip address assignment and leverage a custom script extenstion to create a storage pool to intialied the disk. 
5. Provision any number of servers with static ip address assignment, custom script extension, and domain join functionality. 

Getting Started with multideploy
================================
The multideploy solution leverages the linked template feature of ARM. Alot of these secondary templates are expected to be stored and assessible by the main deployment sequence. In this scenario we are leveraging github to store publically all the depenedent assets. The solution however been tested sucessfullly with private github repositiory, publically and privately assessible blob containers. Over time this solution will be update to add the following examples:

1. Create a custom netwok from scratch
2. Provision a domain with a primary and a secondary domain controller. 
3. Create a keyvault and add secrets to the keyvault.  

The solution also provides a library of customizations that are available and instructions on how to add/remove functionality through the MultiServerDeployDoc documementation. 

Pre-requisites
==============
This solution is heavily dependent on the following ARM concepts. It is advisable that you understand these concepts before leveraging the solution. 
•	Copyindex function: https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-functions/#copyindex
•	Copy resource/nested resourcing functionality: https://azure.microsoft.com/en-us/documentation/articles/resource-group-create-multiple/
•	Template linking: https://azure.microsoft.com/en-us/documentation/articles/resource-group-linked-templates/
•	Resource dependencies: https://azure.microsoft.com/en-us/documentation/articles/resource-group-define-dependencies/
