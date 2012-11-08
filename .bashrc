# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source Facebook definitions
if [ -f ~/.fbrc ]; then
    . ~/.fbrc
fi

# Emacs daemon
function start_emacs() {
    # Try to connect to daemon
    emacsclient -c 2>/dev/null $@

    # Start it otherwise
    if [ $? -ne 0 ]; then
        emacs --daemon
        emacsclient -c $@
    fi
}
alias emacs=start_emacs

# Tmux
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new; exit
else
    export TERM="xterm-256color"
fi

################################################################################
# DO NOT ADD BELOW THIS LINE
################################################################################