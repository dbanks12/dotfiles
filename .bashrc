# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

if [ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
  . /usr/share/git-core/contrib/completion/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWUPSTREAM="auto"
  PROMPT_COMMAND='__git_ps1 "\u:\w" "\\\$ "'
fi

alias egs="env | sort | grep -e OCPI -e XILINXD -e LD_LIBRARY -e LM_LICENSE"

alias la="ls -a"
alias lla="ls -la"
alias ll="ls -l"
alias cl="clear; ls -l"

alias du0="du -h . --max-depth 0"
alias du1="du -h . --max-depth 1"

export LESS="-eFXR"
export LESSOPEN="||/usr/bin/lesspipe.sh %s"
export PAGER="less -eFXR"

set -o vi
bind -m vi-command ".":yank-last-arg

alias v="nvim"
alias vim="nvim"
alias vi="vim"

function cpbak() { cp $1 $1.bak; }
function cprev() { cp $1.bak $1; }

alias vbrc="vim    ~/.bashrc"
alias sbrc="source ~/.bashrc"

# Decimal to Hex
function d2h() { python3 -c "print(hex($1))"; }
# Hex to Decimal
function h2d() { python3 -c "print(int(\"$1\", 16))"; }

# Python Math
function pymath() { python3 -c "print(str($1))"; }

alias mc="make clean"
alias mk="make"
alias ms="make sim"
alias mck="make clean && make"
alias mcs="make clean && make sim"
alias lips="less ip_simulate.log"
alias lipc="less ip_create.log"
alias vx="vivado *xpr &"
alias dtcc="dtc -I dts -O dtb"
alias dtcd="dtc -I dtb -O dts"

if [ -e ~/.bashrc_dev ]; then
    source ~/.bashrc_dev
fi

export PATH=$PATH:~/diff-so-fancy
