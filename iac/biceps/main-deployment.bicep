targetScope = 'subscription'

param location string = 'eastus'
param resourcePrefix string = 'ml'
param envPrefix string = 'dev'

resource rg_base 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${envPrefix}-${resourcePrefix}-base'
  location: location
}

module databricks './databricks.bicep' = {
  name: '${resourcePrefix}storage'
  scope: rg_base
  params: {
    resourcePrefix: resourcePrefix
    envPrefix: envPrefix
    location: location
    resourceGroupId: '${rg_base.id}-m-db'
  }
}
