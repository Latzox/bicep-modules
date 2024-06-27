using './vm-ubuntu-pip.bicep'

param appName = 'test-app'
param instanceNumber = 001
param environment = 'prod'
param adminUsername = 'latzo'
param adminPasswordOrKey = 'sshPublicKey'
param ubuntuOSVersion = 'Ubuntu-1804'
param vmSize = 'Standard_B1s'
param subnetId = '1'
param encodedCloudInit = '1'
