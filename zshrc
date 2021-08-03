# autoload
autoload -Uz compinit && compinit

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

# ssh aliases
if [ -f ~/.ssh/aliases ]; then
	. ~/.ssh/aliases
fi

# operating system specific settings
# Darwin
if [ "$(uname)" = "Darwin" ]; then
    # exports
    export PATH="${HOME}/bin:${HOME}/.composer/vendor/bin:${PATH}:/usr/local/sbin"
    export PATH="/usr/local/opt/php@7.4/bin:$PATH"
    export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
    export COPYFILE_DISABLE=1
    export GREP_OPTIONS="--color=auto"
    export GREP_COLOR="1;31;49"

    # aliases
    alias ls="ls -FG"
    alias df="df -PhT apfs,hfs,afpfs,exfat,fuse4x,msdos,osxfuse,nfs"

    # git prompt
    source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
    PROMPT='%B%F{green}%m%f %F{blue}%~%f%b %# '
    ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[cyan]%}"
    ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{✚%G%}"
fi

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

