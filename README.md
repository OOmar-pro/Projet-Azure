# Projet-Azure

## Commandes pour mettre en place Visual Studio code

- (1) Ctrl+shift+P pour ouvrir le cmd de Visual Studio code
- choisir "Add developement config files"
- refaire (1) puis choisir "azure function +  python" ou "+ javascript/node js"
- refaire (1) puis "remote containers => rebuild and reopen in containers"
- une fois le processus terminer vous etes logger dans le container
- ouvrir un nouveau terminal et lancer la commande "az login" (vous permet de vous connecter via le client Azure)


## Taches

- creer un groupe de ressource
- creer un blob

### Creer azure function

#### Initialisation le dossier de fonction

Deux choix:
- via l'Extension VScode (onglet avec un A sur le panel de gauche)

- ou via le Azure CLI
    - Creer un dossier et se mettre dedans
    - taper "func init" et choisir le language de votre projet.
    - creer une fonction en tapant "func new" et choisir un template de fonction

#### Configurer la fonction

    - configurer le binding avec les infos voulus (function.json => "connection": "AzureWebJobsStorage" qui pointe sur la cle "AzureWebJobsStorage" de "local.settings.jsons")
    - Remarque: possibilité de creer des nouveaux bindings avec un clic droit sur vscode
    - Ajouter une binding sur le blob et une sur la cosmosDB (donc 2 bindings en tout)
    - Ajouter les bindings en paralemetre de votre fonction (dans le fichier __init.py__ pour un projet python)

### Ecriture de la fonction

Ecrire dans la fonction le code qui utilisera le COGNITIVE SERVICES

### Creer un front web

Creer un front web qui utilisera les differents services.


creer:

- Storage account (blobs)
- azurefunctions
- cosmos DB
- Cognitive services
- front
