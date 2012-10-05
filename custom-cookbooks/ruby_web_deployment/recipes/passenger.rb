#
# Cookbook Name:: ruby_web_deployment
# Recipe:: default
#
# Copyright 2012, Jeremy Olliver
#
# All rights reserved - Do Not Redistribute
#

rbenv_gem "passenger" do
  version      node[:ruby_web_deployment][:passenger][:version]
  ruby_version node[:ruby_web_deployment][:ruby][:version]
end

include_recipe("apache2")

# TODO: run passenger install binary and include it's config in apache
