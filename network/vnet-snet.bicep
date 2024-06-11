@description('Location for all resources.')
param location string = resourceGroup().location

@description('The environement for the app such as prod, dev or preview.')
@allowed([
  'prod'
  'dev'
  'preview'
])
param environment string

@description('The instance number of the resource - ### z.B. 001')
param instanceNumber int

@description('Network adress prefix - 10.1.0.0/24')
param subnetAddressPrefix string

@description('Address prefix for the vnet - 10.1.0.0/16')
param addressPrefix string

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: 'vnet-${environment}-${instanceNumber}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
  }
}

resource snet 'Microsoft.Network/virtualNetworks/subnets@2023-09-01' = {
  parent: vnet
  name: 'snet-${environment}-${instanceNumber}'
  properties: {
    addressPrefix: subnetAddressPrefix
    privateEndpointNetworkPolicies: 'Enabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

output subnetId string = snet.id
output vnetId string = vnet.id
