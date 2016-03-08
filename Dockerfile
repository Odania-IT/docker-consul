FROM odaniait/docker-base:latest
MAINTAINER Mike Petersen <mike@odania-it.de>

ENV CONSUL_VERSION 0.6.3

WORKDIR /tmp

RUN mkdir -p /var/lib/consul
RUN mkdir -p /usr/share/consul
RUN mkdir -p /etc/consul/conf.d

RUN curl -OL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip
RUN mv consul /usr/local/bin/consul

RUN mkdir -p /usr/share/consul/ui
WORKDIR /usr/share/consul/ui
RUN curl -OL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip
RUN unzip consul_${CONSUL_VERSION}_web_ui.zip

# setup consul service
RUN mkdir -p /etc/service/consul
COPY runit/consul.sh /etc/service/consul/run

EXPOSE 8400 8500 8600/udp
