if [ -x /usr/bin/setsid ]; then
  eval `ssh-agent`
  mkdir -p tmp
  echo "$DEPLOY_KEY" > tmp/id_rsa
  echo -e '#!/bin/bash\necho $DEPLOY_PASSPHRASE' > tmp/passphrase.sh
  chmod +x tmp/passphrase.sh
  export SSH_ASKPASS=./tmp/passphrase.sh
  export DISPLAY=:bogus:1
  setsid ssh-add tmp/id_rsa < /dev/null
fi
