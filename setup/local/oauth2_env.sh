# You MUST replace 3 values below from output of setup_kong_oauth2.sh
export PROVISION_KEY=jBJua7lFamAGWpaBTelfoxShArfDjB9S
export CLIENT_ID=iKQuLcIxKYsJ7aQlWC44YaRd9PNfVnBQ
export CLIENT_SECRET=FSos2kzFXScRIzXdYHO3GiEYpcjUCWxm

# Make sure following 3 resource have been deleted in Kong installation
export API_PATH="/sgclocal"
export SERVICE=sgclocal-service
export CONSUMER=sgclocal-consumer
export SERVICE_HOST=73fe-73-15-195-77.ngrok.io

export KONG_ADMIN="http://127.0.0.1:8001"
export KONG_API="https://127.0.0.1:8443"
export KONG_GW="http://127.0.0.1:8000"
