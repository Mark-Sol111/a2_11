cur=`pwd`
td=/home/box/openssl
sudo apt-get -y install make
# libssl-dev libncurses5-dev libsqlite3-dev libreadline-dev libtk8.6 libgdm-dev libdb4o-cil-dev libpcap-dev
mkdir $td && cd $td
wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz --no-check-certificate
wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz.sha256 --no-check-certificate

echo "import subprocess;\
cert=open('/home/box/openssl/openssl-1.1.1g.tar.gz.sha256','r').readline().strip();\
print( cert==subprocess.check_output(['sha256sum','/home/box/openssl/openssl-1.1.1g.tar.gz']).split()[0]);\
" > test.py
python test.py
tar zxf openssl-1.1.1g.tar.gz
cd openssl-1.1.1g
./config --prefix=/home/box/openssl --openssldir=/home/box/openssl no-ssl2
make
make install
echo "export PATH=/home/box/openssl/bin:$PATH\
  export LD_LIBRARY_PATH=/home/box/openssl/lib\
  export LC_ALL='en_US.UTF-8'\
  export LDFLAGS='-L /home/box/openssl/lib -Wl,-rpath,/home/box/openssl/lib'\
" >> ~/.bash_profile
which openssl