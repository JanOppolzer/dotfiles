# variables
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HISTCONTROL=ignorespace:ignoredups
export EDITOR="vim"

# aliases
alias l="ls -l"
alias la="ls -a"
alias lla="l -a"
alias lh="l -h"

# ssh aliases
if [ -f ~/.ssh/aliases ]; then
	. ~/.ssh/aliases
fi

# functions
mkcd() { mkdir -p "$@" && cd $_; }

# operating system specific settings
# Darwin
if [ "$(uname)" == "Darwin" ]; then
    # variables
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH:$HOME/bin"
    export PAGER="vimpager"

    # aliases
    alias ls="ls -FG"
    alias df="df -PhT hfs,exfat,fuse4x"
    alias less="$PAGER"
    alias zless="$PAGER"

    # bash-completion
    if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
        . /opt/local/etc/profile.d/bash_completion.sh
    fi

# Linux
elif [ "$(uname)" == "Linux"  ]; then
    # variables
    export PATH="$PATH:$HOME/bin"

    # aliases
    alias ls="ls --color=auto"

# OpenBSD
elif [ "$(uname)" == "OpenBSD" ]; then
    # aliases
    alias ls="colorls -G"

fi

# user specific prompt
if [ "$(id -u)" == "0" ]; then
    export PS1="\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] "
else
    export PS1="\[\033[01;32m\]\h\[\033[01;34m\] \w \$\[\033[00m\] "
fi

