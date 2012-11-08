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

# Tmux
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ] && [ $TERM != "xterm-256color" ]; then
    tmux attach || tmux new; exit
else
    export TERM="xterm-256color"
fi

################################################################################
# DO NOT ADD BELOW THIS LINE
################################################################################