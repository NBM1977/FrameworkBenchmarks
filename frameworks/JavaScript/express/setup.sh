#!/bin/bash
sed -i 's|mongodb://.*/hello_world|mongodb://'"${DBHOST}"'/hello_world|g' app.js
sed -i 's|localhost|'"${DBHOST}"'|g' app.js

export NODE_ENV=production
export NVM_HOME=${IROOT}/nvm
# Used to avoid nvm's return 2 error.
# Sourcing this functions if 0 is returned.
source $NVM_HOME/nvm.sh || 0
nvm install 0.10.8
nvm use 0.10.8

# run app
npm install
node app &
