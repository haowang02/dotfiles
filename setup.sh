#!/bin/bash

# 检查 zsh
if ! command -v zsh &>/dev/null; then
  echo "错误: zsh 未安装，请运行: sudo apt install zsh"
  exit 1
fi

# 检查 ohmyzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "错误: ohmyzsh 未安装，请运行: sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
  exit 1
fi

# 检查 wget
if ! command -v wget &>/dev/null; then
  echo "错误: wget 未安装，请运行: sudo apt install wget"
  exit 1
fi

# 检查 unzip
if ! command -v unzip &>/dev/null; then
  echo "错误: unzip 未安装，请运行: sudo apt install unzip"
  exit 1
fi

mkdir -p $HOME/bin
cd $HOME/bin/

# 7zip
wget https://7-zip.org/a/7z2500-linux-x64.tar.xz
mkdir 7z2500-linux-x64
tar -xf 7z2500-linux-x64.tar.xz -C 7z2500-linux-x64
ln -s -f 7z2500-linux-x64/7zz
rm 7z2500-linux-x64.tar.xz

# fzf
wget https://github.com/junegunn/fzf/releases/download/v0.64.0/fzf-0.64.0-linux_amd64.tar.gz
mkdir fzf-0.64.0-linux_amd64
tar -xf fzf-0.64.0-linux_amd64.tar.gz -C fzf-0.64.0-linux_amd64
ln -s -f fzf-0.64.0-linux_amd64/fzf
rm fzf-0.64.0-linux_amd64.tar.gz

# ripgrep
wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
tar -xf ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
ln -s -f ripgrep-14.1.1-x86_64-unknown-linux-musl/rg
rm ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz

# fd
wget https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz
tar -xf fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz
ln -s -f fd-v10.2.0-x86_64-unknown-linux-musl/fd
rm fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz

# neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xf nvim-linux-x86_64.tar.gz
ln -s -f nvim-linux-x86_64/bin/nvim
rm -rf nvim-linux-x86_64.tar.gz

# zoxide
wget https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.8/zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz
mkdir zoxide-0.9.8-x86_64-unknown-linux-musl
tar -xf zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz -C zoxide-0.9.8-x86_64-unknown-linux-musl
ln -s -f zoxide-0.9.8-x86_64-unknown-linux-musl/zoxide
rm -rf zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz

# yazi
wget https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip
unzip yazi-x86_64-unknown-linux-musl.zip
ln -s -f yazi-x86_64-unknown-linux-musl/ya
ln -s -f yazi-x86_64-unknown-linux-musl/yazi
rm -rf yazi-x86_64-unknown-linux-musl.zip

# fastfetch
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.48.1/fastfetch-linux-amd64.tar.gz
tar -xf fastfetch-linux-amd64.tar.gz
ln -s -f fastfetch-linux-amd64/usr/bin/fastfetch
rm -rf fastfetch-linux-amd64.tar.gz

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#%EF%B8%8F-installation
git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# https://github.com/gpakosz/.tmux
cd $HOME
git clone --single-branch https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf

backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

# create symlink
cd $HOME
backup .zshrc
backup .zprofile
backup .tmux.conf.local
backup .p10k.zsh
backup .gitconfig
backup .condarc

ln -s -f dotfiles/.zshrc
ln -s -f dotfiles/.zprofile
ln -s -f dotfiles/.tmux.conf.local
ln -s -f dotfiles/.p10k.zsh
ln -s -f dotfiles/.gitconfig
ln -s -f dotfiles/.condarc
ln -s -f dotfiles/scripts
