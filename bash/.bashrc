# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# shell prompt
PROMPT_COMMAND=my_prompt
my_prompt() {
    local stat=$?
    local red='\[\033[01;31m\]'
    local cya='\[\033[01;36m\]'
    local gre='\[\033[01;32m\]'
    local end='\[\033[00m\]'
    local tty="[$(tty|cut -d/ -f4)]"
    local pw=$(echo -n [$PWD])
    [ $stat = 0 ] && color=$cya || color=$red
    local dir=$color'[\w]'$end
    local git=$gre$(__git_ps1 '(%s)')$end
    local sym='\$'
    PS1="${dir}${git}${sym} "
    echo -en "\033]0;${tty}${pw}\a"
}

# aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# exports
[ -f ~/.bash_exports ] && . ~/.bash_exports

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
