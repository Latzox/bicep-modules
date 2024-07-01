# Azure VM Ubuntu with PIP

This module deploys an Azure Virtual Machine (VM) with a public IP address, running an Ubuntu operating system.

## Parameters

| Name                   | Type          | Description                                                                                   | Default                                         |
|------------------------|---------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------|
| `appName`              | string        | The name of your app.                                                                          | -                                               |
| `instanceNumber`       | int           | The number of the resource being deployed - e.g., 001.                                         | -                                               |
| `environment`          | string        | The environment for the app such as prod, dev, or preview.                                     | -                                               |
| `adminUsername`        | string        | Username for the Virtual Machine.                                                              | -                                               |
| `authenticationType`   | string        | Type of authentication to use on the Virtual Machine. SSH key is recommended.                  | `sshPublicKey`                                   |
| `adminPasswordOrKey`   | securestring  | SSH Key or password for the Virtual Machine. SSH key is recommended.                           | -                                               |
| `dnsLabelPrefix`       | string        | Unique DNS Name for the Public IP used to access the Virtual Machine.                          | `toLower('${appName}-${uniqueString(resourceGroup().id)}')` |
| `ubuntuOSVersion`      | string        | The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version.| -                                               |
| `location`             | string        | Location for all resources.                                                                    | `resourceGroup().location`                      |
| `vmSize`               | string        | The size of the VM.                                                                            | -                                               |
| `subnetId`             | string        | The ID of the subnet.                                                                          | -                                               |
| `securityType`         | string        | Security Type of the Virtual Machine.                                                          | `TrustedLaunch`                                 |
| `encodedCloudInit`     | string        | Encoded Cloud Init data.                                                                       | -                                               |
| `networkSecurityGroupName` | string    | Name of the Network Security Group.                                                            | `nsg-${appName}-${environment}-${instanceNumber}` |
| `publicIPAddressName`  | string        | The name of the public IP address resource.                                                    | `pip-${appName}-${environment}-${instanceNumber}` |
| `networkInterfaceName` | string        | The name of the network interface for the VM.                                                  | `nic-${appName}-${environment}-${instanceNumber}` |

## Outputs

| Name          | Type   | Description                                      |
|---------------|--------|--------------------------------------------------|
| `adminUsername` | string | The admin username for the VM.                 |
| `hostname`     | string | The DNS hostname of the VM.                      |
| `sshCommand`   | string | The SSH command to connect to the VM.            |

## Usage

```
module vmModule 'br:latzo.azurecr.io/bicep/modules/compute/vm-ubuntu-pip:1.0.0' = {
  name: 'vmDeployment'
  params: {
    appName: 'myApp'
    instanceNumber: 1
    environment: 'dev'
    adminUsername: 'azureuser'
    authenticationType: 'sshPublicKey'
    adminPasswordOrKey: '<your-ssh-key>'
    ubuntuOSVersion: 'Ubuntu-2004'
    location: 'eastus'
    vmSize: 'Standard_B2s'
    subnetId: '<your-subnet-id>'
    encodedCloudInit: '<your-encoded-cloud-init-data>'
  }
}

output adminUsername string = vmModule.outputs.adminUsername
output hostname string = vmModule.outputs.hostname
output sshCommand string = vmModule.outputs.sshCommand
```