# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# environment variables
export LC_CTYPE=en_US.UTF-8
export PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH
export CLICOLOR=1
export EDITOR=/usr/bin/vim
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export BASH_COMPLETION_DIR=~/.bash_completion.d
export RUBY_HEAP_MIN_SLOTS=250000 RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1 RUBY_GC_MALLOC_LIMIT=50000000
export ANT_OPTS="-Xmx512m -XX:MaxPermSize=256m"
export JAVA_OPTS="-Xmx512m -XX:MaxPermSize=256m"

# handy everyday aliases
alias ll="ls -al"
alias screen="screen -h 1000"
alias rmsvndirs="find . -name .svn -print0 | xargs -0 rm -rf"
alias src="cd /home/kyle/work"
alias ctaggen="ctags -a -e -f TAGS --tag-relative -R app lib vendor"
alias mvim="/Applications/mvim/mvim"

# project aliases
alias blog="cd ~/work/kylebanker.com"
alias rbd="cd ~/work/10gen/ruby-driver"
alias 10g="cd ~/work/10gen"
alias mon="cd ~/work/10gen/mongo"

# produce a diff suitable for Review Board
function rbdiff {
  local branch
  branch=$(git name-rev --name-only head)
  git diff master..HEAD > "/Users/kyle/Desktop/${branch}.diff"
}

# remove a Git branch locally and remotely
function rmgitbranch {
  git branch -D $1
  git push origin :$1
}

# syntax-highlighted less
function pless {
  pygmentize $1 | less -r
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
    . /etc/bash_completion.d/git
fi

# prompt
PS1='[\u@\h \W$]\$ '
PS2="> "

# rvm-install added line:
if [[ -s /Users/kyle/.rvm/scripts/rvm ]] ; then source /Users/kyle/.rvm/scripts/rvm ; fi

