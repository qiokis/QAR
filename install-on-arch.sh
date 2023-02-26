# Update pacman
echo "Updating pacman, just wait a little"
sudo pacman --noconfirm -Syu

# Install dependecies
echo "Installing a bunch of stuff"
sudo pacman -S --noconfirm --needed xorg xorg-xinit\
    bspwm sxhkd                     \
    lightdm lightdm-gtk-greeter     \
    git python3 gcc base-devel      \
	xwallpaper 						\
    rofi                            \
    papirus-icon-theme              \
    yarn                            \
    nodejs                          \
    npm                             \
    xclip                           \
    cmake                           \
	zsh vim

# Setup lightdm and nitrogen
sudo systemctl enable lightdm &

# Installing NVIM
sudo pacman -S --noconfirm --needed neovim

# Install rust for alacritty
echo "##############################"
echo "installing Rust and alacritty"
echo "##############################"
sudo pacman -S --needed rustup cargo

rustup default stable

# Installing paru
git clone https://aur.archlinux.org/paru.git ./.srcs/paru
cd ./.srcs/paru
makepkg -si
paru -Syu

# Install picom from jonaburg's repo
paru -S picom-jonaburg-git

# Installing alacritty
paru -S --noconfirm --needed alacritty

# Installing eww
sudo cp -r ~/QAR/bin/eww /usr/bin/

# Nvim plugin stuff
paru -S vim-plug

# Copying BSPWM, SXHKD, NVIM, Alacritty and PICOM configs
mkdir ~/.config

# BSPWM and SXHKD
mkdir ~/.config/bspwm/
mkdir ~/.config/sxhkd/

sudo cp -r ~/QAR/configs/bspwm/bspwmrc ~/.config/bspwm/
sudo cp -r ~/QAR/configs/sxhkd/sxhkdrc ~/.config/sxhkd/

# Alacritty
mkdir ~/.config/alacritty/

sudo cp -r ~/QAR/configs/alacritty/alacritty.yml ~/.config/alacritty/

sudo cp ~/QAR/configs/bashrc/.zshrc ~/.zhrc

# Picom
mkdir ~/.config/picom/

sudo cp -r ~/QAR/configs/picom/picom.conf ~/.config/picom/

# Scripts
sudo cp -r ~/QAR/configs/scripts/ ~/.config/scripts/

sudo chmod 777 ~/.config/scripts/windowswitch.sh

# Eww
mkdir ~/.config/eww/

sudo cp -r ~/QAR/configs/eww/eww.yuck ~/.config/eww/
sudo cp -r ~/QAR/configs/eww/eww.scss ~/.config/eww/

# Rofi
mkdir ~/.config/rofi/

sudo cp -r ~/QAR/configs/rofi/config.rasi ~/.config/rofi/
sudo cp -r ~/QAR/configs/rofi/launcher.rasi ~/.config/rofi/

# Neofetch
mkdir ~/.config/neofetch/

sudo cp -r ~/QAR/configs/neofetch/ascii ~/.config/neofetch/
sudo cp -r ~/QAR/configs/neofetch/config.conf ~/.config/neofetch/

# Wallpaper
mkdir ~/.config/wallpapers/

sudo cp -r ~/QAR/wallpapers/*.* ~/.config/wallpapers/

# Copying xinit and xprofile
sudo cp ~/QAR/xconfigs/.xinit ~/
sudo cp ~/QAR/xconfigs/.xprofile ~/
