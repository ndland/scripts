#!/usr/bin/env python3

import os

dotfiles_directory = "/Users/nland/dotfiles/"
home_directory = "/Users/nland/"

system = os.uname()[0]

# List out our files that we want to symlink
files_to_symlink = ["ackrc", "gitCommitMessage",
                    "zsh/zshrc", "spacemacs", "gitconfig", "tmux.conf"]

# List out our directories that we want to symlink
directories_to_symlink = ["tmux", "emacs.d"]

os.chdir(home_directory)

for file in files_to_symlink:
    if os.path.isfile("." + file):
        os.unlink(home_directory + "." + file)
    # Figure out a better way to handle these cases
    if "zsh/" in file:
        if os.path.isfile("." + file[4:]):
            os.unlink(home_directory + "." + file[4:])
        os.symlink(dotfiles_directory + file, home_directory + "." + file[4:])
    else:
        os.symlink(dotfiles_directory + file, home_directory + "." + file)

for directory in directories_to_symlink:
    if os.path.isdir("." + directory):
        os.unlink(home_directory + "." + directory)
    os.symlink(dotfiles_directory + directory,
               home_directory + "." + directory)
