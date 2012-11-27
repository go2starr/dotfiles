# Attach to tmux first so bashrc isn't run twice

if [ "$(type tmux 2>/dev/null)" -a -s $TMUX ]; then
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

# Emacs
if [ -e /Applications/Emacs.app/Contents/MacOS/bin/emacsclient ]; then
    alias emacsclient=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
fi
export ALTERNATE_EDITOR=""
alias emacs='emacsclient -t'
alias e=emacs
alias remacs="killall -9 emacs; emacsclient -t"

# Use colors
export TERM="xterm-256color"

# Grepping
alias grep="grep --color"
function grep_recursive {
    grep -r $@
}
function grep_recursive_here {
    grep -r $@ .
}
alias grh=grep_recursive_here
alias gr=grep_recursive
