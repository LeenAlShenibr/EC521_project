#!/bin/bash

#Place the script in /usr/local/sbin
#Following script manipulates the IPtables to set rules that lets you
#interact with the webserver (http and https) with or without mitmproxy

#To interact with webserver without mitm, run setupmitm.sh -d
#To route all packets to http or https server via mitm, run setupmitm.sh -i
#To query the state of iptables, run setupmitm.sh -q 

usage="$(basename "$0") [-h] [-on] [-off] -- Program activate/deactivate the setup for man-in-the-middle attack
	using mitmproxy.

where: 
     -h 	Show this help text
     -i		lets mitmproxy to intercept http/https communication
     -d		Deactivates mitmproxy
     -q		Queries the iptables to show the active rules. 

Example:
	setupmitm.sh -i # will route all packets to http or https server via mitmproxy
	setupmitm.sh -d # will stop routing packets via mitmproxy
	setupmitm.sh -q # will let you query the iptable rules currently set. 
"

while getopts ':hidq' option; do
  case "$option" in 
    h) 	echo "$usage"
	exit
	;;
    i)	echo "man-in-the-middle attack intiated"
	echo "To intercept http, https connections start mitmproxy by running... "
	echo "mitmproxy -T --host" 
	/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 45373 -j REDIRECT --to-port 8080
	/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT --to-port 8080

	exit
	;;
    d)  echo "man in the middle attack stopped"
	/sbin/iptables -t nat -F
	exit
	;;
    q) 	echo "querying the iptables"
	/sbin/iptables -t nat -L
	exit
	;;
    \?) printf "illegal option: ~%s\n" "$OPTARG" >&2
	echo "$usage" >&2
	exit 1
	;;
  esac
done


