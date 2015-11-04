#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
# AUTHOR Michael Smalley
# UPDATED BY Nicholas Land
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
confg=~/.config

# If you're on a mac, otherwise, assume Linux.
if [ `uname` == 'Darwin' ]; then
  files="vrapperrc ackrc tmux.conf gitconfig zlogin vimrc zshrc"
  directories="vim atom tmux"
else
  files="vrapperrc tmux.conf ackrc xinitrc termconfig gitconfig zshenv
         rc.lua zlogin vimrc zshrc vim"
fi

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
mkdir -p $config
echo "...done"
# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks
    echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    echo "Creating symlink to $file in home directory."
    if [ $file == rc.lua ]; then
      mv ~/$file ~/dotfiles_old/ > /dev/null 2>&1
      mkdir -p ~/.config/awesome > /dev/null 2>&1
      ln -s $dir/$file ~/.config/awesome > /dev/null 2>&1
    elif [ $file == termconfig ]; then
      mkdir -p ~/.config/terminator/ > /dev/null 2>&1
      ln -s $dir/$file ~/.config/terminator/config > /dev/null 2>&1
    else
      mv ~/.$file ~/dotfiles_old/ > /dev/null 2>&1
      ln -s $dir/$file ~/.$file > /dev/null 2>&1
    fi
done

# Move any existing directories out of homedir to dotfiles_old, and create some
# new symlinks.
for directory in $directories; do
  echo "Moving $directory to ~/dotfiles_old"
  mv ~/.$directory ~/dotfiles_old > /dev/null 2>&1
  echo "Symlinking $directory to your home directory"
  ln -Ffhins $dir/$directory/ ~/.$directory > /dev/null 2>&1
done

echo "All done!"
