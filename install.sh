#!/bin/sh


#sudo ln -s /home/box/etc/hello.py /etc/gunicorn.d/wsgi
rm /etc/nginx/sites-enabled/nginx-proxy.conf
sudo cp /home/box/web/etc/nginx-proxy.conf  /etc/nginx/sites-enabled/nginx-proxy.conf
sudo rm /etc/nginx/sites-enabled/default

# gunicorn -c /etc/gunicorn.d/wsgi hello:app -D
