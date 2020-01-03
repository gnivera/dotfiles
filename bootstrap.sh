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

source .zshrc
source .vimrc

if !(type brew > /dev/null 2>&1); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle -v --global

cd "$CURRENTPATH" || exit
