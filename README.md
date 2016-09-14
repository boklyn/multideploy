# multideploy: Example of modular deployment with ARM templates. 
https://raw.githubusercontent.com/boklyn/multideploy/master/template-deploymain.json
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fboklyn%2Fmultideploy%2Fmaster%2Ftemplate-deploymain.json" target="_blank">
    <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fboklyn%2Fmultideploy%2Fmaster%2Fbasic-template-multisvrdeploy-all.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This solution provides an example of how you can configure a modular deployment of windows servers using the concept of base templates with modular swaping in and out of code segements to add/remove functionality. This example would allow begininers a framework to learn ARM concepts. The solution have the following dependencies:

1. An already pre-provisioned network. 
2. An already pre-provisioned domain environment, if you are leveraging the domain join templates. 

Getting Started with multideploy
================================
The multideploy solution leverages the linked template feature of ARM. Alot of these secondary templates are expected to be stored and assessible by the main deployment sequence. In this scenario we are leveraging github to store publically all the depenedent assets. The solution however been tested sucessfullly with private github repositiory, publically and privately assessible blob containers. 
