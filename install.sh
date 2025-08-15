#!/bin/bash
file="/opt/my-meihua"

echo "克隆项目"
if git clone https://github.com/air459/my-meihua.git $file;
then 
    echo "克隆成功"
else
    echo "克隆失败"
    exit 1
fi

echo "创建fish软连接"
rm -rf ~/.config/fish
if ln -s $file/fish ~/.config/fish;
then
    echo "fish配置成功"
else
    echo "fish配置失败"
    exit 1
fi

echo "创建vim软连接"
rm -rf ~/.vimrc ~/.vim
if ln -s $file/vim/vimrc ~/.vimrc;
then
    echo "vim配置1成功"
else
    echo "vim配置1失败"
    exit 1
fi

if ln -s $file/vim/vim ~/.vim;
then
    echo "vim配置2成功"
else
    echo "vim配置2失败"
    exit 1
fi

echo "安装starship"
if curl -sS https://starship.rs/install.sh | sh;
then
    echo "安装成功"
else
    echo "安装失败"
    exit 1
fi
