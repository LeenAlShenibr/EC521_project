###########################################################################
## Settings
###########################################################################

HOSTNAME := localhost
PORT := 45373

.PHONY: all
all: prereq  nginx.conf cert.crt

clean:
	rm -Rf nginx nginx.conf cert.crt cert.key openssl-1.0.1f  nginx-1.5.12 logs

prereq:
	apt-get update
	apt-get install nginx

cert.crt: cert.key
cert.key:
	cd /usr/local/ssl && \
	rm -Rf '$@' && \
	openssl req -x509 -newkey rsa:2048 -nodes -days 7 -keyout cert.key -out cert.crt -extensions v3_req -subj '/C=US/O=EC521/OU="Have you seen Zebras ? There is no man-in-the-middle"/CN=$(HOSTNAME)' && \
	chmod go-wx '$@' && \
	chmod a+r '$@'  # Server process needs to be able to read this.
	cp /usr/local/ssl/cert.crt /usr/local/ssl/cert.key $(PWD)/


###########################################################################
## NGINX Config
###########################################################################

define THE_CONFIG
daemon off;
pid /dev/null;
error_log stderr crit;

worker_processes 2;
worker_priority 15;
events {
	worker_connections  2048;
}

http {
	default_type  text/html;
	log_not_found off;

	server {
		listen $(PORT) ssl;

		ssl                  on;
		ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
		ssl_ciphers "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384";
		ssl_certificate      cert.crt;
		ssl_certificate_key  cert.key;

		charset utf-8;

		location / {
			root /var/www/html;
			index https_index.html;
		}
	}
}
endef
export THE_CONFIG
nginx.conf:
	echo "$$THE_CONFIG" > $@
