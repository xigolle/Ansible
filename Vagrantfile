Vagrant.configure(2) do |config|
# need to disable this because crashes on my computer when trying to update!
 config.vbguest.auto_update = false
config.vbguest.no_remote = true
    config.vm.box = "ubuntu/trusty64"
    config.ssh.insert_key = false
    config.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 2
    end 

    config.vm.define "lb" do |lb|
        lb.vm.hostname = "lb.dev"
        lb.vm.network :private_network, ip: "192.168.2.5"
        lb.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
        lb.vm.network :forwarded_port, guest: 22, host: 5555, auto_correct: true
        # using 8079 because port 8080 didn't work for me
        lb.vm.network :forwarded_port, guest: 80, host: 8079, auto_correct: true
    end

    

    config.vm.define "mgr" do |mgr|
        mgr.vm.hostname = "mgr.dev"
        mgr.vm.network :private_network, ip: "192.168.2.6"
        mgr.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
        mgr.vm.network :forwarded_port, guest: 22, host: 6666, auto_correct: true
        mgr.vm.provision  "shell", path: "ansible.sh"
    end

    (1..2).each do |i|
    config.vm.define "www#{i}" do |node|
        node.vm.hostname = "www#{i}.dev"
            node.vm.network :private_network, ip: "192.168.2.1#{i}"
           node.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", disabled: true
            node.vm.network :forwarded_port, guest: 22, host: "333#{i}", auto_correct: true
    end
    end


end
