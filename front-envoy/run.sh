exec envoy -c config.json --service-cluster front --service-node front --log-level debug "$@"
