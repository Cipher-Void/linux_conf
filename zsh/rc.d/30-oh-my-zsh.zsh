export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"
mkdir -p "$ZSH_CACHE_DIR/completions"

ZSH_THEME="robbyrussell"
plugins=(
    git 
    uv 
    zsh-vi-mode
)

zstyle ':omz:update' mode disabled
source "$ZSH/oh-my-zsh.sh"
