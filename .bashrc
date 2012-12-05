# Attach to tmux first so bashrc isn't run twice
if [ "$(type tmux 2>/dev/null)" -a -s $TMUX ]; then
    tmux attach -d || tmux new;
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source Facebook definitions
if [ -f ~/.fbrc ]; then
    . ~/.fbrc
fi

# Bash
export HISTSIZE=
export HISTFILESIZE=

# Emacs
emacsclient --version | grep 24 >/dev/null ||
echo Upgrade emacs you hobo! Or dont, maybe it will work.

export ALTERNATE_EDITOR=""
alias emacs='emacsclient -t'
alias e=emacs
alias remacs="killall -9 emacs;"

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
