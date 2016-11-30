HOSTNAME := localhost
.PHONY: all
all: prereq cert.crt

clean:
	rm -Rf cert.crt cert.key openssl-1.0.1f  nginx-1.5.12

prereq:
	apt-get update
	apt-get install nginx

cert.crt: cert.key
cert.key:
	openssl req -x509 -newkey rsa:2048 -nodes -days 7 -keyout cert.key -out cert.crt -extensions v3_req -subj '/C=US/O=EC521/OU=Heartbleed/CN=$(HOSTNAME)'
	chmod go-wx '$@'
	chmod a+r '$@'  # Server process needs to be able to read this.
