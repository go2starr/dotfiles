################################################################################
# Bash
################################################################################
function in_east_coast() {
    hostname | grep ash >/dev/null
}

export PATH=$PATH:$JAVA_HOME/bin/

export EDITOR=emacs

# History
export HISTFILESIZE=1000000000
export HISTSIZE=1000000

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

if ! in_east_coast
then
    export PATH=/usr/local/bin/:$PATH
    [ -e /usr/local/bin ] && export PATH=/usr/local/bin/:$PATH
    if [ -e $HOME/bin/ ]
    then
        for dir in $(find $HOME/bin -type d )
        do
            export PATH=$dir:$PATH
        done

        if [[ $- == *i* ]]
        then
            interactive_mode
        fi
    fi
else
    [ -f ~/.ecrc ] && . ~/.ecrc
fi
