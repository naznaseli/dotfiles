#!/bin/bash
DOTPATH=~/dotfiles

mkdir ~/dotfiles
git clone --recursive "https://github.com/systas0/dotfiles.git" "$DOTPATH"

cd ~/dotfiles

for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

