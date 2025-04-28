
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/stoffi05/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

export PATH="$PATH:$HOME/bin"
export ELECTRON_OZONE_PLATFORM_HINT=auto
export GBM_BACKEND=nvidia-drm
export ELECTRON_OZONE_PLATFORM_HINT=x11
export CHROME_ARGS="--no-zygote --no-sandbox --disable-gpu --disable-dev-shm-usage"

eval "$(starship init zsh)"

alias tree='lsd --tree'
alias ls='lsd $1'
alias neofetch='hyfetch'
