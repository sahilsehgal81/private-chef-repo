#!/bin/bash

JENKINS_BUILD=1563
#JENKINS_NEW_BUILD=1564

bootstrap() {
  cd /root/chef-repo/
  knife bootstrap $NODEIP -i /root/chef-repo/.chef/SNAGFILMSNEWPRODKEY.pem -x ubuntu -N $NODENAME --run-list 'role[frontend]' --sudo -E production
}

# Frontend Node Name format should be : e.g. => FENode-Prod-i-44fa7ad4

NODEIP=`for i in $(knife node list | grep FE); do knife node show $i | grep IP: | awk '{print $2}'; done > /root/listip`
NODENAME=`for n in $(knife node list | grep FE); do knife node show $n | grep 'Node Name:' | awk '{print $3}'; done > /root/listnode`

CURRENT_BUILD=`cat /root/chef-repo/cookbooks/Deploy_WAR/attributes/default.rb | grep BUILD | awk '{print $3}'`

echo "Currently the build to be deployed is $CURRENT_BUILD\n"

echo "In case you want to change the Build to be deployed on servers, please modify the file '/root/chef-repo/cookbooks/Deploy_WAR/attributes/default.rb'\n"

echo "After modifying file, please ensure to upload cookbook on Chef Server using following command\n"

echo "# knife cookbook upload Deploy_WAR"
echo "(Note: make sure you are under '/root/chef-repo/' dir before executing above command, where 'Deploy_WAR'is the cookbook for deploying WAR file)\n"



read -p "Current Build : $CURRENT_BUILD . Please hit [Enter] if you want to proceed with the Deployment on Frontend Servers " build_number
  echo "Thanks for confirmation. Deployment script is proceeding now."

while true
do
  read -r f1 <&3 || break
  read -r f2 <&4 || break
  # Execution of Bootstrap on all Frint End Nodes
  #knife bootstrap $f1 -x chef -P chef@1234 -N $f2 --run-list 'role[frontend]' --sudo -E production
  knife bootstrap $f1 --ssh-user chef --ssh-password 'chef@1234' --sudo --use-sudo-password -N $f2 --run-list 'role[frontend]' -E production
 done 3</root/listip 4</root/listnode
