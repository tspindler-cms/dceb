#!/usr/bin/env python2.7

## Written by Torsten Spindler

from pprint import pprint
import requests
from requests.auth import HTTPDigestAuth
import json
import sys
import argparse


### command line

parser = argparse.ArgumentParser(description='Change database version via MongoDB Ops Manager.')
parser.add_argument('groupname', help='The Ops Manager group name to update', default='Demo')
parser.add_argument('newversion', help='The new version of MongoDB to be used', default='3.2.6')
parser.add_argument('-u', '--user', help='Ops Manager user', default='Admin@localhost.com')
parser.add_argument('--key', help='Ops Manager key for user', default='52b84900-81f5-4511-8f73-8716a4624842')
parser.add_argument('--baseurl', help='Ops Manager endpoint', default='http://opsmgr.vagrant.dev:8080/')

args = parser.parse_args()

groupname = args.groupname
newversion = args.newversion

### REST request parameters

# First test settings
# user = 'Admin@localhost.com'
# passwd = '52b84900-81f5-4511-8f73-8716a4624842'
# baseurl = 'http://opsmgr.vagrant.dev:8080/'

user = args.user
passwd = args.key
baseurl = args.baseurl


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
  # pprint(process_json['version'])
  print("Setting version to " + newversion)
  process_json['version'] = newversion

# pprint(automationConfig_json)
headers = {'content-type': 'application/json'}
response = requests.put(url, data = json.dumps(automationConfig_json), auth=HTTPDigestAuth(user, passwd), headers=headers)

# pprint(response.text)

print("Deploying new version, check Ops Manager for activity")
