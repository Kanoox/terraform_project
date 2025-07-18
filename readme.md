# 🚀 Mini-Projet DevOps – Déploiement Automatisé d’une Application Flask sur Azure

## 🎯 Objectif

Déployer automatiquement une infrastructure cloud complète avec :
- Une **machine virtuelle (VM)** Ubuntu sur Azure
- Un **compte de stockage Azure Blob**
- Une application **Flask** déployée sur la VM
- Une interface web avec **upload, liste, suppression de fichiers**
- Un backend connecté au **Blob Storage** pour stocker les fichiers
- Un **CRUD** basique stocké en SQLite

---

## 📁 Arborescence du projet

infra/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── provider.tf
├── scripts/
│ ├── install_flask.sh
└── README.md


---

## 🔧 Étape 1 : Initialisation de l'infrastructure (Terraform)

### ✅ Fournisseur : Azure

- Création du **Resource Group**
- Déploiement d'une **VM Ubuntu 20.04**
- Création d’une **IP publique + carte réseau**
- Déploiement d’un **compte de stockage Azure**
- Création d’un **container `static-files`** dans Azure Blob

### 📂 Fichiers Terraform :

- `main.tf` : ressources Azure
- `variables.tf` : variables dynamiques (nom de VM, localisation, etc.)
- `terraform.tfvars` : valeurs concrètes utilisées au déploiement
- `outputs.tf` : expose l’IP publique, l’URL du blob, etc.

---

## 🐍 Étape 2 : Déploiement de l'application Flask

### 📦 Backend Python avec :

- Flask
- Azure SDK (`azure-storage-blob`)
- SQLite pour stocker les métadonnées
- Variables d’environnement chargées depuis `.env`

### 🔗 Connexion au stockage Azure Blob

- Upload des fichiers avec `blob_client.upload_blob(...)`
- Accès sécurisé via `AZURE_STORAGE_CONNECTION_STRING`

---

## 📡 Étape 3 : Fonctionnalités de l’application

### 🔁 API CRUD

- `POST /upload` : envoie un fichier au blob
- `GET /files` : liste tous les fichiers
- `GET /files/<id>` : récupère les détails d’un fichier
- `DELETE /files/<id>` : supprime un fichier du blob et de la base

### 🌐 Interfaces HTML

- `/upload-form` : page simple pour uploader un fichier
- `/files-view` : liste des fichiers avec bouton “Supprimer”

---

## ⚙️ Étape 4 : Automatisation

### 🔐 Ansible effectué à 50% :

- Installe Python, pip, Flask, SQLite
- Copie `app.py` et `files.html` sur la VM
- Génère un fichier `.env` avec la chaîne Azure
- Crée un service systemd : `flask.service`
- Démarre automatiquement l'app Flask au boot