#!/bin/bash
source ./cfg.sh

curl -u "${user}" "${url}api/public/v1.0/groups/${samplegroup}/automationConfig"?pretty=true --digest -i
