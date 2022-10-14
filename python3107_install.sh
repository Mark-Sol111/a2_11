#!/bin/bash

td=/home/box/python
mkdir $td && cd $td
wget https://www.python.org/ftp/python/3.10.7/Python-3.10.7.tgz
tar xzf Python-3.10.7.tgz
cd Python-3.10.7
make distclean
./configure --with-openssl=/home/box/openssl
make -j 4
sudo make altinstall
python3.10 -m ssl
