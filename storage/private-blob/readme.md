# Azure Storage Account with Blob Container

This module deploys an Azure Storage account with a specified blob container.

## Parameters

| Name                 | Description                                                           | Type   | Allowed Values   | Default Value |
|----------------------|-----------------------------------------------------------------------|--------|------------------|---------------|
| storageAccountName   | Specifies the name of the Azure Storage account.                      | string |                  |               |
| containerName        | Specifies the name of the blob container.                             | string |                  |               |
| storageKind          | Specifies the kind of storage account.                                | string |                  |               |
| accessTier           | The access tier of the storage account.                               | string | Hot, Cool        |               |
| location             | Specifies the location in which the Azure Storage resources should be deployed. | string |                  | resourceGroup().location |

## Outputs

None

## Usage

```
param storageAccountName string = 'mystorageaccount'
param containerName string = 'mycontainer'
param storageKind string = 'StorageV2'
param accessTier string = 'Hot'
param location string = 'switzerlandnorth'

module storage 'br:latzo.azurecr.io/bicep/modules/storage/private-blob:1.0.0' = {
  name: 'storageModule'
  params: {
    storageAccountName: storageAccountName
    containerName: containerName
    storageKind: storageKind
    accessTier: accessTier
    location: location
  }
}
