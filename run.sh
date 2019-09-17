#!/bin/bash -l
passwd=$1
if [ -z "$passwd"];
then
echo "need password"
echo "bash run.sh {your password}"
exit
fi
echo "password: ${passwd}"
if apt-cache pkgnames | grep -q shadowsocks
then
echo "shadowsocks has been installed"
else
yes|sudo apt-get install shadowsocks
fi
sudo bash -c "echo \"127.0.0.1 `hostname`\" >> /etc/hosts"
sudo bash -c "echo \
'{
    \"server\": \"0.0.0.0\",
    \"server_port\": 80,
    \"password\": \"${passwd}\",
    \"timeout\": 360,
    \"method\": \"aes-256-cfb\",
    \"fast_open\": true,
    \"workers\": 2
}' > /etc/shadowsocks/config.json
"
killall ssserver
nohup ssserver -c /etc/shadowsocks/config.json & 2>&1 > /dev/null
