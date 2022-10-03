#!/bin/bash

#sudo ln -s /home/box/etc/hello.py /etc/gunicorn.d/wsgi
sudo ln -s /home/box/etc/nginx-proxy.conf /etc/nginx/sites-enabled/nginx-proxy.conf
sudo rm /etc/nginx/sites-enabled/default

# gunicorn -c /etc/gunicorn.d/wsgi hello:app -D
