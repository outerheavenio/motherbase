# Motherbase: Cloud based TechOps centre in a box

Mother base is a tool that can be used to provision virtual infrastructure that can be used in a number of different scenarios. The resulting infrastructure will consist of services that are vital to enable productivity, innovation and collaboration in secure manner. This is not just specific to the one particular aspect of IT but all aspects including startup bootstrap, TechOps Center and offensive/defensive SecOps enviroments.  

The project aims to be open source in that the software used for this project is publicly available to those that look for it. The software that we will use in this process is the following:

## HashiCorp 

### Terraform
This is what will be used in order to provision the infrastructure. It is written in golang and has support for many providers. This software talks to your cloud provider's API allowing you to declaratively define your infrastructure state. 

 
[Check it out here](https://www.terraform.io/)

### Consul
This is a key/value store with service discovery capabilities. It has a lot of benefits and it is easily integratable with other hashicorp software. We can consider consul to be like a message bus. It basically looks after the environment and ensures distrubed message are in consitent sync with out to any errors.

[Check it out here](https://www.consul.io)


### Vault 
This is another tool from HashiCorp. This tool is drastically different in that it is centred around secrets management and PKI. It has a number of different capabilities. It is capable of integrating with consul for HA purposes, it has an API for secrets retrieval and storage. To gain a full understanding of the capabilities please check out the project site on the below page. 

[Check it out here](https://www.vaultproject.io/)

### Nomad
This will be our scheduling program. The intent will be focused around using it for ditributing load amonst nodes. It supports a number of diffirent types of runtime, including binary based options, containers and even kvm images by qume.  Nomad is perfact for intergration with the hashicorp eco system in order to enable seamless scheduling and orchestration. It plays very well with consul too.

[Check it out here](https://www.nomadproject.io/)

## RedHat

### Ansible

This is the configuration management tool used in this environment. We choose this tool because it is agentless via ssh and WinRM. This is good because it enables us to perform a deploy and forget. It simplifies things and based on your threat model it limits the attack surface. It runs once and that is all which great.

[Check it out here](https://www.ansible.com/)

### FreeIPA

We will be using freeipa in order to manage identities and other networking services like DNS, NTP, LDAP, Root PKIś and number of other things. IPA is an enterprise level IdM for all types of environments. It is very monolithic and not cloud agnostic however we can tweak it a little to atleast run and provide the necessary services. In the situtaiton that you have a on-prem data centre FreeIPA will be awesom for the job.

[Check it out here](https://www.freeipa.org)

## OSS

(Still reviewing best tools for this section)

### IPsec VPN (Wireguard/Algo)

This will be the VPN software used in this environment. We will use this to permit user’s access to the services we provisioning. There will be multiple authentication methods available. The main authentication method will be idealy software based.

[Algo](https://github.com/trailofbits/algo) is an open source set of scripts that can be used to provision a vpn with access to multiple enviroments. It supports alot of features and is very easy to use.

[Wireguard](https://www.wireguard.com/) is basically what docker is to LXC. It simplfies the process of creating a VPN between two points as far as I am aware. I do not know if its suitable for site to site typeś of situitions but its on top of peoples lists. When ever anyone mentions it, you will also here something like itś not stable for production use cases yet.

### SubgraphOS

This is the ideal desktop OS for this type of environment. I would of previously recommended ChromeOS or Chromoimum OS for this kind of enviroment, however SubgrapthOS is the most suitable provided how flexiable it is. It has special sand box named OZ that is really cool plus it utilizes seccomp profiles. We require a very secure OS since the users laptop will generally be the weak point in the chain. This OS limits the attack surface and tries to generally protect the user from shooting them self in the foot. You can use alternative systems thought base on threat model. This is generally not requirement but a best practice.

[Check it out here](https://subgraph.com/)

### Gitlab 

This is a piece of software that can be used to host your git repositories with a ton features that you didn’t know you needed until you use them. It has awesome integration for some of the general network management protocols including monitoring systems and authorization systems. It even has a container registry, issue tracker and CI/CD capabilities. It is written in ruby and is somewhat heavey in nature. This will most likely be an optional feature of the framework.

The alternative might be gitolite or github although it is hosted. Gitolite is a guiless git repositry managment system. It very minimal and light.

[Check it out here](https://about.gitlab.com/)


