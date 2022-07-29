#!/bin/sh
. ./oauth2_env.sh

set -x
curl -X POST \
  --url "$KONG_API/$API_PATH/oauth2/token" \
  --header "Host: ${SERVICE_HOST}" \
  --data "grant_type=authorization_code" \
  --data "client_id=$CLIENT_ID" \
  --data "client_secret=$CLIENT_SECRET" \
  --data "redirect_uri=http://konghq.com/" \
  --data "code=$1" \
  --insecure
