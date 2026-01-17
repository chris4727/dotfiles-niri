#!/usr/bin/sh
# ==  SETUP  ====================================
#

# Clone dotfiles repository from Github
git clone https://github.com/chris4727/dotfiles ~/dotfiles

# Change directory to the dotfiles folder
cd ~/dotfiles

# Install GNU Stow if not already installed
sudo pacman -S stow

# List of packages to install and stow their configurations
basic_packages=("stow" "vim" "kitty" "tmux")
optional_packages=("starship" "yazi" "zathura")

for package in "${packages[@]}"
do
    # Install the package with Pacman
    sudo pacman -S "$package"

    # Use GNU Stow to symlink the configuration files
    stow -t ~ "$package"
done

echo "Packages installed and configurations stowed successfully!"
