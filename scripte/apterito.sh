#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y
apt update && apt upgrade -y

apt install -y vim git python3 python3-pip build-essential
sudo apt install -y vim git python3 python3-pip build-essential

sudo apt-get install -y ninja-build gettext cmake unzip curl
apt-get install -y ninja-build gettext cmake unzip curl

sudo apt install -y fzf tmux ripgrep zsh
apt install -y fzf tmux ripgrep zsh

echo "exit" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc

cat <<EOL >> ~/.zshrc
alias gd='git diff'
alias gs='git status'
alias gp='git pull'
alias hi='sudo apt update && sudo apt upgrade -y'
alias vi='nvim'
alias vim='nvim'
alias extend='git config --global credential.helper '\''cache --timeout=28800'\'''
export PATH="\$HOME/binary:\$PATH"
EOL

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

chsh -s $(which zsh)

#tedp!
