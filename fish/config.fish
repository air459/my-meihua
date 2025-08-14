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

alias ls=lsd
alias lc=ls

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

function fuck -d "Correct your previous console command"
    set -l fucked_up_command $history[1]
    set -l unfucked_command (env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv)
    if test -n "$unfucked_command"
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge
    end
end

function FUCK -d "Correct your previous console command"
    set -l fucked_up_command $history[1]
    set -l unfucked_command (env TF_SHELL=fish TF_ALIAS=FUCK PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv)
    if test -n "$unfucked_command"
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge
    end
end

# 绑定Ctrl+S添加sudo（因为Ctrl+S通常不被使用）
bind \cs add_sudo
# 设置Starship配置文件路径
set -gx STARSHIP_CONFIG /opt/my-meihua/starship/starship.toml

eval (ssh-agent -c) >> /dev/null 2>&1 &
alias cnpm="npm --registry=https://registry.npmmirror.com  --cache=$HOME/.npm/.cache/cnpm  --disturl=https://npmmirror.com/mirrors/node  --userconfig=$HOME/.cnpmrc"
