export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias hi='brew update && brew upgrade'
alias gs='git status'
alias gp='git pull'
alias gd='git diff'
alias sed='gsed'
alias vim='nvim'
alias vi='nvim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
