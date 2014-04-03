#/usr/bin/sh

echo "Starting the setup..."

cd ~
mkdir ~/.vimundo

echo "cloning dotfiles..."
git clone git@github.com:ndland/dotfiles.git
echo "done!"

echo "cloning personalization..."
git clone git@github.com:ndland/personalization.git
echo "done!"

cd dotfiles

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

echo "installing curl"
sudo apt-get install curl

echo "installing rvm"
\curl -sSL https://get.rvm.io | bash -s stable

echo "installing ruby 2.0.0"
rvm install 2.0.0

echo "setting ruby 2.0.0 as default"
rvm use --default 2.0.0

echo "Sourcing zshrc..."
source ~/.zshrc
echo "done!"

echo "All done!"
