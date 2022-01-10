#!/usr/bin/env bash

mount -t debugfs debugfs /sys/kernel/debug

if [ "$#" -lt 1 ]; then
	exec bash
else
	exec "$@"
fi
