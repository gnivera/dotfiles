# environment
export GOPATH=$HOME/go

# git prompt
if [[ -e $HOME/.git-prompt.sh ]]; then
  source $HOME/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUPSTREAM=auto
  PS1='[%n@%m %c$__git_ps1 " (%s)")]\$ '
  precmd() {
    __git_ps1 "%c $" "%s "
  }
fi

# alias
alias ll='ls -lG'
alias g='git'
alias d='docker'
alias j='idea'
alias q='ghq'

# complement
autoload -U compinit
compinit
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
autoload -U colors
colors
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# other
if [[ -e /usr/local/opt/nvm/nvm.sh ]]; then
  export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
fi

function _ssh() {
  compadd $(fgrep 'Host ' ~/.ssh/config | awk '{print $2}' | sort)
}

# checkout git branch
fco() {
  local branches branch
  branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# checkout git branch (including remote branches)
fcor() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
      fzf-tmux -d $((2 + $(wc -l <<<"$branches"))) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

frepo() {
  cd $(ghq root)/$(ghq list | fzf)
}

function share_history() {
  history -a
  history -c
  history -r
}
PROMPT_COMMAND='share_history'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -e $HOME/.zplug/ ]]; then
  source ~/.zplug/init.zsh

  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  zplug "zsh-users/zsh-history-substring-search"

  if ! zplug check --verbose; then
    zplug install
  fi

  zplug load
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
