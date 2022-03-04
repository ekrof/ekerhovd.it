param staticSites_name string = 'ekerhovdit'

resource staticWebApp 'Microsoft.Web/staticSites@2021-03-01' = {
  name: staticSites_name
  location: 'West Europe'
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: 'https://github.com/ekrof/ekerhovd.it'
    branch: 'main'
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    provider: 'GitHub'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}
output deployment_token string = listSecrets(staticWebApp.id, staticWebApp.apiVersion).properties.apiKey
