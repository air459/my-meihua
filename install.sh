#!/bin/bash

SCRIPT_DIR=$(pwd)

echo "开始安装 Fish Shell 美化配置..."

if ! command -v fish &> /dev/null; then
    echo "错误: Fish Shell 未安装，请先安装 Fish Shell"
    exit 1
fi

echo "正在安装 Starship..."
if curl -sS https://starship.rs/install.sh | sh; then
    echo "✅ Starship 安装成功"
else
    echo "❌ Starship 安装失败"
    exit 1
fi

echo "正在安装 fzf..."
if git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all; then
    echo "✅ fzf 安装成功"
else
    echo "❌ fzf 安装失败"
    exit 1
fi

echo "正在配置软连接..."

mkdir -p ~/.config
rm -rf ~/.config/fish

if ln -s "$SCRIPT_DIR/fish" ~/.config/fish; then
    echo "fish配置软连接创建成功"
else
    echo "fish配置软连接创建失败"
    exit 1
fi

if ln -s "$SCRIPT_DIR/vimrc" ~/.vimrc && ln -s "$SCRIPT_DIR/vim" ~/.vim; then 
    echo "vim配置软连接成功"
else
    echo "vim配置软连接失败"
    exit 1
fi
echo "🎉 安装完成！请重启终端或运行 'source ~/.config/fish/config.fish' 来应用配置"
