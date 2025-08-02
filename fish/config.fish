fzf --fish | source
starship init fish | source

set -gx STARSHIP_CONFIG /etc/my-meihua/starship/starship.toml
set -gx STARSHIP_CACHE /etc/my-meihua/starship/log

alias ls=lsd
alias lc=ls
