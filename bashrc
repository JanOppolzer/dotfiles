# variables
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export HISTCONTROL=ignorespace:ignoredups
export EDITOR="vim"
export MANPAGER="less -X"
export LESS_TERMCAP_md=$'\E[1;36m'

# aliases
alias l="ls -l"
alias la="ls -a"
alias lla="l -a"
alias lh="l -h"
alias l1="ls -1"
alias ip="ip -c"

# ssh aliases
if [ -f ~/.ssh/aliases ]; then
	. ~/.ssh/aliases
fi

# functions
mkcd() { mkdir -p "$@" && cd "$_"; }

# set TERM for tmux
if [ "$TERM" == "screen" ]; then
    export TERM=screen-256color
fi

# operating system specific settings
# Darwin
if [ "$(uname)" == "Darwin" ]; then
    # variables
    export PATH="$PATH:$HOME/bin"
    export COPYFILE_DISABLE=1
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    export GREP_OPTIONS="--color=auto"
    export GREP_COLOR="1;31;49"

    # aliases
    alias ls="ls -FG"
    alias df="df -PhT apfs,hfs,afpfs,exfat,fuse4x,msdos,osxfuse,nfs"

    # bash-completion
    export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
    if [ -r /usr/local/etc/profile.d/bash_completion.sh ]; then
        . /usr/local/etc/profile.d/bash_completion.sh
    fi

    # mc wrapper for exiting to the latest PWD
    if [ -f /opt/local/libexec/mc/mc.sh ]; then
        . /opt/local/libexec/mc/mc.sh
    fi

    # Git prompt
    if [ -f /opt/local/share/git/git-prompt.sh ]; then
        . /opt/local/share/git/git-prompt.sh
        export GIT_PS1_SHOWDIRTYSTATE=1
        export GIT_PS1_SHOWSTASHSTATE=1
        export GIT_PS1_SHOWUNTRACKEDFILES=1
        export GIT_PS1_SHOWUPSTREAM="auto verbose"
    fi

    # virtualenvwrapper
    if [ -f /opt/local/bin/virtualenvwrapper.sh-2.7 ]; then
        export WORKON_HOME=$HOME/.virtualenvs
        . /opt/local/bin/virtualenvwrapper.sh-2.7
    fi

# Linux
elif [ "$(uname)" == "Linux"  ]; then
    # ssh-agent
    #if [ -f ~/bin/sshagent.sh ]; then
    #    . ~/bin/sshagent.sh
    #fi

    # variables
    export PATH="$PATH:$HOME/bin"
    export PAGER="vimpager"
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

    # aliases
    alias ls="ls --color=auto"
    alias less="$PAGER"
    alias cal="cal -m"
    alias df="df -h -t ext2 -t ext3 -t ext4 -t btrfs -t fuseblk -t fuse.sshfs -t fuse.encfs"

    # bash-completion
    # Gentoo doesn't need that anymore?
    #if [ -f /etc/profile.d/bash-completion.sh ]; then
    #    . /etc/profile.d/bash-completion.sh
    #fi

    # mc wrapper for exiting to the latest PWD
    if [ -f /usr/libexec/mc/mc.sh ]; then
        . /usr/libexec/mc/mc.sh
    fi

    # Git prompt
    if [ -f /usr/share/git/git-prompt.sh ]; then
        . /usr/share/git/git-prompt.sh
        export GIT_PS1_SHOWDIRTYSTATE=1
        export GIT_PS1_SHOWSTASHSTATE=1
        export GIT_PS1_SHOWUNTRACKEDFILES=1
        export GIT_PS1_SHOWUPSTREAM="auto verbose"
    fi

    # virtualenvwrapper
    if [ -f /usr/bin/virtualenvwrapper.sh ]; then
        export WORKON_HOME=$HOME/.virtualenvs
        source /usr/bin/virtualenvwrapper.sh
    fi

# FreeBSD
elif [ "$(uname)" == "FreeBSD" ]; then
    # variables
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

    # aliases
    alias ls="ls -G"
    alias df="df -ht ufs"
    alias top="top -PCs1"

    # bash-completion
    if [ -f /usr/local/share/bash-completion/bash_completion.sh ]; then
        . /usr/local/share/bash-completion/bash_completion.sh
    fi

# OpenBSD
elif [ "$(uname)" == "OpenBSD" ]; then
    # variables
    export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

    # aliases
    alias ls="colorls -G"

fi

# host specific settings
#if [ "$(hostname -s)" == "snotra" ]; then
#    export MPD_HOST="$HOME/.mpd/socket"
#fi

# user specific prompt
if [ "$(id -u)" == "0" ]; then
    export PS1="\[\033[0;31m\]\H\[\033[0;34m\] \w (\j) \$\[\033[00m\] "
else
    export PS1="\[\033[0;32m\]\h\[\033[0;34m\] \w (\j) \$\[\033[00m\] "
fi

if [ -v GIT_PS1_SHOWDIRTYSTATE ]; then
    export PS1='\[\033[0;32m\]\h\[\033[0;34m\] \w (\j)$(__git_ps1 " \[\033[0;36m\](%s)\[\033[0;34m\]") \$\[\033[00m\] '
fi

