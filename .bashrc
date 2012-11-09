# Attach to tmux first so bashrc isn't run twice
if [ -s $TMUX ]; then
    tmux attach || tmux new; exit
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source Facebook definitions
if [ -f ~/.fbrc ]; then
    . ~/.fbrc
fi

# Emacs daemon
export ALTERNATE_EDITOR=""
alias emacs='emacsclient -t'
alias e=emacs
alias remacs="killall -9 emacs; emacsclient -t"

# Use colors
export TERM="xterm-256color"
