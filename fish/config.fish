fzf --fish | source
starship init fish | source
set -U fish_greeting

function fish_command_not_found
    if type -q /usr/lib/command-not-found
        /usr/lib/command-not-found $argv[1]
    else
        echo "命令 '$argv[1]' 不存在 QwQ"
    end
end

set -gx STARSHIP_CACHE /etc/my-meihua/starship/log
set -gx PATH /opt/q/bin $PATH

# GCC 14.2.0 环境配置
set -gx PATH /usr/local/gcc-14.2.0/bin $PATH
set -gx LD_LIBRARY_PATH /usr/local/gcc-14.2.0/lib64 $LD_LIBRARY_PATH
set -gx CPLUS_INCLUDE_PATH /usr/local/gcc-14.2.0/include/c++/14.2.0 $CPLUS_INCLUDE_PATH


alias ls=lsd
alias lc=ls
alias q="q chat '回复我，请用中文'"

# 绑定ESC键删除命令行
bind \e 'commandline ""'

# 添加sudo到命令行开头的函数
function add_sudo
    set -l cmd (commandline)
    if test -n "$cmd"
        if not string match -q "sudo *" "$cmd"
            commandline -r "sudo $cmd"
        end
    else
        commandline -r "sudo "
    end
end

# 绑定Ctrl+S添加sudo（因为Ctrl+S通常不被使用）
bind \cs add_sudo
# 设置Starship配置文件路径
set -gx STARSHIP_CONFIG /etc/my-meihua/starship/starship.toml
