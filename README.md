# OPC_DATA_SCIENTIST_PROJET5
Segmentez des clients d'un site e-commerce


# Segmentation des Clients - Projet Olist

## Aperçu de l'entreprise

![Aperçu du site web]() 
## Contexte

Je suis consultant pour **Olist**, une entreprise brésilienne qui offre une solution de vente sur les marketplaces en ligne. Olist cherche à améliorer sa stratégie marketing en segmentant ses clients. Mon objectif est de fournir une segmentation client actionable qui pourra être utilisée pour les campagnes de communication, le suivi des clients et l’amélioration de l’expérience utilisateur.

Les données fournies contiennent des informations anonymisées sur l’historique des commandes, les produits achetés, les commentaires de satisfaction, et la localisation des clients depuis janvier 2017. En utilisant ces données, je vais appliquer des méthodes non supervisées (clustering) pour regrouper les clients aux comportements similaires.

## Objectifs du Projet

1. **Segmentation des Clients** : Utiliser des méthodes de clustering pour regrouper les clients en fonction de leur comportement d’achat et leurs données personnelles. La segmentation doit être exploitable et utilisable par l’équipe Marketing pour améliorer les campagnes de communication.
   
2. **Analyse et Caractérisation des Segments** : Analyser les segments créés pour comprendre leur comportement, et fournir des insights clairs sur la façon dont chaque segment peut être exploité.

3. **Fréquence de Mise à Jour** : Proposer une fréquence optimale pour la mise à jour de la segmentation afin qu’elle reste pertinente dans le temps, et fournir un plan de maintenance basé sur une simulation de stabilité des clusters.

## Étapes du Projet

### Étape 1 : Répondre aux Requêtes SQL

- **Objectif** : Implémenter des requêtes SQL pour alimenter le tableau de bord de **Customer Experience**.
- **Détails** :
  - Finaliser un script avec les requêtes SQL fournies par Fernanda.
  - Structurer les requêtes de manière lisible en utilisant des sous-requêtes avec la clause **WITH AS**.
  - Vérifier les jointures et les agrégations pour garantir que les résultats sont cohérents.
- **Livrable** : Un script SQL fonctionnel avec les 4 requêtes demandées.

### Étape 2 : Créer des Features par Client

- **Objectif** : Créer un fichier contenant des variables clés (features) pour chaque client à partir des données fournies.
- **Détails** :
  - Calculer des features pertinentes comme la récence, la fréquence, et le montant des achats (RFM), mais également des variables liées à la satisfaction et aux produits achetés.
  - Réaliser des transformations comme la **normalisation** et l’**encodage des variables catégorielles** en fonction des algorithmes de clustering sélectionnés.
  - Ne pas supprimer les clients ayant effectué plusieurs commandes.
- **Livrable** : Un notebook contenant la partie feature engineering avec toutes les variables créées par client.

### Étape 3 : Élaborer un Modèle de Clustering

- **Objectif** : Utiliser des algorithmes de clustering pour regrouper les clients selon leur comportement.
- **Détails** :
  - Tester différents algorithmes de clustering, en commençant par le **k-means** avec un nombre de clusters initial entre 3 et 6.
  - Proposer un nombre optimal de clusters en utilisant des méthodes quantitatives comme le **coefficient de silhouette** ou la **méthode de l'élbow**.
  - Caractériser chaque cluster en établissant des liens entre les features d’entrée et les clusters.
  - Justifier les choix de clustering à la fois avec des métriques quantitatives et des considérations métiers.
- **Livrable** : Un notebook contenant les résultats des différentes simulations de clustering et l’analyse des segments obtenus.

### Étape 4 : Simuler un Contrat de Maintenance

- **Objectif** : Déterminer la fréquence à laquelle le modèle de segmentation doit être mis à jour pour rester pertinent.
- **Détails** :
  - Utiliser des mesures comme l’**ARI (Adjusted Rand Index)** pour évaluer la divergence des clusters au fil du temps.
  - Analyser la stabilité des clusters et leur évolution en fonction de la distribution des features.
  - Proposer une fréquence de mise à jour réaliste pour maintenir la qualité de la segmentation.
- **Livrable** : Un notebook avec la simulation de la stabilité des clusters et des recommandations de mise à jour.

**On note que les etapes 3 et 4 sont dont le notebook nommee P5_Segmentation**
## Détails Techniques

- **Fichiers** :
  - `Données anonymisées de Olist` : Contient les informations sur les commandes, produits, clients, satisfaction, etc.
  - **Script SQL** : Contient les requêtes pour le tableau de bord Customer Experience.
  - **Notebook de presentation donnes et de Feature Engineering** : Contient les étapes de création des features par client.
  - **Notebook de Segmentation** : Contient les simulations de clustering et l’analyse des résultats.

- **Outils Utilisés** :
  - **Python** (pandas, scikit-learn) pour le traitement des données et les algorithmes de clustering.
  - **SQL** pour la requête et l’exploration des données.
  - **Jupyter Notebook** pour la création des notebooks et l’analyse des données.
  - **Matplotlib** et **Seaborn** pour la visualisation des résultats.
  - **Sklearn** et les modele de clustring **DBSCAN**,**K-Means**

- **Compétences Utilisées** :
  - Feature engineering pour créer des variables pertinentes pour la segmentation (la segmentation RFM).
  - Algorithmes de clustering pour regrouper les clients en segments exploitables.
  - Analyse des clusters pour caractériser les segments et fournir des insights métiers.
  - Simulation de stabilité pour déterminer la fréquence de mise à jour des clusters.

## Résumé

Ce projet me permet de fournir une segmentation des clients de **Olist** en utilisant des méthodes non supervisées comme le clustering. L’objectif est de créer des segments exploitables pour des campagnes marketing et d’analyser la stabilité des segments dans le temps afin de proposer une fréquence optimale de mise à jour. Les résultats aideront Olist à mieux comprendre ses clients et à personnaliser ses actions marketing.
