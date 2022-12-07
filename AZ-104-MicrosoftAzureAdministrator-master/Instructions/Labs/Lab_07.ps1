$location = 'eastus'

$rgName = 'az104-07-rg0'

New-AzResourceGroup -Name $rgName -Location $location

New-AzResourceGroupDeployment `
   -ResourceGroupName $rgName `
   -TemplateFile .\AZ-104-MicrosoftAzureAdministrator-master\Allfiles\Labs\07\az104-07-vm-template.json `
   -TemplateParameterFile .\AZ-104-MicrosoftAzureAdministrator-master\Allfiles\Labs\07\az104-07-vm-parameters.json `
   -AsJob

   #sp=r&st=2022-12-06T05:20:13Z&se=2022-12-08T13:20:13Z&spr=https&sv=2021-06-08&sr=b&sig=ko1tci3dDisX%2F6%2BO7DGyGZre2uk4AsIMlnNxMvqIy48%3D

   #https://az104robbietest.blob.core.windows.net/az104-07-container/licenses/LICENSE?sp=r&st=2022-12-06T05:20:13Z&se=2022-12-08T13:20:13Z&spr=https&sv=2021-06-08&sr=b&sig=ko1tci3dDisX%2F6%2BO7DGyGZre2uk4AsIMlnNxMvqIy48%3D


   Invoke-WebRequest -URI 'https://az104robbietest.blob.core.windows.net/az104-07-container/licenses/LICENSE?sp=r&st=2022-12-06T05:20:13Z&se=2022-12-08T13:20:13Z&spr=https&sv=2021-06-08&sr=b&sig=ko1tci3dDisX%2F6%2BO7DGyGZre2uk4AsIMlnNxMvqIy48%3D'


   Get-AzResourceGroup -Name 'az104-07*'
   Get-AzResourceGroup -Name 'az104-07*' | Remove-AzResourceGroup -Force -AsJob
   Get-Job