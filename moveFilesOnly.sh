#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
# AUTHOR Michael Smalley
# UPDATED BY Nicholas Land
############################

########## Variables
dir=~/dotfiles                    # dotfiles directory
zshdir=~/dotfiles/zsh
olddir=~/dotfiles_old             # old dotfiles backup directory
config=~/.config
userBin=~/bin
oldUserBin=~/dotfiles_old/scripts
userScripts=~/code/scripts

# If you're on a mac, otherwise, assume Linux.
if [ `uname` == 'Darwin' ]; then
    files="ideavimrc vrapperrc ackrc tmux.conf gitconfig vimrc gitCommitMessage"
    zshfiles="zshrc"
    directories="emacs.d atom tmux vim"
    scripts="clean_jboss emacs"
else
    files="vrapperrc tmux.conf ackrc xinitrc termconfig gitconfig zshenv
	 rc.lua zlogin vimrc zshrc vim"
fi

# create dotfiles_old in homedir
echo "Creating backups of any existing dotfiles in $olddir"
mkdir -p "$olddir"
mkdir -p "$oldUserBin"
mkdir -p "$config"
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

echo "Changing to $zshdir"
cd $zshdir

for file in $zshfiles; do
  echo "Creating symlink to $zshfiles in home directory"
  ln -s $zshdir/$file ~/.$file > /dev/null 2>&1
done

# Move any existing directories out of homedir to dotfiles_old, and create some
# new symlinks.
for directory in $directories; do
    echo "Moving $directory to ~/dotfiles_old"
    mv ~/.$directory ~/dotfiles_old > /dev/null 2>&1
    echo "Symlinking $directory to your home directory"
    ln -Ffns $dir/$directory/ ~/.$directory > /dev/null 2>&1
done

for script in $scripts; do
    echo "Moving $script to $oldUserBin"
    mv $userBin/$script ~/dotfiles_old/scripts > /dev/null 2>&1
    echo "Symlinking $script to $userBin"
    ln -Ffns $userScripts/$script/ $userBin > /dev/null 2>&1
done

echo "All done!"
