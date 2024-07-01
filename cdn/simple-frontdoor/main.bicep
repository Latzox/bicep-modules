@description('The name of the resource.')
param resName string

@description('The address of the backend.')
param backendAddress string

var frontDoorName = 'azfd-${resName}'
var frontEndEndpointName = 'EndP-${resName}'
var loadBalancingSettingsName = 'Load-${resName}'
var healthProbeSettingsName = 'Health-${resName}'
var routingRuleName = 'Route-${resName}'
var backendPoolName = 'Pool-${resName}'

resource frontdoor 'Microsoft.Network/frontDoors@2021-06-01' = {
  name: frontDoorName
  location: 'global'
  properties: {
    enabledState: 'Enabled'
    frontendEndpoints: [
      {
        name: frontEndEndpointName
        properties: {
          hostName: 'afd-${resName}.azurefd.net'
          sessionAffinityEnabledState: 'Disabled'
        }
      }
    ]
    loadBalancingSettings: [
      {
        name: loadBalancingSettingsName
        properties: {
          sampleSize: 4
          successfulSamplesRequired: 2
        }
      }
    ]
    healthProbeSettings: [
      {
        name: healthProbeSettingsName
        properties: {
          path: '/'
          protocol: 'Http'
          intervalInSeconds: 120
        }
      }
    ]
    backendPools: [
      {
        name: backendPoolName
        properties: {
          backends: [
            {
              address: backendAddress
              backendHostHeader: backendAddress
              httpPort: 80
              httpsPort: 443
              weight: 50
              priority: 1
              enabledState: 'Enabled'
            }
          ]
          loadBalancingSettings: {
            id: resourceId(
              'Microsoft.Network/frontDoors/loadBalancingSettings',
              frontDoorName,
              loadBalancingSettingsName
            )
          }
          healthProbeSettings: {
            id: resourceId('Microsoft.Network/frontDoors/healthProbeSettings', frontDoorName, healthProbeSettingsName)
          }
        }
      }
    ]
    routingRules: [
      {
        name: routingRuleName
        properties: {
          frontendEndpoints: [
            {
              id: resourceId('Microsoft.Network/frontDoors/frontEndEndpoints', frontDoorName, frontEndEndpointName)
            }
          ]
          acceptedProtocols: [
            'Http'
            'Https'
          ]
          patternsToMatch: [
            '/*'
          ]
          routeConfiguration: {
            '@odata.type': '#Microsoft.Azure.FrontDoor.Models.FrontdoorForwardingConfiguration'
            forwardingProtocol: 'HttpsOnly'
            backendPool: {
              id: resourceId('Microsoft.Network/frontDoors/backendPools', frontDoorName, backendPoolName)
            }
          }
          enabledState: 'Enabled'
        }
      }
    ]
  }
}

output frontDoorId string = frontdoor.id
output frontEndEndpoint string = frontdoor.properties.frontendEndpoints[0].properties.hostName
output backendPoolId string = frontdoor.properties.backendPools[0].id
