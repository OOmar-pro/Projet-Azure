#!/bin/bash

resource_name_group="theeye_group"
name_storage_account="theeye_storage"
name_cosmosdb="thheeye_db"
location="WestEurope"

# Create a resource group.
az group create --name $resource_name_group --location $location

# Create storage account
# az storage account create -n teststoragemomo -g testazuremomo --kind StorageV2 -l FranceCentral
az storage account create --resource-group $resource_name_group --kind StorageV2 --name $name_storage_account --location $location

# Create blob storage containers
blob_storage_account_key=$(az storage account keys list -g $resource_name_group -n $name_storage_account --query "[0].value" --output tsv)

az storage container create --name images --account-name $name_storage_account --account-key $blob_storage_account_key

# Create app service plan 
# An App Service plan specifies the location, size, and features of the web server farm that hosts your app.
name_app_service_plan="myAppServicePlan"
az appservice plan create --name $name_app_service_plan --resource-group $resource_name_group --sku Free

# Create a web app
webapp="testApp"
az webapp create --name $webapp --resource-group $resource_name_group --plan $name_app_service_plan

# Deploy web app
az webapp deployment source config --name $webapp --resource-group $resource_name_group --branch master --manual-integration --repo-url https://github.com/OOmar-pro/Projet-Azure-Front.git

# Config web app
az webapp config appsettings set --name $webapp --resource-group $resource_name_group --settings AZURE_STORAGE_ACCOUNT_NAME=$name_storage_account AZURE_STORAGE_ACCOUNT_ACCESS_KEY=$blob_storage_account_key


# Create CosmosDB ressource
az cosmosdb create --name $name_cosmosdb --resource-group $resource_name_group --location $location