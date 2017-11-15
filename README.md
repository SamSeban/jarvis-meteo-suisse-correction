<!---
IMPORTANT
=========
This README.md is displayed in the WebStore as well as within Jarvis app
Please do not change the structure of this file
Fill-in Description, Usage & Author sections
Make sure to rename the [en] folder into the language code your plugin is written in (ex: fr, es, de, it...)
For multi-language plugin:
- clone the language directory and translate commands/functions.sh
- optionally write the Description / Usage sections in several languages
-->
## Description
Donne la météo en suisse, france et belgique.
Les données sont reccueillies avec l'API du site https://www.prevision-meteo.ch

## Configuration
Pour ajouter votre ville il suffit d'inscrire son nom dans le fichier config. Vous pouvez tester les noms directement en regardant l'url : https://www.prevision-meteo.ch/services/json/paris

ou ici pour rechercher https://www.prevision-meteo.ch/services
## Usage
```
moi: quelle est la météo pour aujourd'hui
jarvis: Voici les conditions météo actuelle :
jarvis: Nuit claire et stratus.
jarvis: Température 0 degré.
jarvis: humidité 94 pourcent.

moi: quelle est la météo pour demain
jarvis: Voici les conditions météo pour demain :
jarvis: Ensoleillé.
jarvis: Température, minimum moins  3 degré, maximum  7 degré.
```

## Author
[Shinix](https://www.shinix.me)
