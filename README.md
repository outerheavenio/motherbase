# Motherbase: Cloud based TechOps centre in a box

Mother base is a tool that can be used to provision virtual infrastructure that can be used in a number of different scenarios. The resulting infrastructure will consist of services that are vital to enable productivity, innovation and collaboration in secure manner. This is not just specific to the one particular aspect of IT but all aspects including startup bootstrap, TechOps Center and offensive/defensive SecOps enviroments.  

The project aims to be open source in that the software used for this project is publicly available to those that look for it. The software that we will use in this process is the following:

##HashiCorp 

##Terraform
This is what will be used in order to provision the infrastructure. It is written in golang and has support for many providers. This software talks to your cloud provider's API allowing you to declaratively define your infrastructure state. 

 
[Check it out here]: https://www.terraform.io/

##Consul
This is a key/value store with service discovery capabilities. It has a lot of benefits and it is easily integratable with other hashicorp software. We can consider consul to be like a message bus. It basically looks after the environment and ensures distrubed message are in consitent sync with out to any errors.

[Check it out here]: https://www.consul.io


##Vault 
This is another tool from HashiCorp. This tool is drastically different in that it is centred around secrets management and PKI. It has a number of different capabilities. It is capable of integrating with consul for HA purposes, it has an API for secrets retrieval and storage. To gain a full understanding of the capabilities please check out the project site on the below page. 

[Check it out here]: https://www.vaultproject.io/

##Nomad
This will be our scheduling program. The intent will be focused around using it for ditributing load amonst nodes. It supports a number of diffirent types of runtime, including binary based options, containers and even kvm images by qume.  Nomad is perfact for intergration with the hashicorp eco system in order to enable seamless scheduling and orchestration. It plays very well with consul too.

[Check it out here]: https://www.nomadproject.io/

