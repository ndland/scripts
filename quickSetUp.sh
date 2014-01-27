#/usr/bin/sh

echo "Starting the setup..."

cd ~

echo "cloning dotfiles..."
git clone git@github.com:ndland/dotfiles.git
wait
echo "done!"

wait

echo "cloning personalization..."
git clone git@github.com:ndland/personalization.git
wait
echo "done!"

cd dotfiles/

echo "submodule init dotfiles..."
git submodule init
wait
echo "done!"

echo "submodule update dotfiles..."
git submodule update
wait
echo "done!"

echo "making dir ~/.zsh/git-prompt..."
mkdir -p ~/.zsh/git-prompt
wait
echo "done!"

cd ~

cd personalization

echo "submodule init personalization..."
git submodule init
wait
echo "done!"

echo "submodule update personalization..."
git submodule update
wait
echo "done!"

echo "copying gitstatus.py to ~/.zsh/git-prompt..."
cp zsh-git-prompt/gitstatus.py ~/.zsh/git-prompt
wait
echo "done!"

cd ~/dotfiles/

echo "Running moveFilesOnly.sh"
~/scripts/moveFilesOnly.sh
wait
echo "done!"

echo "Sourcing zshrc..."
source ~/.zshrc
wait
echo "done!"

echo "installing rvm"
\curl -sSL https://get.rvm.io | bash -s stable

wait

echo "All done!"
