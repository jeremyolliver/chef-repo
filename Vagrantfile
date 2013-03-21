# -*- mode: ruby -*-
# vi: set ft=ruby :

# Chef / Vagrant testing setup courtesy of http://jtimberman.housepub.org/blog/2012/03/18/multivm-vagrantfile-for-chef/

# require 'rubygems'
# require 'bundler'
# Bundler.setup
# require 'chef'
# require 'chef/config'
# require 'chef/knife'
current_dir = File.dirname(__FILE__)
# Chef::Config.from_file(File.join(current_dir, '.chef', 'knife.rb'))

# Get new images from http://www.vagrantbox.es/ or https://github.com/opscode/bento
cookbook_testers = {
  :lucid => {
    :box => "opscode-ubuntu-10.04",
    :box_url => "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-10.04.box",
    :hostname => "lucid-cookbook-test",
    :ipaddress => "192.168.33.10",
    :port_forwards => [[80, 8080]],
    :chef_environment => "test",
    :run_list => ""
  },
  :precise => {
    :box => "opscode-ubuntu-12.04",
    :box_url => "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-10.18.2.box",
    :hostname => "precise-cookbook-test",
    :ipaddress => "192.168.33.11",
    :port_forwards => [[9200, 9201]],
    :chef_environment => "test",
    :run_list => ""
  },
  :centos6 => {
    :box => "opscode-centos-6.3",
    :box_url => "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-centos-6.3.box",
    :hostname => "centos6-cookbook-test",
    :ipaddress => "192.168.33.12",
    :port_forwards => [[9200, 9201]],
    :chef_environment => "test",
    :run_list => ""
  },
  :chef_11_server => {
    :box => "opscode-ubuntu-12.04",
    :box_url => "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box",
    :hostname => "chef11-local-repo",
    :ipaddress => "192.168.33.100",
    :port_forwards => [],
    :chef_environment => "chef_server",
    :run_list => ""
  },
  :logstash => {
    :box => "opscode-ubuntu-12.04",
    :box_url => "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-10.18.2.box",
    :hostname => "precise-cookbook-test",
    :ipaddress => "192.168.33.101",
    :port_forwards => [[9200, 9201]],
    :chef_environment => "test",
    :run_list => ""
  }
}


Vagrant::Config.run do |global_config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  cookbook_testers.each_pair do |name, options|
    global_config.vm.define name do |config|
      vm_name = "#{name}-cookbook-test"
      ipaddress = options[:ipaddress]
      config.vm.share_folder("v-root", "/vagrant", ".", :disabled => true)
      config.vm.box = options[:box] || name.to_s
      config.vm.box_url = options[:box_url] if options[:box_url]
      config.vm.boot_mode = :headless
      config.vm.host_name = vm_name
      config.vm.network :hostonly, ipaddress
      if options[:port_forwards]
        options[:port_forwards].each do |vm_port, local_port|
          config.vm.forward_port vm_port, local_port
        end
      end
      config.vm.provision :chef_client do |chef|
        # chef.bootstrap_version = "10.16.6"
        chef.chef_server_url = "http://cchef11-local-repo:4000" # Chef::Config[:chef_server_url]
        chef.validation_key_path = "./.chef/validation.pem" # "#{current_dir}/.chef/#{Chef::Config[:validation_client_name]}.pem"
        chef.validation_client_name = "chef-validator" # Chef::Config[:validation_client_name]
        chef.node_name = vm_name
        chef.environment = options[:chef_environment]
        chef.provisioning_path = "/etc/chef"
        chef.log_level = :info
        run_list = []
        run_list << ENV['CHEF_RUN_LIST'].split(",") if ENV.has_key?('CHEF_RUN_LIST')
        chef.run_list = [options[:run_list].split(","), run_list].flatten
      end
    end
  end

end
