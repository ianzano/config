APP_FOLDER=/app

if ! [ -n "$XDG_CONFIG_HOME" ]; then
  XDG_CONFIG_HOME=$HOME/.config
fi

# create app folder
sudo mkdir -p $APP_FOLDER
sudo chmod 775 $APP_FOLDER

# install yay
sudo pacman -S --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git $APP_FOLDER/yay
cd $APP_FOLDER/yay
makepkg -si

# install yay dependencies
yay -S --noconfirm curl

# download antigen
sudo curl -L git.io/antigen > $APP_FOLDER/antigen.zsh

# download my own configuration to /app/config

# setup zsh configuration
sudo rm -rf /etc/zsh/zshrc
sudo mkdir -p /etc/zsh
sudo ln -s $APP_FOLDER/config/zshrc /etc/zsh/zshrc
touch $HOME/.zshrc

# setup NvChad neovim plugin
git clone https://github.com/NvChad/NvChad.git $APP_FOLDER/NvChad
sudo rm -rf $XDG_CONFIG_HOME/nvim
sudo ln -s $APP_FOLDER/NvChad $XDG_CONFIG_HOME/nvim

# setup my own NvChad custom configuration
sudo rm -rf $APP_FOLDER/NvChad/lua/custom
sudo ln -s $APP_FOLDER/config/nvchad $APP_FOLDER/NvChad/lua/custom

# setup tmux package manager tpm
git clone https://github.com/tmux-plugins/tpm $APP_FOLDER/tpm

# setup tmux configuration
sudo mkdir -p $XDG_CONFIG_HOME/tmux
sudo rm -rf $XDG_CONFIG_HOME/tmux/tmux.conf
sudo ln -s $APP_FOLDER/config/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
