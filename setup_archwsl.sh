#! /bin/sh
#
# setup_archwsl.sh
#

echo "copying bash configs..."
cp cfg/.bashrc ~/.bashrc
cp cfg/.bash_profile ~/.bash_profile
echo "done"

echo "updating system..."
sudo pacman -Syuq --noconfirm
echo "done"

echo "installing utilities..."
sudo pacman -Sq --noconfirm curl jq ripgrep fd fx tree zip unzip which wget fzf vim make
curl -s https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim > ~/.vim/autoload/onedark.vim
curl -s https://raw.githubusercontent.com/joshdick/onedark.vim/main/colors/onedark.vim > ~/.vim/colors/onedark.vim
echo "done"

echo "installing oh my posh..."
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
cp cfg/.omp.json ~/.omp.json
echo "done"

# refresh shell
source ~/.bashrc

echo "installing python and python tools..."
sudo pacman -Sq --noconfirm python python-pip python-pipx
pipx install poetry httpie
echo "done"

echo "installing node and node tools..."
sudo pacman -Sq --noconfirm nodejs npm
sudo npm install -g typescript prettier sass heroku http-server
echo "done"

echo "installing c/c++ tools..."
sudo pacman -Sq --noconfirm gcc
echo "done"

echo "installing other tools..."
sudo pacman -Sq --noconfirm github-cli git-lfs
echo "done"

echo "copying gitconfig"
cp cfg/.gitconfig ~/.gitconfig
echo "done"

source ~/.bashrc

echo "finished setup_archwsl.sh"
