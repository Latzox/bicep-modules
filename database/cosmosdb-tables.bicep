param resName string
param location string = resourceGroup().location

resource cosmosdbaccount 'Microsoft.DocumentDB/databaseAccounts@2023-11-15' = {
  name: 'cda-${resName}'
  location: location
  kind: 'GlobalDocumentDB'
  properties: {
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    databaseAccountOfferType: 'Standard'
    capabilities: [
      {
        name: 'EnableTable'
      }
      {
        name: 'EnableServerless'
      }
    ]
    
    locations: [
      {
        locationName: 'Switzerland North'
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
  }
}

resource tabledb 'Microsoft.DocumentDB/databaseAccounts/tables@2016-03-31' = {
  parent: cosmosdbaccount
  name: 'visitorCounts'
  properties: {
    resource: {
      id: 'visitorCounts'
    }
  }
}

output cosmosdbbconnectionstring string = cosmosdbaccount.listConnectionStrings().connectionStrings[0].connectionString
