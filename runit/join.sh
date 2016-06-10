#!/usr/bin/env bash
sv start consul || exit 1

JOINED=false
if [ -n "$CONSUL_MASTER_ADDR" ]; then
	JOINED=true
	echo consul join ${CONSUL_MASTER_ADDR}
	consul join ${CONSUL_MASTER_ADDR}
fi

if [ -n "$CONSUL_MASTER_PORT_8400_TCP_ADDR" ]; then
	JOINED=true
	echo consul join ${CONSUL_MASTER_PORT_8400_TCP_ADDR}
	consul join ${CONSUL_MASTER_PORT_8400_TCP_ADDR}
fi

if [ "false" == "${JOINED}" ]; then
	ping consulmaster -c 10
	if [ $? == 0 ]; then
		echo consul join consulmaster
		consul join consulmaster
	fi
fi

exec kill -STOP "$$";
