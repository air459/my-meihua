#!/bin/bash

echo "开始安装 Fish Shell 美化配置..."

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: 该脚本需要以root权限运行，请尝试：sudo $0"
    exit 1
fi

apt update
apt install fish -y
rm -rf my-meihua
git clone https://github.com/air459/my-meihua.git /opt

echo "正在安装 Starship..."
if curl -sS https://starship.rs/install.sh | sh; then
    echo "✅ Starship 安装成功"
else
    echo "❌ Starship 安装失败"
    exit 1
fi

echo "正在安装 fzf..."
if ! command -v fzf &>/dev/null; then
    echo "正在克隆 fzf 仓库..."
    if git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; then
        echo "正在运行安装脚本..."
        if ~/.fzf/install --key-bindings --completion --no-update-rc; then
            echo "✅ fzf 安装成功"
        else
            echo "❌ fzf 安装脚本执行失败"
            exit 1
        fi
    else
        echo "❌ 克隆 fzf 仓库失败"
        exit 1
    fi
else
    echo "✅ fzf 已安装（跳过安装步骤）"
fi

echo "正在配置软连接..."

mkdir -p ~/.config
rm -rf ~/.config/fish

if ln -s "$/opt/my-meihua/fish" ~/.config/fish; then
    echo "fish配置软连接创建成功"
else
    echo "fish配置软连接创建失败"
    exit 1
fi

if ln -s "/opt/my-meihua/vimrc" ~/.vimrc && ln -s "/opt/my-meihua/vim" ~/.vim; then
    echo "vim配置软连接成功"
else
    echo "vim配置软连接失败"
    exit 1
fi
echo "🎉 安装完成！请重启终端或运行 'source ~/.config/fish/config.fish' 来应用配置"
echo "配置文件在/opt/my-meihuai"
echo "建议不要改配置文件名称"
