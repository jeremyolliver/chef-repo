#
# Cookbook Name:: ruby_web_deployment
# Recipe:: default
#
# Copyright 2012, Jeremy Olliver
#
# All rights reserved - Do Not Redistribute
#

user "deploy" do
  shell "/bin/bash"
  group "deploy"
  supports :manage_home => true
end

include_recipe("rbenv::default")
include_recipe("rbenv::ruby_build")
include_recipe("rbenv::ohai_plugin")

# Install the selected version of ruby
rbenv_ruby(node[:ruby_web_deployment][:ruby][:version])

# We assume you'll be using bundler to install your own gems
rbenv_gem "bundler" do
  version      node[:ruby_web_deployment][:bundler][:version]
  ruby_version node[:ruby_web_deployment][:ruby][:version]
end
