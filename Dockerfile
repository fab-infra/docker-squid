# Squid server based on openSUSE Leap 15.3
FROM ghcr.io/fab-infra/base-image:opensuse15.3

# Redis
RUN zypper in -y squid &&\
	zypper clean -a

# Files
COPY ./root /
RUN chmod +x /run.sh &&\
	chmod -R a+rwX /var/cache/squid /var/log/squid /var/run

# Ports
EXPOSE 3128

# Execution
USER squid
