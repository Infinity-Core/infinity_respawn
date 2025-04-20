# infinity_respawn - Système de respawn RedM

Module avancé de gestion du respawn et de la réanimation pour RedM, développé par Shepard & iiRedDev (ALTITUDE-DEV.COM). Conçu pour une intégration parfaite avec Infinity Core et les autres modules Infinity.

## ✨ Fonctionnalités principales

- Système de respawn et réanimation personnalisable
- Interface web moderne pour le respawn (html/core.html)
- Synchronisation avec la gestion des joueurs du core
- Scripts serveur/client pour le flux complet de respawn
- Intégration base de données (oxmysql requis)
- Intégration facile avec les autres modules Infinity

## 📦 Installation

1. Placez ce dossier dans `resources` de votre serveur RedM.
2. Ajoutez la ressource à votre `server.cfg` :
   ```
      ensure oxmysql              # Module SQL
      ensure infinity_core        # Module Framework core
      ensure infinity_skin        # Module Skin (skins)
      ensure infinity_chars       # Module Multichars (verif accounts and multichars)
      ensure infinity_needs       # Module Metabolism, inventory (inventory and metabolism)
      ensure infinity_identity    # Module Identity (identity, skin and login)
      ensure infinity_clothes     # Module Clothes (vêtements et boutiques)
      ensure infinity_respawn     # Module Respawn (réanimation et respawn)
   ```
3. Assurez-vous que [oxmysql](https://github.com/overextended/oxmysql) est installé et lancé avant ce script.
4. Configurez les fichiers selon vos besoins.

## ⚙️ Configuration

- Scripts principaux :
  - `client.lua` (logique client)
  - `server.lua` (logique serveur)
- Interface utilisateur : `html/`

## 🛠 Contribution

Toute contribution est la bienvenue !
Merci de créer une issue ou une pull request pour toute suggestion ou amélioration.

## 🤝 Support & liens

- Documentation : [https://altitude-dev.gitbook.io/doc/](https://altitude-dev.gitbook.io/doc/)
- Discord support : [https://discord.gg/ncH7GX3XJd](https://discord.gg/ncH7GX3XJd)
- Auteurs : Shepard, iiRedDev

---

> Module sous licence ALTITUDE-DEV.COM. Toute reproduction ou distribution non autorisée est interdite.
