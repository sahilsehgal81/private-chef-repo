#!/usr/local/bin/expect --
set timeout -1
spawn /bin/su - chef
expect "Password: "
send "chef@1234\r"
expect "\r\n"
send "/bin/echo Hello>>/tmp/readfil\n"
