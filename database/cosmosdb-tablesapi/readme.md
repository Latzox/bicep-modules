# Azure Cosmos DB with Table API Module

This module deploys an Azure Cosmos DB account with Table API enabled and creates a table.

## Parameters

| Name        | Type   | Description                                    | Default                        |
|-------------|--------|------------------------------------------------|--------------------------------|
| `projName`  | string | The name of the project.                       | -                              |
| `tableName` | string | The name of the table to be created.           | -                              |
| `location`  | string | The location for the Cosmos DB account.        | resourceGroup().location       |

## Outputs

| Name                     | Type   | Description                              |
|--------------------------|--------|------------------------------------------|
| `cosmosDbConnectionString` | string | The connection string for the Cosmos DB account. |

## Usage

```
module cosmosDb 'br:latzo.azurecr.io/bicep/modules/database/cosmosdb-tableapi:1.0.0' = {
  name: 'cosmosDb'
  params: {
    projName: 'myProject'
    tableName: 'myTable'
  }
}

output cosmosDbConnectionString string = cosmosDb.outputs.cosmosDbConnectionString
```