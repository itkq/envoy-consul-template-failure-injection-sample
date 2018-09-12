FROM envoyproxy/envoy:3122ee8361a3c339c906554f1bb56f68a8e692a9

RUN apt-get update
RUN apt-get install -y curl

COPY config.json /
COPY run.sh /

RUN mkdir -p /srv/runtime/current/envoy
RUN mkdir -p /srv/runtime/current/envoy_override

CMD ["/bin/bash", "run.sh"]
