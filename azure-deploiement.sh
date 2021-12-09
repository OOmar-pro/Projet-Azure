#!/bin/bash

# Create a resource group.
az group create --name testazuremomo --location WestEurope

# Create storage account
# az storage account create -n teststoragemomo -g testazuremomo --kind StorageV2 -l FranceCentral
az storage account create --resource-group testazuremomo --kind StorageV2 --name testazuremomostorage --location FranceCentral

# Create CosmosDB ressource
az cosmosdb create --name cosmosdbmomo --resource-group testazuremomo --location WestEurope