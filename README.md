# infinity_respawn - RedM Respawn System

Advanced respawn and revival system for RedM, developed by Shepard & iiRedDev (ALTITUDE-DEV.COM). Designed for seamless integration with Infinity Core and other Infinity modules.

## ✨ Main Features

- Customizable player respawn and revival system
- Modern web UI for respawn interface (html/core.html)
- Synchronization with core player management
- Server/client scripts for full respawn flow
- Database integration (requires oxmysql)
- Easy integration with other Infinity modules

## 📦 Installation

1. Place this folder in your server's `resources` directory.
2. Add the resource to your `server.cfg`:
   ```
      ensure oxmysql              # Module SQL
      ensure infinity_core        # Module Framework core
      ensure infinity_skin        # Module Skin (skins)
      ensure infinity_chars       # Module Multichars (verif accounts and multichars)
      ensure infinity_needs       # Module Metabolism, inventory (inventory and metabolism)
      ensure infinity_identity    # Module Identity (identity, skin and login)
      ensure infinity_clothes     # Module Clothes (outfits and shops)
      ensure infinity_respawn     # Module Respawn (revive and respawn)
   ```
3. Make sure [oxmysql](https://github.com/overextended/oxmysql) is installed and started before this script.
4. Configure the files as needed.

## ⚙️ Configuration

- Main scripts:
  - `client.lua` (client logic)
  - `server.lua` (server logic)
- User interface: `html/`

## 🛠 Contribution

Contributions are welcome!
Please create an issue or pull request for any suggestion or improvement.

## 🤝 Support & Links

- Documentation: [https://altitude-dev.gitbook.io/doc/](https://altitude-dev.gitbook.io/doc/)
- Discord support: [https://discord.gg/ncH7GX3XJd](https://discord.gg/ncH7GX3XJd)
- Authors: Shepard, iiRedDev

---

> Module licensed by ALTITUDE-DEV.COM. Any unauthorized reproduction or distribution is prohibited.
