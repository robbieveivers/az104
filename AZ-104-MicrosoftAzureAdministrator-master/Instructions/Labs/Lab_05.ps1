$location1 = 'eastus'

$location2 = 'westus'

$rgName = 'az104-05-rg1'

New-AzResourceGroup -Name $rgName -Location $location1

New-AzResourceGroupDeployment `
   -ResourceGroupName $rgName `
   -TemplateFile .\AZ-104-MicrosoftAzureAdministrator-master\Allfiles\Labs\05\az104-05-vnetvm-loop-template.json `
   -TemplateParameterFile .\AZ-104-MicrosoftAzureAdministrator-master\Allfiles\Labs\05\az104-05-vnetvm-loop-parameters.json `
   -location1 $location1 `
   -location2 $location2


$rgName = 'az104-05-rg1'

$vnet0 = Get-AzVirtualNetwork -Name 'az104-05-vnet0' -ResourceGroupName $rgname

$vnet1 = Get-AzVirtualNetwork -Name 'az104-05-vnet1' -ResourceGroupName $rgname

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet0_to_az104-05-vnet1' -VirtualNetwork $vnet0 -RemoteVirtualNetworkId $vnet1.Id

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet1_to_az104-05-vnet0' -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet0.Id


$rgName = 'az104-05-rg1'

$vnet0 = Get-AzVirtualNetwork -Name 'az104-05-vnet0' -ResourceGroupName $rgname

$vnet2 = Get-AzVirtualNetwork -Name 'az104-05-vnet2' -ResourceGroupName $rgname

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet0_to_az104-05-vnet2' -VirtualNetwork $vnet0 -RemoteVirtualNetworkId $vnet2.Id

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet2_to_az104-05-vnet0' -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet0.Id


$rgName = 'az104-05-rg1'

$vnet1 = Get-AzVirtualNetwork -Name 'az104-05-vnet1' -ResourceGroupName $rgname

$vnet2 = Get-AzVirtualNetwork -Name 'az104-05-vnet2' -ResourceGroupName $rgname

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet1_to_az104-05-vnet2' -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id

Add-AzVirtualNetworkPeering -Name 'az104-05-vnet2_to_az104-05-vnet1' -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id


##Clean Up Scripts
Get-AzResourceGroup -Name 'az104-05*'
Get-AzResourceGroup -Name 'az104-05*' | Remove-AzResourceGroup -Force -AsJob
Get-AzResourceGroup -Name 'Net*' | Remove-AzResourceGroup -Force -AsJob
Get-Job