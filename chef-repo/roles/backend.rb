# roles/backend.rb

name "backend"
description "Install solr along with tomcat & mysql"
run_list "role[default-be]", "recipe[openjava]", "recipe[tomcat-all]", "recipe[solr::properties_master]", "recipe[solr::nextgen-solr]", "recipe[percona::server]", "recipe[elk::client_be]", "recipe[ldap]"
     default_attributes({
	"company" => "viewlift"
})
     override_attributes({
        "mysql" => { "server_root_password" => "viewlift@1234" }
})
