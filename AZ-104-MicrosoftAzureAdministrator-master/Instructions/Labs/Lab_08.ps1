# az10408rg01diag755

Register-AzResourceProvider -ProviderNamespace Microsoft.Insights

Register-AzResourceProvider -ProviderNamespace Microsoft.AlertsManagement

# scalingmanagment

#20.172.233.199 (az10408vmss0-ip)

$rgName = 'az104-08-rg02'

$lbpipName = 'az10408vmss0-ip'

$pip = (Get-AzPublicIpAddress -ResourceGroupName $rgName -Name $lbpipName).IpAddress

while ($true) { Invoke-WebRequest -Uri "http://$pip" }

Set-Location -Path .\AZ-104-MicrosoftAzureAdministrator-master\Allfiles\Labs\08



Get-Content -Path  .\az104-08-configure_VMSS_disks.ps1
./az104-08-configure_VMSS_disks.ps1

Get-AzResourceGroup -Name 'az104-08*'
Get-AzResourceGroup -Name 'az104-08*' | Remove-AzResourceGroup -Force -AsJob
Get-Job

