Vagrant.configure("2") do |config|
    # Base VM OS configuration.
    #config.vm.box = "box-cutter/ubuntu1604"
    config.vm.synced_folder '.', '/vagrant', disabled: true
    config.ssh.insert_key = false
  
    config.vm.provider :virtualbox do |v|
      v.memory = 2072
      v.cpus = 2
      v.customize ['modifyvm', :id, '--natnet1', '192.168.222.0/24']
    end
  
    # Define four VMs with static private IP addresses and vagrant needs only letters & numbers.
    boxes = [
      { :name => "ctrlmaster", :ip => "192.168.3.2", :OS => "centos/7", :fqdn => "#{:name}.motherbase"},
      { :name => "ctrlslave", :ip => "192.168.3.3", :OS => "centos/7", :fqdn => "#{:name}.motherbase"},
      { :name => "ctrlslave1", :ip => "192.168.3.4", :OS => "bento/ubuntu-16.04", :fqdn => "#{:name}.motherbase"},
    ]
  
    # Provision each of the VMs.
    boxes.each do |opts|
      config.vm.define opts[:name] do |config|
        config.vm.box = opts[:OS]
         #vm_config.vm.boot_mode = :gui
        config.vm.hostname = opts[:name]
        config.vm.network :private_network, ip: opts[:ip]
        # Provision all the VMs using Ansible after last VM is up.
        if opts[:name] == "ctrlmaster"
          config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/site.yml"
            ansible.inventory_path = "ansible/inventory"
            ansible.verbose = "v"
            ansible.limit = "all"
          end
        end
      end
    end
  end
  

  