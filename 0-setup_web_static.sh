#!/usr/bin/env bash
# Bash script to setup a web server for the deployement of web_static.

sudo apt-get update -y
sudo apt-get install -y nginx
sudo service nginx start
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/ 
sudo echo "This is my sample page" > /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test /data/web_static/current 
sudo chown ubuntu:ubuntu -R /data/
regex="^\tlocation+"
location="\n\n\tlocation \/hbnb_static\/ \{\
\n\t\talias \/data\/web_static\/current\/\;\
\n\t\tautoindex off\;\
\n\t\}"
sudo sed -i -r "s/$regex/$location\n\n\0/g" /etc/nginx/sites-enabled/default
sudo service nginx restart
