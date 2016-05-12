#!/usr/bin/env python2.7

## Written by Torsten Spindler

from pprint import pprint
import requests
from requests.auth import HTTPDigestAuth
import json
import sys


### command line

groupname = sys.argv[1]
newversion = sys.argv[2]

### REST request parameters

user = 'Admin@localhost.com'
passwd = '52b84900-81f5-4511-8f73-8716a4624842'
baseurl = 'http://opsmgr.vagrant.dev:8080/'

### Get the groups
url = baseurl + 'api/public/v1.0/groups'

response = requests.get(url, auth=HTTPDigestAuth(user, passwd))

# pprint(response.json())

json_groups = json.loads(response.text)

grps = {}
for json_group in json_groups['results']:
  grps[json_group['name']] = json_group['id']

pprint(grps.get(groupname, 0))

group_id = grps.get(groupname, 0)

if group_id == 0:
  print("No such group")
  exit(1)

### Get the config for the group
print("Found group, continuing with getting automation config")

url = baseurl + 'api/public/v1.0/groups/' + group_id + '/automationConfig'

response = requests.get(url, auth=HTTPDigestAuth(user, passwd))

# pprint(response.json())

### Set the config for the group

automationConfig_json = json.loads(response.text)
for process_json in automationConfig_json['processes']:
  pprint(process_json['version'])
  pprint("Setting version to " + newversion)
  process_json['version'] = newversion

# pprint(automationConfig_json)
headers = {'content-type': 'application/json'}
response = requests.put(url, data = json.dumps(automationConfig_json), auth=HTTPDigestAuth(user, passwd), headers=headers)

pprint(response.text)

pprint("Hopefully deployed new version")
