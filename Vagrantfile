VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'vagrant'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.network :forwarded_port, guest: 80, host: 8888

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'apt'
    chef.add_recipe 'openssl'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::system'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'apache2'
    chef.add_recipe 'apache2::mod_rewrite'
    chef.add_recipe 'passenger_apache2'
    chef.add_recipe 'mysql'
    chef.add_recipe 'mysql::server'

    chef.json = {
      :dependencies => { 
        :gem_binary => "/usr/local/rbenv/shims/gem" 
      },
      :languages => {
        :ruby => {
          :ruby_bin => '/usr/local/rbenv/shims/ruby'
        }
      },
      :apache => {
        :default_site_enabled => true,
        :docroot_dir          => '/vagrant/public',
        :server_name          => 'app.local',
        :enable_mods          => ['rewrite', 'passenger'],
        :allow_override       => 'All'
      },
      :passenger => {
        :ruby_bin => '/usr/local/rbenv/shims/ruby'
      },
      :mysql => {
        :server_debian_password => 'vagrant',
        :server_root_password   => 'vagrant',
        :server_repl_password   => 'vagrant'
      },
      :rbenv => {
        :rubies => ['1.9.3-p327'],
        :global => '1.9.3-p327',
        :gems   => { '1.9.3-p327' => [
            { 'name' => 'bundler' },
            { 'name' => 'rake' },
            { 'name' => 'rack' }
          ]
        }
      }
    }
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
end