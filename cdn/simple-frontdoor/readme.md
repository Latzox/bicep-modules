# Front Door Module

This module deploys an Azure Front Door with the specified backend address and configuration.

## Parameters

| Name           | Type   | Description                                      | Default |
|----------------|--------|--------------------------------------------------|---------|
| `resName`      | string | The base name for the Front Door resources.      | -       |
| `backendAddress` | string | The backend address for the Front Door configuration. | -       |

## Outputs

No outputs are defined for this module.

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
