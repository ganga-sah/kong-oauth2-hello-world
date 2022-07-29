#!/bin/sh
# Make sure you have run:
# npm install

. $HOME/Dev/github/ganga-sah/kong-oauth2-hello-world/setup/local/oauth2_env.sh

export SCOPES="{ \
  \"email\": \"Grant permissions to read your email address\", \
  \"address\": \"Grant permissions to read your address information\", \
  \"phone\": \"Grant permissions to read your mobile phone number\" \
}"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo Open "http://localhost:3000/authorize?response_type=code&client_id=$CLIENT_ID"

node app.js

