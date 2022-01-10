#!/usr/bin/env bash

docker run -it --rm --privileged -v /lib/modules:/lib/modules:ro -v /etc/localtime:/etc/localtime:ro --pid=host -v $PWD:/app ebpf
