#!/bin/sh
CONFIG_PATH=/data/options.json

secret=$(jq --raw-output ".client_secret" $CONFIG_PATH)
id=$(jq --raw-output ".client_id" $CONFIG_PATH)
cookie_secret=$(jq --raw-output ".cookie_secret" $CONFIG_PATH)
cert=$(jq --raw-output ".certfile" $CONFIG_PATH)
key=$(jq --raw-output ".keyfile" $CONFIG_PATH)
domain=$(jq --raw-output ".domain" $CONFIG_PATH)
email=$(jq --raw-output ".letsencryptAdminEmail" $CONFIG_PATH)
jq --raw-output ".allowed_emails | .[]" $CONFIG_PATH > /data/emails

/root/go/bin/oauth2_proxy -version

/root/go/bin/redirect-https &

/root/go/bin/oauth2_proxy --client-id $id \
                --https-address ":443" \
                --client-secret $secret \
                --upstream http://172.17.0.1:8123 \
                --cookie-secret $cookie_secret \
                --cookie-refresh "1h" \
                --skip-provider-button \
                --authenticated-emails-file /data/emails \
                --letsencrypt-enabled=true \
                --letsencrypt-address=":80"
                --letsencrypt-host $domain \
                --letsencrypt-admin-email $email
