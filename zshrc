# autoload
autoload -Uz compinit && compinit
autoload -U promptinit && promptinit
source "/usr/local/opt/spaceship/spaceship.zsh"

# setopt
setopt autocd
setopt hist_ignore_all_dups
setopt hist_ignore_space

# exports
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export MANPAGER="less -X"
export LESS_TERMCAP_md=$'\E[1;36m'

# aliases
alias l="ls -l"
alias la="ls -la"
alias lla="l -a"
alias lh="l -h"
alias l1="ls -1"
alias nah="git reset --hard; git clean -df"

# ssh aliases
if [ -f ~/.ssh/aliases ]; then
	. ~/.ssh/aliases
fi

# operating system specific settings
# Darwin
if [ "$(uname)" = "Darwin" ]; then
    # exports
    export PATH="${HOME}/bin:${HOME}/.composer/vendor/bin:${PATH}:/usr/local/sbin"
    export COPYFILE_DISABLE=1
    export GREP_OPTIONS="--color=auto"
    export GREP_COLOR="1;31;49"

    # aliases
    alias ls="ls -FG"
    alias df="df -PhT apfs,hfs,afpfs,exfat,fuse4x,msdos,osxfuse,nfs"
fi

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

