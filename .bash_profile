################################################################################
# Bash
################################################################################
# Path
[ -e /usr/local/bin ] && export PATH=/usr/local/bin/:$PATH

export EDITOR=emacs

# History
unset HISTFILESIZE
shopt -s histappend		# Append to history
shopt -s histverify		# Preview history when doing !540:1 type history

# Globbing
shopt -s nocaseglob		# Case insensitive globbing

# Autocompletion (TODO)
# complete <opts>

# Emacs
alias emacs='emacsclient -t'
alias e=emacs
alias remacs="killall -9 emacs;"

export EDITOR=emacs
export ALTERNATE_EDITOR=""

# Tmux
alias ta="tmux attach || tmux new"

# Use colors
export TERM="xterm-256color"

# Grepping
alias grep="grep --color=auto"
alias grepc="grep --color=always"
alias less="less -R"
function grep_recursive_here {
    grep -r $@ .
}
alias grh=grep_recursive_here

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

# Interactive mode
function interactive_mode() {
    if [ -f ~/.bashrc ]; then
 	. ~/.bashrc
    fi
}

# Interactive mode
if [[ $- == *i* ]]
then
    interactive_mode
fi
