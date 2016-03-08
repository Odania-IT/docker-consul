#!/usr/bin/env bash

if [ -z "${ADVERTISE_IP}" ]; then
	ADVERTISE_IP=$(hostname -i)
fi

if [ -z "${DATA_DIR}" ]; then
	DATA_DIR=/tmp/consul
fi

if [ "${BOOTSTRAP_NODE,,}" == "true" ]; then
	exec /usr/local/bin/consul agent -bootstrap -server -data-dir=${DATA_DIR} -client=0.0.0.0 -advertise=$ADVERTISE_IP
else
	if [ -n "${BOOTSTRAP_EXPECT}" ]; then
		exec /usr/local/bin/consul agent -server -data-dir=${DATA_DIR} -client=0.0.0.0 -advertise=$ADVERTISE_IP -bootstrap-expect $BOOTSTRAP_EXPECT
	else
		exec /usr/local/bin/consul agent -server -data-dir=${DATA_DIR} -client=0.0.0.0 -advertise=$ADVERTISE_IP
	fi
fi
