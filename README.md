# dot-files-arch (WIP)

![homescreen-screenshot](./assets/screenshot.png)

## Getting Started

1. Clone the repo

```bash
cd ~
git clone https://github.com/blucin/dot-files-arch .dotfiles
cd ~/.dotfiles
```

2. Install necessary fonts
    - `ttf-jetbrains-mono-nerd`

3. Install `neovim` and [`lunarvim`](https://www.lunarvim.org/)

3. Install necessary dependencies

```
stow alacritty btop fish fastfetch i3 polybar network-manager-applet zellij rofi qt5ct qt6ct lxappearance kvantum nwg-appearance
```
> [!IMPORTANT] 
> grab all the members of the package i3 `i3-wm`, `i3blocks`, `i3lock`, `i3status`

Some additional packages that I use

```
pacman-contrib ufw lazygit thunar thunar-media-tags-plugin thunar-volman xarchiver zip keepassxc
```

4. Make sure that the scripts under `~/.dotfiles/scripts/` are executable

```bash
ls -l ~/.dotfiles/scripts/
chmod +x ~/.dotfiles/scripts/*
```

5. Stow all the dot files (Make sure you clone the repo in $HOME)

```bash
    stow .
```

**or** manually add each configuration as required

```bash
    stow i3
    stow lvim
    stow fastfetch
    stow alacritty
    ...
```

> [!NOTE]
> This will automatically symlink the config files

6. Set some environment variables

```conf
QT_QPA_PLATFORMTHEME=qt5ct:qt6ct
XDG_CONFIG_HOME=/home/blucin/.config
```
> [!IMPORTANT]  
> **ENTER THE ABSOLUTE PATH TO THE HOME DIRECTORY, AS $HOME WILL BE DEFINED LATER ON**

## Other Theming

| Name | Description |
| ----- | ----------- |
| Icon theme | Fluent Icon Pack |
| GTK theme | Adwaita Dark |
| QT theme  | KvGnomeDark |

> [!NOTE]
> Use `nwg-appearance` and `lx-apperance` to set gtk-themes

> [!NOTE]
> Use `kvantum manager`, `qt5ct`, and `qt6ct` to set qt-themes

> [!IMPORTANT]
> For gtk 4.0 apps to pick up dark mode and theme
> `stow xdg-desktop-portal` or create `~/.config/xdg-desktop-portal/portals.conf` with

 ```conf
[preferred]
default=gtk;wlr
```

> [!NOTE]
> If it does not work set GTK_THEME variable manually in /etc/environment


