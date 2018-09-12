#!/bin/sh

set -xe

BASE_DIR="/envoy_runtime/v1"
rm -rf $BASE_DIR
mkdir -p "$BASE_DIR/envoy"
mkdir -p "$BASE_DIR/envoy_override"

cat /envoy-fault.conf | while read key value
do
  if $(echo "$key" | grep -q -E "^$APP_ID") ; then
    fullpath="$BASE_DIR/envoy_override/$key"
    mkdir -p $(dirname $fullpath)
    echo $value > $fullpath
  fi
done

# reload envoy's runtime configuration
cd /envoy_runtime && ln -s /srv/runtime/v1 new && mv -Tf new current
