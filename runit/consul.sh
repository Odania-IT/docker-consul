#!/usr/bin/env bash

if [ -z "${ADVERTISE_IP}" ]; then
	ADVERTISE_IP=$(hostname -i)
fi

if [ "${BOOTSTRAP_NODE,,}" == "true" ]; then
	exec /usr/local/bin/consul agent -bootstrap -server -data-dir=/tmp/consul -client=0.0.0.0 -advertise=$ADVERTISE_IP
else
	if [ "${BOOTSTRAP_EXPECT,,}" == "true" ]; then
		exec /usr/local/bin/consul agent -server -data-dir=/tmp/consul -client=0.0.0.0 -advertise=$ADVERTISE_IP -bootstrap-expect $BOOTSTRAP_EXPECT
	else
		exec /usr/local/bin/consul agent -server -data-dir=/tmp/consul -client=0.0.0.0 -advertise=$ADVERTISE_IP
	fi
fi
