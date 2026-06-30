export NVM_DIR="$HOME/.nvm"

nvm()  { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; nvm "$@"; }
node() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; node "$@"; }
npm()  { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npm "$@"; }
npx()  { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npx "$@"; }
