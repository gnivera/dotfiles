#!/bin/sh

for f in .??*
do
    [ "$f" = ".DS_Store" ] && continue
    [ "$f" = ".git" ] && continue

    ln -snfv "$HOME"/dotfiles/"$f" "$HOME"/"$f"
done
