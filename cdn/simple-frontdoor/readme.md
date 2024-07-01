# Simple Azure Front Door Module

This module deploys an Azure Front Door with the specified backend address and configuration.

## Parameters

| Name             | Type   | Description                                      | Default |
|------------------|--------|--------------------------------------------------|---------|
| `resName`        | string | The base name for the Front Door resources.      | -       |
| `backendAddress` | string | The backend address for the Front Door configuration. | -       |

## Outputs

| Name              | Type   | Description                                         |
|-------------------|--------|-----------------------------------------------------|
| `frontDoorId`     | string | The ID of the deployed Front Door.                  |
| `frontEndEndpoint`| string | The hostname of the Front Door frontend endpoint.   |
| `backendPoolId`   | string | The ID of the backend pool in the Front Door.       |

## Usage

```
module frontDoor 'br:latzo.azurecr.io/bicep/modules/cdn/simple-frontdoor:<tag>' = {
  name: 'frontDoor'
  params: {
    resName: 'myFrontDoor'
    backendAddress: 'mybackend.example.com'
  }
}
```

### Example

Here is an example of how to use this module in your Bicep file:

```
module frontDoor 'br:latzo.azurecr.io/bicep/modules/cdn/simple-frontdoor:latest' = {
  name: 'frontDoorDeployment'
  params: {
    resName: 'myFrontDoor'
    backendAddress: 'mybackend.example.com'
  }
}

output frontDoorId string = frontDoor.outputs.frontDoorId
output frontEndEndpoint string = frontDoor.outputs.frontEndEndpoint
output backendPoolId string = frontDoor.outputs.backendPoolId
```