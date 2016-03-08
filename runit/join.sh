#!/usr/bin/env bash
sv start consul || exit 1

if [ -n "$CONSUL_MASTER_ADDR" ]; then
	echo consul join ${CONSUL_MASTER_ADDR}
	consul join ${CONSUL_MASTER_ADDR}
fi

if [ -n "$CONSUL_MASTER_PORT_8400_TCP_ADDR" ]; then
	echo consul join ${CONSUL_MASTER_PORT_8400_TCP_ADDR}
	consul join ${CONSUL_MASTER_PORT_8400_TCP_ADDR}
fi

exec kill -STOP "$$";
