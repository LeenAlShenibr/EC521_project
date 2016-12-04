echo "Copy paste commands as needed. You need to be root to run all this commands"
echo "uncomment the commands that need to be run"

echo "git clone the repo"

git clone https://github.com/LeenAlShenibr/EC521_project


echo "enabling ssh access to VM and making it persistent"
#/usr/sbin/update-rc.d -f ssh remove
#/usr/sbin/update-rc.d -f ssh defaults
#/usr/sbin/update-rc.d -f ssh enable 2 3 4 5
#/usr/sbin/service ssh restart


echo "Create a user account "

#useradd -m -d /home/sahil -s /bin/bash sahil

echo "set password for user sahil using passwd command"

echo "setting ip forwarding"

#/sbin/sysctl -w net.ipv4.ip_forward=1 

echo "Alternatively you can set it by uncommenting the above line"
echo " in /etc/sysctl.conf "

echo "Setting iptable rules to redirect all incoming traffic to port 80 and 443 to port 8080 "
echo "mitmproxy bydefault listens to port 8080 "

#/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 45373 -j REDIRECT --to-port 8080
#/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT --to-port 8080

echo "To check if the rules have set correctly"

#/sbin/iptables -t nat --line-numbers -L

echo "Install nginx server if not done already "

/usr/bin/apt-get install nginx

echo "Start nginx server "

/bin/systemctl start nginx
/bin/systemctl status nginx


Assuming you have already git cloned the repo

https://github.com/LeenAlShenibr/EC521_project


echo "place index.html and mitm_index.html at /var/www/html"



