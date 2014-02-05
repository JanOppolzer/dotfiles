# variables
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HISTCONTROL=ignorespace:ignoredups
export PS1="\[\033[01;32m\]\h\[\033[01;34m\] \w \$\[\033[00m\] "
export PATH="/opt/local/bin:/opt/local/sbin:$PATH:$HOME/bin"
export PAGER="vimpager"
export EDITOR="vim"

# aliases
alias ls="ls -FG"
alias l="ls -l"
alias la="ls -a"
alias lla="l -a"
alias lh="l -h"
alias less="$PAGER"
alias zless="$PAGER"
alias df="df -PhT hfs,exfat,fuse4x"

# ssh aliases
if [ -f ~/.ssh/aliases ]; then
	. ~/.ssh/aliases
fi

# bash-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

# functions
mkcd() { mkdir -p "$@" && cd $_; }

