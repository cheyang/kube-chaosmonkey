#!/bin/bash

docker run -d \
 -e KUBERNETES_MASTER=http://127.0.0.1:8080 \
 -e KUBERNETES_NAMESPACE=default \
 -e CHAOS_MONKEY_INCLUDES=zk* \
 -e CHAOS_MONKEY_EXCLUDES=zk2* \
 -e CHAOS_MONKEY_KILL_FREQUENCY_SECONDS=60 \
 fabric8/chaos-monkey:2.2.110
