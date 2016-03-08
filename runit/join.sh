#!/usr/bin/env bash
sv start consul || exit 1

if [ -n "$CONSULMASTER_ADDR" ]; then
	echo consul join ${CONSULMASTER_ADDR}
	consul join ${CONSULMASTER_ADDR}
fi

if [ -n "$CONSULMASTER_PORT_8400_TCP_ADDR" ]; then
	echo consul join ${CONSULMASTER_PORT_8400_TCP_ADDR}
	consul join ${CONSULMASTER_PORT_8400_TCP_ADDR}
fi

exec kill -STOP "$$";
