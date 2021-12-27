#!/bin/bash
#   deploy
apt-get --assume-yes install git
cd /opt
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
#   make SystemUnit
echo "[Unit]
Description=Puma Service
After=network.target
[Service]
Type=idle
ExecStart=/usr/local/bin/puma --dir /opt/reddit
[Install]
WantedBy=multi-user.target" >> /lib/systemd/system/puma.service
chmod +x /lib/systemd/system/puma.service
systemctl daemon-reload
#   Start Service Puma
systemctl enable puma.service
systemctl start puma.service