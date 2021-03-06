# Attach to tmux first so bashrc isn't run twice
#if [ "$(type tmux 2>/dev/null)" -a -s $TMUX ]; then
#    tmux attach || tmux new;
#fi
alias ta="tmux attach || tmux new"

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source Facebook definitions
if [ -f ~/.fbrc ]; then
    . ~/.fbrc
fi

# Bash
export HISTSIZE=999999999
export HISTFILESIZE=9999999999

# Java
export PATH=$PATH:$JAVA_HOME/bin/


alias emacs='emacsclient -t'
alias e=emacs
alias remacs="killall -9 emacs;"

export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR=""

# Use colors
export TERM="xterm-256color"

# Grepping
alias grep="grep --color=auto"
alias grepc="grep --color=always"
alias less="less -R"
function grep_recursive {
    grep -r $@
}
function grep_recursive_here {
    grep -r $@ .
}
alias grh=grep_recursive_here
alias gr=grep_recursive

# Finding
function find_grep {
    find . | grep -v \.git | grep $@
}
alias gf=find_grep

# Processes
function ps_grep {
    ps -e | grep $@
}
alias gp=ps_grep

# History
function history_grep {
    history | grep $@
}
alias gh=history_grep

# Combos
function emacs_find_grep {
    emacs $(gf $@)
}
alias egf=emacs_find_grep
