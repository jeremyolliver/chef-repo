default[:ruby_web_deployment][:ruby][:version]       = '1.9.3-p125'
default[:ruby_web_deployment][:bundler][:version]    = '1.2.1'

default[:ruby_web_deployment][:passenger][:version]  = '3.0.17'

override[:rbenv][:group_users]                       = ['deploy']
