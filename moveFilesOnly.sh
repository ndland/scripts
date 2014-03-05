#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# AUTHOR Michael Smalley
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
if [ `uname` == 'Darwin' ]; then
  files="i3status.conf config zlogin vimrc zshrc vim slate"
else
  files="i3status.conf config zlogin vimrc zshrc vim"
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
    if [ $file == config ]; then
      mv ~/$file ~/dotfiles_old/
      mkdir -p ~/.i3/
      ln -s $dir/config ~/.i3/
    else
      mv ~/.$file ~/dotfiles_old/
      ln -s $dir/$file ~/.$file
    fi
done

