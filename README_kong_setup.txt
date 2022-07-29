# Setup OAuth2 in Kong API Gateway to SGC by $HOME/Dev/github/ganga-sah/kong-oauth2-hello-world/setup/local/setup_kong_oauth2.sh

# Open http://localhost:3000/authorize?response_type=code&client_id=CLIENT_ID_VALUE in browser

# Create kong access-token from code above
cd $HOME/Dev/github/ganga-sah/kong-oauth2-hello-world/setup/local
./get_kong_token.sh [code from browser link above -> Click Authorize -> value after code= in redirexted url]

# Verify that REST API via Kong Gateway works with SGC
./get_sgc_user.sh [token value from get_kong_token.sh above]
