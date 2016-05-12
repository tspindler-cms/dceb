#!/bin/bash

source ./cfg.sh

# not elegant, just create Toaster and ignore errors if it exists
curl -s -H "Content-Type: application/json" -u "${user}" -XPOST ${url}api/public/v1.0/groups?pretty=true --digest -d '
{ "name": "Toaster" }
'
echo

groupid=$(curl -s -u "${user}" "${url}api/public/v1.0/groups"?pretty=true --digest | grep '"name" : "Toaster"' -b6 | grep id | cut -c17-40)
echo "Discovered Toaster group with id ${groupid}"


