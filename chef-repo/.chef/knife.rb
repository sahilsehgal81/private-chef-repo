# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sahilsehgal"
client_key               "#{current_dir}/sahilsehgal.pem"
validation_client_name   'nextgen-validator'
validation_key           "#{current_dir}/nextgen-validator.pem"
chef_server_url          "https://ip-10-20-55-105/organizations/nextgen"
#chef_server_url          "https://52.21.8.50/organizations/nextgen"
cookbook_path            ["#{current_dir}/../cookbooks"]


# Key
knife[:aws_access_key_id] = "AKIAI7DKYGYIXQN6O5XQ"
knife[:aws_secret_access_key] = "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"
#knife[:region] = "us-east-1"
#knife[:zone] = "us-east-1c"
knife[:ssh_key_name] = "SNAGFILMSNEWPRODKEY"
knife[:host_key_verify] = "--no-host-key-verify"
knife[:editor]="/usr/bin/vim"

