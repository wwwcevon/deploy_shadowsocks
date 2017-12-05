#!/bin/bash -l
passwd=$1
echo "password: ${passwd}"
yes|sudo apt-get install shadowsocks
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
sudo service shadowsocks restart
