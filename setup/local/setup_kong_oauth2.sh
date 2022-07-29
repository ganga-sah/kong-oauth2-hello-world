#!/bin/sh
# Make sure Kong Gateway is installed and running
# Set values for SERVICE, API_PATH, CONSUMER, SERVICE_HOST in oauth2_env.sh

. ./oauth2_env.sh

set -x

curl -X POST "$KONG_ADMIN/services" --data "name=$SERVICE" --data "url=https://${SERVICE_HOST}" | jq

curl -X POST "$KONG_ADMIN/services/$SERVICE/routes" --data "hosts[]=${SERVICE_HOST}" --data "paths[]=$API_PATH"  | jq

# This should work as endpoint is not protected yet
curl -X GET "${KONG_GW}$API_PATH" --header "Host: ${SERVICE_HOST}"  | jq

curl -X POST  $KONG_ADMIN/services/$SERVICE/plugins/ --data "name=oauth2" --data "config.scopes=email, phone, address" --data "config.mandatory_scope=true" --data "config.enable_authorization_code=true"  | jq

# This should fail as endpoint is now protected
curl -X GET "${KONG_GW}$API_PATH" --header "Host: ${SERVICE_HOST}"  | jq

curl -X POST "$KONG_ADMIN/consumers/" --data "username=${CONSUMER}"  | jq

curl -X POST "$KONG_ADMIN/consumers/${CONSUMER}/oauth2/" --data "name=${SERVICE} App" --data "redirect_uris[]=http://konghq.com/"  | jq
