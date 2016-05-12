#!/bin/bash
source ./cfg.sh

curl -u "${user}" "${url}api/public/v1.0/groups/573328154562a00879ba0829/automationStatus"?pretty=true --digest -i

