using './main.bicep'

param appName = 'test-app'
param instanceNumber = 001
param environment = 'prod'
param adminUsername = 'latzo'
param adminPasswordOrKey = 'sshPublicKey'
param ubuntuOSVersion = 'Ubuntu-2004'
param vmSize = 'Standard_B1s'
param subnetId = '1'
param encodedCloudInit = '1'
