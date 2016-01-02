#!/usr/bin/env bash
if [ "${BOOTSTRAP_NODE,,}" == "true" ]; then
	exec /usr/local/bin/consul agent -bootstrap -server -data-dir=/tmp/consul -client=0.0.0.0
else
	exec /usr/local/bin/consul agent -server -data-dir=/tmp/consul -client=0.0.0.0
fi
