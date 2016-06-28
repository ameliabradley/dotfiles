# Old terminal, without liquid prompt
#export PS1="\n📂  \w\n😊  \u 💻  \h\$ "

# Enable terminal colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Colony Homes commands
alias cah="cd ~/Source/cahatlas.com/"

# Docker commands
alias dcu="docker-compose up -d"
alias dcs="docker-compose stop"

# Other useful commands
alias ll="ls -la"
alias s="source ~/.bash_profile"

# Add GIT autocompletion in bash
source ~/.git-completion.bash

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
