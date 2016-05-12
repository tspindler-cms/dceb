#!/bin/bash
source ./cfg.sh
curl -u "${user}" "${url}api/public/v1.0/groups"?pretty=true --digest -i
