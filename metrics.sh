#!/bin/bash

dir="/metrics"
mkdir -p $dir
curl -s http://node-exporter-svc.default.svc.cluster.local:9100/metrics > $dir/node_metrics-$(date +%Y%m%d-%H%M%S).txt
