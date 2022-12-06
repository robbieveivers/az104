Get-AzSubscription

$rgName = 'az104-04-rg1'

New-AzResourceGroupDeployment `
   -ResourceGroupName $rgName `
   -TemplateFile .\AZ-104-MicrosoftAzureAdministrator-master\Allfiles\Labs\04\az104-04-vms-loop-template.json `
   -TemplateParameterFile .\AZ-104-MicrosoftAzureAdministrator-master\Allfiles\Labs\04\az104-04-vms-loop-parameters.json

   
20.169.242.46 # vm0

40.87.97.188 # vm1

robertveivers.com.au

nslookup az104-04-vm0.robertveivers.com.au ns1-38.azure-dns.com

nslookup az104-04-vm1.robertveivers.com.au ns1-38.azure-dns.com


#Clean up resources
Get-AzResourceGroup -Name 'az104-04*'
Get-AzResourceGroup -Name 'az104-04*' | Remove-AzResourceGroup -Force -AsJob

Get-Job