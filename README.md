# 🌌 Dotfiles & System Configurations

Modularized dotfiles for **Hyprland** (Lua configuration), Wayland utilities, terminal applications, visualizers, and themes.

---

## 🎨 System Overview

- **Window Manager**: [Hyprland](https://hyprland.org) (Lua-based configuration modularized in \`hypr/\`)
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) (Catppuccin Mocha themed)
- **App Launcher**: [Rofi](https://github.com/davatorium/rofi) / [Wofi](https://hg.sr.ht/~scoopta/wofi)
- **Notification Daemon**: [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
- **Color Generator**: [Wallust](https://codeberg.org/eon/wallust)
- **Terminals & Shells**: [Kitty](https://sw.kovidgoyal.net/kitty/), Bash, Zsh
- **File Manager**: [Yazi](https://github.com/sxyazi/yazi)
- **Editor**: [Neovim](https://neovim.io) (LazyVim setup)
- **System Info**: [Fastfetch](https://github.com/fastfetch-cli/fastfetch) & [Btop](https://github.com/aristocratos/btop)
- **Audio Visualizers**: [Cava](https://github.com/karlstav/cava) & [GLava](https://github.com/glava-dev/glava)
- **Media**: [MPD](https://www.musicpd.org/) & [NCMPCPP](https://rybczak.net/ncmpcpp/)
- **Logout Menu**: [Wlogout](https://github.com/ArshamAlizal/wlogout)

---

## 📁 Repository Structure

\`\`\`
.
├── obsidian_vault.zip   # Zipped Obsidian vault archive (Brain/)
├── All_Wallpapers/   # Desktop & lockscreen wallpapers
├── btop/             # Btop system monitor settings & themes
├── cava/             # Cava audio visualizer configurations & shaders
├── fastfetch/        # Fastfetch system info layout & assets
├── glava/            # GLava audio visualizer GLSL scripts
├── gtk-3.0/          # GTK 3 theme settings
├── gtk-4.0/          # GTK 4 theme settings
├── hypr/             # Hyprland setup (hyprland.lua, lua modules, idle, lock, paper, scripts)
├── kitty/            # Kitty terminal preferences & color schemes
├── mpd/              # Music Player Daemon configuration
├── ncmpcpp/          # NCMPCPP music player interface config
├── nvim/             # Neovim (LazyVim) lua modules & settings
├── nwg-look/         # GTK settings via nwg-look
├── rofi/             # Rofi menu styles & themes
├── shell/            # Shell configs (.bashrc, .zshrc, .bash_profile, .gitconfig)
├── swaync/           # SwayNC notification center configs & MPRIS styles
├── wallust/          # Wallust template configurations
├── waybar/           # Waybar status bar config & Catppuccin Mocha styles
├── wlogout/          # Wlogout layout & CSS styles
├── wofi/             # Wofi launcher styling
└── yazi/             # Yazi file manager config & plugins
\`\`\`

---

## 🚀 Quick Setup & Installation

To link these configurations to your standard \`~/.config\` directory:

\`\`\`bash
# Clone the repository
git clone https://github.com/tharoonmk176/Dots.git ~/.config/Dots

# Example: Deploy Hyprland config
mkdir -p ~/.config/hypr
cp -r ~/.config/Dots/hypr/* ~/.config/hypr/

# Example: Deploy Wallpapers
mkdir -p ~/Pictures/Wallpapers
cp -r ~/.config/Dots/All_Wallpapers/* ~/Pictures/Wallpapers/
\`\`\`
