#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# AUTHOR Michael Smalley
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
if [ `uname` == 'Darwin' ]; then
  files="gitconfig zlogin vimrc zshrc vim slate"
else
  files="gitconfig zshenv rc.lua zlogin vimrc zshrc vim"
fi

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
    echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    echo "Creating symlink to $file in home directory."
    if [ $file == rc.lua ]; then
      mv ~/$file ~/dotfiles_old/
      mkdir -p ~/.config/awesome
      ln -s $dir/$file ~/.config/awesome
    else
      mv ~/.$file ~/dotfiles_old/
      ln -s $dir/$file ~/.$file
    fi
done

