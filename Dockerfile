FROM odaniait/docker-base:latest
MAINTAINER Mike Petersen <mike@odania-it.de>

RUN mkdir -p /var/lib/consul
RUN mkdir -p /usr/share/consul
RUN mkdir -p /etc/consul/conf.d

RUN curl -OL https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip
RUN unzip 0.5.2_linux_amd64.zip
RUN mv consul /usr/local/bin/consul

RUN curl -OL https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip
RUN unzip 0.5.2_web_ui.zip
RUN mv dist /usr/share/consul/ui

# setup consul service
RUN mkdir -p /etc/service/consul
COPY runit/consul.sh /etc/service/consul/run

EXPOSE 8400 8500 8600/udp
