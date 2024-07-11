@description('The name of the project')
param projName string

@description('The name of the table to be created')
param tableName string

@description('The location for the Cosmos DB account')
param location string = resourceGroup().location

resource cosmosdbAccount 'Microsoft.DocumentDB/databaseAccounts@2023-11-15' = {
  name: 'cda-${projName}'
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

resource tableDB 'Microsoft.DocumentDB/databaseAccounts/tables@2016-03-31' = {
  parent: cosmosdbAccount
  name: tableName
  properties: {
    resource: {
      id: tableName
    }
  }
}

output cosmosDbConnectionString string = cosmosdbAccount.listConnectionStrings().connectionStrings[0].connectionString
