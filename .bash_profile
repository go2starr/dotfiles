################################################################################
# Bash
################################################################################
# Path
[ -e /usr/local/bin ] && export PATH=/usr/local/bin/:$PATH
if [ -e $HOME/bin/ ]
then
    for dir in $(find $HOME/bin -type d )
    do
        export PATH=$dir:$PATH
    done
fi

export EDITOR=emacs

# History
unset HISTFILESIZE
shopt -s histappend		# Append to history
shopt -s histverify		# Preview history when doing !540:1 type history

# Globbing
shopt -s nocaseglob		# Case insensitive globbing

# Autocompletion (TODO)
# complete <opts>

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
