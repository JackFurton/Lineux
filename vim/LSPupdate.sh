#!/usr/bin/env bash

# Update vim-plug
echo "Updating vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Update rust-analyzer
echo "Updating rust-analyzer..."
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# Update Python LSPs
echo "Updating Python LSPs..."
pip3 install --upgrade pip
npm update -g pyright
pip3 install --upgrade "python-language-server[all]"

# Update TypeScript/JavaScript LSPs
echo "Updating TypeScript/JavaScript LSPs..."
npm update -g typescript typescript-language-server

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

echo "Update finished. Remember to run ':PlugUpdate' and ':PlugInstall' in Vim to update your plugins."
echo ":LspInstallServer / :LspUninstallServer server-name"
echo "Check nvm github for latest nvm versions"
