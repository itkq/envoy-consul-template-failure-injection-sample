# envoy-consul-template-failure-injection-sample

A sample of fault injection testing by using Envoy runtime configuration and consul-template.

## How to run
```
# shell 1
$ export APP_ID=front
$ docker-compose up --build -d
$ while :; do curl -sSfi localhost:3000/backend; sleep 1; done
```

```
# shell 2
$ export APP_ID=front
$ consul kv put "$APP_ID/fault/http/delay/fixed_duration_ms" 5000 
$ consul kv put "$APP_ID/fault/http/delay/fixed_delay_percent" 50

# Then 50% requests will be injected additional 5000ms duration.
```
