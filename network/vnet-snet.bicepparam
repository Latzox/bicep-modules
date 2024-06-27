using './vnet-snet.bicep'

param environment = 'prod'
param instanceNumber = 0
param subnetAddressPrefix = '10.10.1.1/24'
param addressPrefix = '10.10.0.0/16'

