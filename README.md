# dotfiles

开始前确保家目录下不存在 `.oh-my-zsh` `bin` `scripts` `.tmux` 目录，若存在则提前备份并删除。

```bash
# 安装依赖
sudo apt update
sudo apt install zsh tmux curl wget unzip git

# 安装 ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 克隆 dotfiles
cd ~
git clone git@github.com:haowang02/dotfiles.git

# 执行 setup 脚本
cd dotfiles
bash setup.sh
```

其他配置

```bash
# 安装 iterm2 shell integration
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

# 安装 nvitop
sudo apt update
sudo apt install python3-pip
/usr/bin/pip3 install nvitop

# 安装 LazyVim
rm -r ~/.config/nvim
rm -r ~/.local/share/nvim
rm -r ~/.local/state/nvim
rm -r ~/.cache/nvim
cp -r ~/dotfiles/nvim ~/.config/
```
