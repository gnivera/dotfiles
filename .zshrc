#      ___           ___           ___           ___           ___
#    /\__\         /\__\         /\  \         /\  \         /\__\
#    /::|  |       /:/ _/_        \:\  \       /::\  \       /:/  /
#   /:/:|  |      /:/ /\  \        \:\  \     /:/\:\__\     /:/  /
#  /:/|:|  |__   /:/ /::\  \   ___ /::\  \   /:/ /:/  /    /:/  /  ___
# /:/ |:| /\__\ /:/_/:/\:\__\ /\  /:/\:\__\ /:/_/:/__/___ /:/__/  /\__\
# \/__|:|/:/  / \:\/:/ /:/  / \:\/:/  \/__/ \:\/:::::/  / \:\  \ /:/  /
#     |:/:/  /   \::/ /:/  /   \::/__/       \::/~~/~~~~   \:\  /:/  /
#     |::/  /     \/_/:/  /     \:\  \        \:\~~\        \:\/:/  /
#     |:/  /        /:/  /       \:\__\        \:\__\        \::/  /
#     |/__/         \/__/         \/__/         \/__/         \/__/
#

# environment
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# git prompt 
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
PS1='[%n@%m %c$__git_ps1 " (%s)")]\$ '
precmd () { __git_ps1  "%c $" "%s " }

# alias
alias ll='ls -lG'
alias q='ghq'
alias g='git'
alias d='docker'
alias j='idea'
alias v='vagrant'
alias dcom='docker-compose'
alias mx='tmuxinator'

# complement
autoload -U compinit; compinit
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
compinit
zstyle ':completion:*:default' menu select=1

# history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups
setopt share_history

# prompt
#PROMPT='%c $ '
autoload -U colors; colors
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# other
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

function _ssh {
  compadd `fgrep 'Host ' ~/.ssh/config | awk '{print $2}' | sort`;
}

