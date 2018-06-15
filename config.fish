set -x PATH /usr/local/bin /usr/local/sbin $PATH
set -x PATH $HOME/scripts $HOME/bin $PATH
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools

set -x RBENV_VERSION 2.5.1

alias pl   "punch log"
alias plm  "punch log this month"
alias pllm "punch log last month"
alias ply  "punch log yesterday"
alias pi   "punch in"
alias po   "punch out"
alias pc   "punch comment"

alias love "/Applications/love.app/Contents/MacOS/love"