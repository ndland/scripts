#!/usr/bin/env python3

import os

dotfiles_directory = "/home/nland/dotfiles/"
home_directory = "/home/nland/"

system = os.uname()[0]

# List out our files that we want to symlink
files_to_symlink = ["ackrc", "gitCommitMessage"]

# List out our directories that we want to symlink
directories_to_symlink = ["tmux"]

os.chdir(home_directory)
print(os.getcwd())

for file in files_to_symlink:
    if os.path.isfile("." + file):
        os.unlink(home_directory + "." + file)
    os.symlink(dotfiles_directory + file, home_directory + "." + file)

for directory in directories_to_symlink:
    if os.path.isdir("." + directory):
        os.unlink(home_directory + "." + directory)
    os.symlink(dotfiles_directory + directory, "/home/nland/." + directory)
