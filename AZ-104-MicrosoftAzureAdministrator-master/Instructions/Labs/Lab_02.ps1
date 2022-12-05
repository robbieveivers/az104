#Policy Configuration
Connect-AzAccount ## -UseDeviceAuthentication  Only need for Cloud Shell
Get-AzureRmRoleDefinition Reader

#Checking to insure the Module is installed in Powershell
Install-Module -Name Az.Resources
Import-Module -Name Az.Resources

New-AzRoleDefinition -InputFile .\Allfiles\Labs\02\az104-02a-customRoleDefinition.json

   
$scope = (Get-AzRoleDefinition -Name 'Support Request Contributor (Custom)').AssignableScopes[0]

Remove-AzRoleAssignment -ObjectId 'baede233-9c99-4b64-9797-c542aa426b92' -RoleDefinitionName 'Support Request Contributor (Custom)' -Scope $scope


Remove-AzRoleDefinition -Name 'Support Request Contributor (Custom)' -Force

Get-AzRoleDefinition -Name 'Support Request Contributor (Custom)'