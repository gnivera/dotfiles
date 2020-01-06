#!/bin/sh

CURRENTPATH=$(pwd)
DOTPATH=$HOME/dotfiles

if [ ! -d "$DOTPATH" ]; then
  git clone git@github.com:gnivera/dotfiles.git "$DOTPATH"
else
  echo "$DOTPATH already downloaded. Updating..."
  cd "$DOTPATH" || exit
  git stash
  git checkout master
  git pull origin master
fi

curl -o "$HOME"/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

cd "$DOTPATH" || exit

for f in .??*; do
  [ "$f" = ".DS_Store" ] && continue
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".circleci" ] && continue
  ln -snfv "$HOME"/dotfiles/"$f" "$HOME"/"$f"
done

if !(type brew > /dev/null 2>&1); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ -e /usr/local/opt/fzf/install ]]; then
  /usr/local/opt/fzf/install --all
fi


read -n1 -p "Run brew bundle ?(y/N): " yn
if [[ $yn = [yY] ]]; then
  brew bundle -v --global
else
  echo "Skipped brew bundle"
fi

if [[ -e /usr/local/opt/fzf/install ]]; then
  /usr/local/opt/fzf/install --all
fi

if [[ ! -e $HOME/.zplug/ ]]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
else
  echo "$HOME/.zplug' already exist"
fi

cd "$CURRENTPATH" || exit
