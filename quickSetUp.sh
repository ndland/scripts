#/usr/bin/sh

echo "Starting the setup..."

cd ~

echo "cloning dotfiles..."
git clone git@github.com:ndland/dotfiles.git
echo "done!"

echo "cloning personalization..."
git clone git@github.com:ndland/personalization.git
echo "done!"

cd dotfiles/

echo "submodule init dotfiles..."
git submodule init
echo "done!"

echo "submodule update dotfiles..."
git submodule update
echo "done!"

echo "making dir ~/.zsh/git-prompt..."
mkdir -p ~/.zsh/git-prompt
echo "done!"

cd ~

cd personalization

echo "submodule init personalization..."
git submodule init
echo "done!"

echo "submodule update personalization..."
git submodule update
echo "done!"

echo "copying gitstatus.py to ~/.zsh/git-prompt..."
cp zsh-git-prompt/gitstatus.py ~/.zsh/git-prompt
echo "done!"

cd ~/dotfiles/

echo "Running moveFilesOnly.sh"
~/scripts/moveFilesOnly.sh
echo "done!"

echo "Sourcing zshrc..."
. ~/.zshrc
echo "All done!"
