#!/bin/bash
NODEIP=`for i in $(knife node list | grep FE); do knife node show $i | grep IP: | awk '{print $2}'; done > /root/listip`
for i in $(cat /root/listip); do
sshpass -p 'chef@1234' ssh -o StrictHostKeyChecking=no chef@$i 'echo IP_ADDRESS: $(hostname -I) $(cat /opt/tomcat/webapps/ROOT/META-INF/MANIFEST.MF | grep BUILD_NUMBER)'
#sshpass -p 'chef@1234' ssh -o StrictHostKeyChecking=no chef@$i 'sudo iptables -I INPUT 1 -i lo -j ACCEPT'
done
