current_dir = File.dirname(__FILE__)
repo_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
user = ENV['CHEF_USER'] || ENV['USER']

log_level                :info
log_location             STDOUT
node_name                user
client_key               "#{repo_root}/.chef/#{user}.pem"
validation_client_name   'chef-validator'
validation_key           "#{repo_root}/.chef/validation.pem"
# ssl_verify_mode           :verify_none
chef_server_url          'http://localhost:4000' # Change me
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks", "#{current_dir}/../custom-cookbooks"]

cookbook_copyright       "ORGANISATION NAME"
cookbook_email           "admin@ORGANISATION.com"

bootstrap_version        "10.14.4"

Mixlib::Log::Formatter.show_time = true
