# SIZE Vault — extension (brouillon)

Cette branche dérive de Passbolt Community et conserve ses licences et mentions d'origine. Elle adapte une partie du nom et du logo. Ce n'est pas une version prête à recevoir des mots de passe réels.

## Compiler pour Chromium

Avec Node.js 22.14 ou ultérieur, npm et l'utilitaire `patch` :

```sh
npm ci --ignore-scripts
npm run build:size:chromium
```

La commande applique le correctif de l'interface à `passbolt-styleguide` version 5.17.2 avant la compilation. Elle échoue si la version ou le contenu de la dépendance ne correspond pas. Elle peut être relancée sans réappliquer le correctif. Ne pas publier le paquet sous l'identité de Passbolt.

Le logo principal de l'interface est adapté ainsi que le nom de l'extension. Les icônes, les autres écrans, les textes et la distribution restent à adapter. Les tests réels avec le serveur, les extensions de tous les navigateurs et les flux de connexion et de partage restent à effectuer. Le code d'origine et sa licence restent consultables dans ce dépôt.
