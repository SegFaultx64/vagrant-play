Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.share_folder("app", "/var/play/app", "./app", :mount_options => ["dmode=777","fmode=777"])

  # Enable the Puppet provisioner
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "vagrant_main"

    chef.json.merge!({
      "play" => {
        :app => [
          {
            :name => 'play-demo',
            :git => 'git://github.com/SegFaultx64/play-demo.git'
          }
        ]
      },
      "oh_my_zsh" => {
        :users => [
          {
            :login => 'vagrant',
            :theme => 'robbyrussell',
            :plugins => ['git']
          }
        ]
      }
    })
  end

  # Forward guest port 80 to host port 4567
  config.vm.forward_port 80, 4567
  config.vm.forward_port 9000, 9000
end
