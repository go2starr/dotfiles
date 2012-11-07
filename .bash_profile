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
