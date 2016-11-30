
all: sslstrip setup

sslstrip:
	wget https://moxie.org/software/sslstrip/sslstrip-0.9.tar.gz
	tar xzf sslstrip-0.9.tar.gz
	cd sslstrip-0.9 && \
	python ./setup.py install

setup:
	echo "1" > /proc/sys/net/ipv4/ip_forward
	iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
