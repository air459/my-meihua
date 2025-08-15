# Fish Shell 美化配置

一个自由定制的 Fish Shell 美化配置项目，让你的终端更加美观和高效。

## 🐟 项目简介

本项目提供了一套完整的 Fish Shell 美化方案，包括：
- 精美的提示符主题
- 实用的插件配置
- 自定义函数和别名
- 颜色主题优化

## 📋 功能特性

- ✨ 美观的提示符显示
- 🎨 丰富的颜色主题
- ⚡ 快速的命令补全
- 🔧 实用的自定义函数
- 📁 智能的目录导航
- 🔍 增强的历史记录搜索

## 🚀 快速开始

### 安装要求

- Fish Shell 3.0+
- Git

### 安装步骤

1. 运行
```bash
sudo apt install fish lsd fzf vim curl git -y
curl -s https://raw.githubusercontent.com/air459/my-meihua/main/install.sh | bash
```

2. 重启 Fish Shell 或重新加载配置
```fish
source ~/.config/fish/config.fish
```

## 📁 项目结构

```
my-meihua/
├── README.md           # 项目说明文档
├── install.sh          # 安装脚本
├── deploy.txt          # 提交日志
├── .gitignore          # Git 忽略文件配置
├── fish/               # Fish Shell 配置目录
│   ├── config.fish     # Fish 主配置文件
│   ├── fish_variables  # Fish 变量配置
│   ├── fish_plugins    # Fish 插件列表
│   ├── functions/      # 自定义函数目录
│   ├── completions/    # 命令补全配置
│   ├── conf.d/         # 配置片段目录
│   └── themes/         # Fish 主题配置
├── starship/           # Starship 提示符配置
│   ├── starship.toml   # Starship 配置文件
│   └── log/            # 日志目录
└── vim/                # Vim 编辑器配置
    ├── vimrc           # Vim 配置文件
    └── plugin/         # Vim 插件目录
```

## ⚙️ 配置说明

### 主题配置
在 `starship/` 目录下可以找到shell提示符主题配置文件。

## 🎨 自定义

你可以根据个人喜好修改：
- 提示符样式
- 颜色方案
- 快捷键绑定
- 自定义函数

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目！

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 📞 联系方式

如有问题或建议，请通过以下方式联系：
- 提交 GitHub Issue
- 发送邮件至 f@kongqi-air.top

---

让你的终端更加美丽和高效！🌟
