#!/bin/sh
. ./oauth2_env.sh

set -x

curl -L -X GET \
  --url "${KONG_GW}$API_PATH/safeguard/api/v1/user?access_token=9754cd2f-caf5-4d92-8134-fd443094a6e8" \
  --header "Host: ${SERVICE_HOST}" \
  --header "Authorization: bearer $1"