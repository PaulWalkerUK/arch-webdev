# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "archlinux/archlinux"
  

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    # This allows symlinks to be created within the /vagrant root directory, 
    # which is something librarian-puppet needs to be able to do. This might
    # be enabled by default depending on what version of VirtualBox is used.
    
    ####vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    
    vb.cpus = 4
    vb.memory = "4096"
    vb.customize ["modifyvm", :id, "--vram", "256"]
  end
  
  config.vm.provision "update-arch", type: "shell", path: "shell/update-arch.sh"
  
  config.vm.provision "setup-puppet", type: "shell", path: "shell/setup-puppet.sh"



  # Now run the puppet provisioner. Note that the modules directory is entirely
  # managed by librarian-puppet
  config.vm.provision "puppet", type:"puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.hiera_config_path = "puppet/hiera.yaml"
    puppet.options = "--modulepath /etc/puppet/modules"
    #puppet.options = "--modulepath /etc/puppet/modules --verbose --debug"
  end

end
