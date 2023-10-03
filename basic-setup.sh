#!/bin/bash

echo "======================================="
echo "Install Basic Packages"
echo "======================================="

sudo apt install -y wget curl git gcc g++ cmake sudo vim ca-certificates gnupg gpg apt-transport-https

echo "======================================="
echo "Install Nodejs"
echo "======================================="

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20   # Change it when nodejs updates or necessary
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt update
sudo apt install nodejs -y

sudo npm install -g pnpm

echo "======================================="
echo "Install Brave"
echo "======================================="
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

echo "======================================="
echo "Install Telegram"
echo "======================================="
sudo add-apt-repository ppa:atareao/telegram
sudo apt update
sudo apt install telegram-desktop

echo "======================================="
echo "Install Rust"
echo "======================================="

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "======================================="
echo "Install VSCode"
echo "======================================="
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code