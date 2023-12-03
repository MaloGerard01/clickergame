# Clicker Game

Ce projet est un clicker game développé en Flutter.

## Installation

1. Clonez ce dépôt : https://github.com/MaloGerard01/clickergame

2. Accédez au répertoire du projet : clickergame

3. Exécutez la commande suivante pour récupérer les dépendances :

``` flutter pub get ```


## Lancement de l'application

Connectez votre appareil mobile ou lancez un émulateur.

Utilisez la commande suivante pour exécuter l'application :

``` flutter run ```

## Utilisation

Le jeu simule la gestion de ressources. Vous pouvez collecter des ressources en cliquant sur les boutons correspondants. Vous trouverez également des recettes et un inventaire accessibles via les boutons dans la barre de navigation

## Références/Ressources

Documentation Flutter (https://docs.flutter.dev/)
Documentation API Flutter (https://api.flutter.dev/index.html)
Stack Overflow (https://stackoverflow.com/)

## Difficultés

J'ai eu des difficultés à implémenter la gestion des effets et des matériaux au niveau logique pour différencier entre ajouter un effet aux cliques ou débloquer de nouvelles recettes avec une ou plusieurs classes tout en conservant une seule liste de recettes.

Je n'ai pas réussi à soustraire aux matériaux le coût d'une recette lors de la fabrication

## Choix de design/Implémentation

Chaque ressource est représentée par un carré de couleur qui est aussi le bouton permettant de récolter la ressource.

Deux boutons dans la barre de navigation permettent d'accéder aux recettes et a l'inventaire.