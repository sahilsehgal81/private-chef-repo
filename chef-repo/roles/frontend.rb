# roles/frontend.rb

name "frontend"
description "Install and configure apache server along with tomcat application"
run_list "role[default]", "recipe[openjava]", "recipe[tomcat-all]", "recipe[tomcat-all::nextgen-tomcat]", "recipe[mysql_connector]", "recipe[Deploy_WAR]", "recipe[apache2]", "recipe[apache2::nextgen-web]", "recipe[dims]", "recipe[elk::client]", "recipe[ldap]"
#run_list "role[default]", "recipe[openjava]",  "recipe[apache2]", "recipe[apache2::nextgen-web]", "recipe[dims]", "recipe[elk::client]"
     default_attributes({
	"company" => "viewlift"
})
