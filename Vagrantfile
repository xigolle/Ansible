Vagrant.configure(2) do |config|
  config.vbguest.auto_update = false
config.vbguest.no_remote = true
    config.vm.box = "ubuntu/trusty64"
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.memory = 384
        v.cpus = 2
    end 
                                            
     (1..2).each do |i|
    config.vm.define "web#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "web#{i}"
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
        node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        
    end
  end


    config.vm.define "rp" do |www2|
        www2.vm.hostname = "rp.dev"
        www2.vm.network :private_network, ip: "192.168.2.5"
        www2.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
        www2.vm.network :forwarded_port, guest: 22, host: 5555, auto_correct: true
        www2.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
        p
    end

    config.vm.define "mgr" do |mgr|
        mgr.vm.hostname = "mgr.dev"
        mgr.vm.network :private_network, ip: "192.168.2.6"
        mgr.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
        mgr.vm.network :forwarded_port, guest: 22, host: 6666, auto_correct: true
        mgr.vm.provision  "shell", path: "ansible.sh"
    end


end
