FROM hashicorp/consul-template:0.19.5-alpine
RUN apk add --no-cache coreutils

# RUN apt-get update
# RUN apt-get install -y curl git-core build-essential apt-transport-https tzdata
#
# RUN curl -O https://dl.google.com/go/go1.11.linux-amd64.tar.gz \
#   && echo b3fcf280ff86558e0559e185b601c9eade0fd24c900b4c63cd14d1d38613e499 go1.11.linux-amd64.tar.gz | sha256sum --status --check - \
#   && tar -xzf go1.11.linux-amd64.tar.gz -C /usr/local
#
# ENV GOROOT /usr/local/go
# ENV GOPATH /
# ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
#
# RUN go get github.com/hashicorp/consul-template
# WORKDIR /src/github.com/hashicorp/consul-template
# RUN git checkout -b v0.19.5 refs/tags/v0.19.5
# RUN make bootstrap
# RUN make dep

RUN mkdir -p /envoy_runtime/v1/envoy
RUN mkdir -p /envoy_runtime/v1/envoy_override

COPY envoy-fault.conf.tpl /
COPY consul-config.json /
COPY write-override-conf.sh /

CMD ["consul-template", "-config=consul-config.json"]
