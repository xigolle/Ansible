apt-get install haproxy
rm /etc/default/haproxy
ln -s/vagrant/haproxy /etc/default/haproxy
mv /etc/haproxy/haproxy.cfg{,.original}
