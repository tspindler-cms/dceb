curl -u "Admin@localhost.com:52b84900-81f5-4511-8f73-8716a4624842" -H "Content-Type: application/json" "http://opsmgr.vagrant.dev:8080/api/public/v1.0/groups/573328154562a00879ba0829/automationConfig" --digest -i -X PUT --data '
{
  "auth" : {
    "disabled" : true,
    "usersDeleted" : [ ],
    "usersWanted" : [ ]
  },
  "backupVersions" : [ ],
  "indexConfigs" : [ ],
  "mongoDbVersions" : [ {
    "builds" : [ {
      "bits" : 64,
      "gitVersion" : "20d60d3491908f1ae252fe452300de3978a040c7",
      "platform" : "linux",
      "url" : "http://opsmgr.vagrant.dev:8080/automation/mongodb-releases/linux/mongodb-linux-x86_64-3.0.9.tgz"
    } ],
    "name" : "3.0.9"
  }, {
    "builds" : [ {
      "bits" : 64,
      "gitVersion" : "b326ba837cf6f49d65c2f85e1b70f6f31ece7937",
      "platform" : "linux",
      "url" : "http://opsmgr.vagrant.dev:8080/automation/mongodb-releases/linux/mongodb-linux-x86_64-3.2.3.tgz"
    } ],
    "name" : "3.2.3"
  }, {
    "builds" : [ {
      "bits" : 64,
      "gitVersion" : "05552b562c7a0b3143a729aaa0838e558dc49b25",
      "platform" : "linux",
      "url" : "http://opsmgr.vagrant.dev:8080/automation/mongodb-releases/linux/mongodb-linux-x86_64-3.2.6.tgz"
    } ],
    "name" : "3.2.6"
  } ],
  "monitoringVersions" : [ {
    "baseUrl" : null,
    "directoryUrl" : null,
    "hostname" : "node1.vagrant.dev",
    "name" : "3.9.1.238-1"
  } ],
  "options" : {
    "downloadBase" : "/var/lib/mongodb-mms-automation",
    "downloadBaseWindows" : "%SystemDrive%\\MMSAutomation\\versions"
  },
  "processes" : [ {
    "args2_6" : {
      "net" : {
        "port" : 27000
      },
      "operationProfiling" : {
        "mode" : "slowOp",
        "slowOpThresholdMs" : 10
      },
      "replication" : {
        "replSetName" : "replicaSet"
      },
      "storage" : {
        "dbPath" : "/data/replicaset/replicaSet_0"
      },
      "systemLog" : {
        "destination" : "file",
        "path" : "/data/replicaset/replicaSet_0/mongodb.log"
      }
    },
    "authSchemaVersion" : 5,
    "hostname" : "node1.vagrant.dev",
    "logRotate" : {
      "sizeThresholdMB" : 1000.0,
      "timeThresholdHrs" : 24
    },
    "name" : "replicaSet_0",
    "processType" : "mongod",
    "version" : "3.0.9"
  }, {
    "args2_6" : {
      "net" : {
        "port" : 27000
      },
      "operationProfiling" : {
        "mode" : "slowOp",
        "slowOpThresholdMs" : 10
      },
      "replication" : {
        "replSetName" : "replicaSet"
      },
      "storage" : {
        "dbPath" : "/data/replicaset/replicaSet_1"
      },
      "systemLog" : {
        "destination" : "file",
        "path" : "/data/replicaset/replicaSet_1/mongodb.log"
      }
    },
    "authSchemaVersion" : 5,
    "hostname" : "node2.vagrant.dev",
    "logRotate" : {
      "sizeThresholdMB" : 1000.0,
      "timeThresholdHrs" : 24
    },
    "name" : "replicaSet_1",
    "processType" : "mongod",
    "version" : "3.0.9"
  } ],
  "replicaSets" : [ {
    "_id" : "replicaSet",
    "members" : [ {
      "_id" : 0,
      "arbiterOnly" : false,
      "hidden" : false,
      "host" : "replicaSet_0",
      "priority" : 1.0,
      "slaveDelay" : 0,
      "votes" : 1
    }, {
      "_id" : 1,
      "arbiterOnly" : false,
      "hidden" : false,
      "host" : "replicaSet_1",
      "priority" : 1.0,
      "slaveDelay" : 0,
      "votes" : 1
    } ]
  } ],
  "roles" : [ ],
  "sharding" : [ ],
  "uiBaseUrl" : null,
  "version" : 7
}
'
