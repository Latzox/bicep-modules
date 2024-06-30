[![Build Bicep Modules](https://github.com/Latzox/bicep-modules/actions/workflows/build-bicep-modules.yml/badge.svg)](https://github.com/Latzox/bicep-modules/actions/workflows/build-bicep-modules.yml) [![Bicep Modules Build and Publish](https://github.com/Latzox/bicep-modules/actions/workflows/publish-bicep-modules.yml/badge.svg)](https://github.com/Latzox/bicep-modules/actions/workflows/publish-bicep-modules.yml)

# Public Bicep Modules

Welcome to the repository of my Bicep modules! This repository contains a collection of reusable Bicep modules to streamline the deployment and management of Azure resources using Infrastructure as Code (IaC). All modules are publicly available in both this repository and an Azure Container Registry (ACR).

## Using the Modules

To use these Bicep modules, you can reference them directly from the repository or pull them from the Azure Container Registry.

### Using Azure Container Registry (ACR)

All modules are also published to an Azure Container Registry for easier integration. To reference a module from the ACR, use the following syntax:

```
module myModule 'br:latzo.azurecr.io/bicep/modules/cdn/simple-frontdoor:<tag>' = {
  name: 'myModule'
  params: {
    // module parameters
  }
}
```

## Contributing

Contributions are welcome! If you have a module you would like to add, please fork the repository, create a new branch, and submit a pull request. Ensure your module includes the following:

- A main.bicep file with the Bicep code.
- A metadata.json file with details about the module.
- A README.md file with documentation for the module.

## License

This repository is licensed under the MIT License. See the [LICENSE](https://github.com/Latzox/bicep-modules/blob/main/LICENSE) file for more information.

## Contact

For any questions or issues, please open an issue in this repository or contact me at mail@latzo.ch.