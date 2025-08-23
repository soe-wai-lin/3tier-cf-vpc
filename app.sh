#!/bin/bash
sudo dnf update -y

sudo dnf install -y mariadb105-server

sudo systemctl enable mariadb

sudo systemctl start mariadb