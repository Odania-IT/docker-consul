#!/usr/bin/env bash

if [ "${BOOTSTRAP_NODE}" == "true" ]; then
	/usr/local/sbin/consul agent -bootstrap -server -data-dir=/tmp/consul -client=0.0.0.0
else
	/usr/local/sbin/consul agent -server -data-dir=/tmp/consul -client=0.0.0.0
fi
