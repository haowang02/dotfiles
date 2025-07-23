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

自定义 powerlevel10k 和 tmux status bar 上显示的主机名

```bash
# 编辑 .zprofile
export USER_DEFINED_HOSTNAME=自定义主机名
```

安装 iterm2 shell integration

```bash
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
```

安装 nvitop

```bash
sudo apt update
sudo apt install python3-pip
/usr/bin/pip3 install nvitop
```

安装 LazyVim

```bash
rm -r ~/.config/nvim
rm -r ~/.local/share/nvim
rm -r ~/.local/state/nvim
rm -r ~/.cache/nvim
cp -r ~/dotfiles/nvim ~/.config/
```

pip 换源

```bash
pip config set global.index-url https://mirrors.cqu.edu.cn/pypi/web/simple
```

配置代理

```bash
export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153
```

安装 Miniconda

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/Miniconda3-latest-Linux-x86_64.sh
./miniconda/condabin/conda init zsh
```

配置缓存路径

```bash
export TORCH_HOME="path/to/cache/torch"
export HF_HOME="path/to/cache/huggingface"
export OLLAMA_MODELS="path/to/cache/ollama-models"
```
