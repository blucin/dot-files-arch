# dot-files-arch (WIP)

![homescreen-screenshot](./assets/screenshot.png)
> Old screenshot with sway

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
stow alacritty btop fish fastfetch i3 polybar network-manager-applet
```

> grab all the members of the package i3 `i3-wm`, `i3blocks`, `i3lock`, `i3status`

Some additional packages that I use

```
pacman-contrib ufw lazygit
```

4. Stow all the dot files (Make sure you clone the repo in $HOME)

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

> This will automatically symlink the config files

