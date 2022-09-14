#!/bin/bash

sudo cp node_exporter.service /etc/systemd/system/node_exporter.service

cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar -xvzf node_exporter-1.3.1.linux-amd64.tar.gz
sudo mkdir -p /usr/local/bin
sudo mv node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin

sudo useradd -s /sbin/nologin node_exporter
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
sudo systemctl status node_exporter
