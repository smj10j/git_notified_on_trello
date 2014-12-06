#!/bin/bash

echo -n "Press any key to open Trello. Log in if prompted, copy your developer API key, and return to this window."
read -e < /dev/tty
open https://trello.com/1/appKey/generate

echo -n "Paste your developer key: "
read -e developer_key < /dev/tty

echo -n "Friendly app name: "
read -e app_name < /dev/tty

echo -n "Scope (default: read,write,account): "
read -e scope < /dev/tty

echo -n "Expiration (default: never): "
read -e expiration < /dev/tty

url="https://trello.com/1/authorize?\
key=${developer_key}&\
name=$(echo $app_name | perl -lpe 's/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg')&\
response_type=token&\
scope=${scope:=read,write,account}&\
expiration=${expiration:=never}"
echo ""
echo "URL to direct users to when asking for authorization: $url"
echo ""
echo -n "Press any key to open the URL in your browser."
read -e < /dev/tty
open "$url"

echo ""
echo "Goodbye!"
echo ""
