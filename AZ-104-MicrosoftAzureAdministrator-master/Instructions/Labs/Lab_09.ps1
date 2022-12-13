

## local git https://az104-09-vnet1-staging.scm.azurewebsites.net:443/az104-09-vnet1.git
# az104-09-vnet1__staging\$az104-09-vnet1__staging
# v41mm9uvubX297uriPZlyYtbMgEK4bvMJnjQemrRFZpL90gZRemg9cW9ZR7K

git clone https://github.com/Azure-Samples/php-docs-hello-world
Set-Location -Path $HOME/php-docs-hello-world/
git remote add [deployment_user_name] [git_clone_url]

git push [deployment_user_name] master


$rgName = 'az104-09a-rg1'

$webapp = Get-AzWebApp -ResourceGroupName $rgName

while ($true) { Invoke-WebRequest -Uri $webapp.DefaultHostName }

Get-AzResourceGroup -Name 'az104-09a*'
Get-AzResourceGroup -Name 'az104-09a*' | Remove-AzResourceGroup -Force -AsJob


################# 9b
Get-AzResourceGroup -Name 'az104-09b*'
Get-AzResourceGroup -Name 'az104-09b*' | Remove-AzResourceGroup -Force -AsJob

############## 9c
Register-AzResourceProvider -ProviderNamespace Microsoft.Kubernetes

Register-AzResourceProvider -ProviderNamespace Microsoft.KubernetesConfiguration

#BASH COmmnadline
kubectl

minikube kubectl -- version --client


RESOURCE_GROUP='az104-09c-rg1'

AKS_CLUSTER='az104-9c-aks1'

az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER
kubectl get nodes

kubectl create deployment nginx-deployment --image=nginx

kubectl get pods

kubectl get deployment

kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer

kubectl get service

kubectl scale --replicas=2 deployment/nginx-deployment

kubectl get pods

RESOURCE_GROUP='az104-09c-rg1'

AKS_CLUSTER='az104-9c-aks1'

az aks scale --resource-group $RESOURCE_GROUP --name $AKS_CLUSTER --node-count 2

kubectl get nodes

kubectl scale --replicas=10 deployment/nginx-deployment

kubectl get pods

kubectl get pod -o=custom-columns=NODE:.spec.nodeName,POD:.metadata.name

kubectl delete deployment nginx-deployment

#Cleanup
az group list --query "[?starts_with(name,'az104-09c')].name" --output tsv
az group list --query "[?starts_with(name,'az104-09c')].[name]" --output tsv | xargs -L1 bash -c 'az group delete --name $0 --no-wait --yes'