Vagrant.configure("2") do |c|
  c.berkshelf.enabled = false if Vagrant.has_plugin?("vagrant-berkshelf")
  c.vm.box = "bento/ubuntu-16.04"
  c.vm.hostname = "default-ubuntu-1604.vagrantup.com"
  c.vm.synced_folder ".", "/vagrant", disabled: true
  c.vm.synced_folder "C:/Users/ppadgett/.kitchen/cache", "/tmp/omnibus/cache", create: true
  c.vm.provider :virtualbox do |p|
    p.gui = true
    p.customize ["modifyvm", :id, "--memory", "2048"]
    p.customize ["modifyvm", :id, "--vram", "256"]
    p.customize ["modifyvm", :id, "--usb", "on"]
    p.customize ["modifyvm", :id, "--usbxhci", "on"]
    p.customize ["usbfilter", 'add', '0', '--target', :id, "--name", "Movidius MA2X5X [0001]", '--vendorid', '03E7']
    p.customize ["usbfilter", 'add', '1', '--target', :id, "--name", "Movidius VSC Loopback Device [0001]", '--vendorid', '03E7']
  end
end