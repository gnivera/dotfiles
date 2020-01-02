#!/bin/sh

DOTFILESPATH=$HOME/dotfiles

if [ ! -d "$DOTFILESPATH" ]; then
  git clone https://github.com/gnivera/dotfiles "$DOTFILESPATH"
else
  echo "$DOTFILESPATH already downloaded. Updating..."
  cd "$DOTFILESPATH"
  git stash
  git checkout master
  git pull origin master
fi

curl -o $HOME/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

cd "$DOTFILESPATH"

for f in .??*; do
  [ "$f" = ".DS_Store" ] && continue
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  ln -snfv "$HOME"/dotfiles/"$f" "$HOME"/"$f"
done

cd $HOME
