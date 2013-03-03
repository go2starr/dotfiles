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

if [ -e $HOME/bin/ ]
then
    for dir in $(find $HOME/bin -type d )
    do
        export PATH=$dir:$PATH
    done
fi

