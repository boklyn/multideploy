Getting Started with public IP provisioning
===========================================
When provisioning virtual machines with a public ip option, you would have to either have a dependent public IP resource in your template or have the public IP resource pre-provisioned. This template would leverage the latter approach. The temnplate would provision any number of public IP you specified. The tempalte requires the following parameter values to be configured:

1. pubipnameformat: This is the name format in which the template will create public ip(s) resource(s). If you are provisioning 2 public ip and the format is cust1-pubip-0 then the public ip rsources created will be cust1-pubip-01 and cust1-pubip-02
2. pubipoffset: This is the offset value leverage by the template in assigning a numerica value to the public ip resource. If the value is set to 4 then for the previous example the public ip resources created will be cust1-pubip-04 and cust1-pubip-05
3. pubipcount: This represents the number of public ip resource you would like the template to crate. In the previous example the value would be 2. 



