APP_FOLDER=/app

if ! [ -n "$XDG_CONFIG_HOME" ]; then
  XDG_CONFIG_HOME=$HOME/.config
fi

# create app folder
sudo mkdir -p $APP_FOLDER
sudo chmod 775 $APP_FOLDER

# install yay
sudo pacman -S --noconfirm git base-devel
if cd $APP_FOLDER/yay; then
  git pull
else
  git clone https://aur.archlinux.org/yay.git $APP_FOLDER/yay
fi
cd $APP_FOLDER/yay
makepkg -si

# install yay dependencies
yay -S --noconfirm curl

# download antigen
sudo curl -L git.io/antigen > $APP_FOLDER/antigen.zsh

# download my own configuration to /app/config
if cd $APP_FOLDER/config; then
  git pull
else
  git clone https://github.com/ianzano/config.git $APP_FOLDER/config
fi 

# setup zsh configuration
sudo rm -rf /etc/zsh/zshrc
sudo mkdir -p /etc/zsh
sudo ln -s $APP_FOLDER/config/zshrc /etc/zsh/zshrc
touch $HOME/.zshrc

# setup AstroNvim neovim plugins
if cd $APP_FOLDER/AstroNvim; then
  git pull
else
  git clone https://github.com/AstroNvim/AstroNvim.git $APP_FOLDER/AstroNvim
fi
sudo rm -rf $XDG_CONFIG_HOME/nvim
sudo ln -s $APP_FOLDER/AstroNvim $XDG_CONFIG_HOME/nvim

# setup my own AstroNvim custom configuration
sudo rm -rf $APP_FOLDER/AstroNvim/lua/user
sudo ln -s $APP_FOLDER/config/astronvim $APP_FOLDER/AstroNvim/lua/user

# setup php
yay -S php-fpm apache phpactor composer

# setup tmux package manager tpm
if cd $APP_FOLDER/tpm; then
  git pull
else
  git clone https://github.com/tmux-plugins/tpm $APP_FOLDER/tpm
fi

# setup tmux configuration
sudo mkdir -p $XDG_CONFIG_HOME/tmux
sudo rm -rf $XDG_CONFIG_HOME/tmux/tmux.conf
sudo ln -s $APP_FOLDER/config/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
