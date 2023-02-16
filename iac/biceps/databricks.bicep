param location string = 'eastus'
param resourcePrefix string = 'dacrook'
param envPrefix string = 'dev'
param resourceGroupId string = 'dev'

@description('The pricing tier of workspace.')
@allowed([
  'standard'
  'premium'
])
param pricingTier string = 'premium'

resource databricks 'Microsoft.Databricks/workspaces@2022-04-01-preview' = {
  name: '${envPrefix}${resourcePrefix}db'
  location: location
  sku: {
    name: pricingTier
  }
  properties: {
    managedResourceGroupId: resourceGroupId
  }
}

output db_endpoint string = databricks.properties.workspaceUrl
