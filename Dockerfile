# Squid server based on openSUSE Leap 15.4
FROM ghcr.io/fab-infra/base-image:opensuse15.4

# Redis
RUN zypper in -y squid &&\
	zypper clean -a

# Files
COPY ./root /
RUN mkdir -p /var/run/squid/ &&\
	chmod -R a+rwX /var/cache/squid /var/log/squid /var/run/squid

# Ports
EXPOSE 3128

# Execution
USER squid
