#!/usr/bin/env bash
if [ "${BOOTSTRAP_NODE,,}" == "true" ]; then
	exec /usr/local/bin/consul agent -bootstrap -server -data-dir=/tmp/consul -client=0.0.0.0
else
	if [ "${BOOTSTRAP_EXPECT,,}" == "true" ]; then
		exec /usr/local/bin/consul agent -server -data-dir=/tmp/consul -client=0.0.0.0 -bootstrap-expect $BOOTSTRAP_EXPECT
	else
		exec /usr/local/bin/consul agent -server -data-dir=/tmp/consul -client=0.0.0.0 -bootstrap-expect 1
	fi
fi
