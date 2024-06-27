# dot-files-arch (WIP)

![homescreen-screenshot](./assets/screenshot.png)

## TODO: 
- [ ] Waybar for system bar
- [ ] Clipman for clipboard
- [ ] On screen display for volume and brightness level preview
- [ ] Proper XDG variables and system environments
- [ ] Fix flameshot not working (probably due to the above TODO)
- [ ] Introduce lvim config and delete nvim dot files repo

## Getting Started

> Make sure sway-fx (AUR) with a display manager optionally (sddm) is installed.

1. Clone the repo

```bash
cd ~
git clone https://github.com/blucin/dot-files-arch .dotfiles
cd ~/.dotfiles
```

2. Install necessary fonts
    - `ttf-iosevka-nerd`

3. Install necessary dependencies

```
swaylock swayidle swaybg swaync stow alacritty flameshot waybar btop wl-clipboard nemo xdg-desktop-portal xdg-desktop-portal-wlr grim slurp gnome-keyring polkit-gnome fish nemo fastfetch
```

AUR

```
clipman
```

Some additional packages that I use

```
nemo-fileroller pacman-contrib ufw 
```

4. Stow all the dot files (Make sure you clone the repo in $HOME)

    - ```bash
        stow sway
        stow fastfetch
        stow alacritty
        ...
      ```

> This will automatically symlink the config files

