alias ll="ls -latrh"
alias python="python3"

# Lazier version of find (e.g.: 'find Giovanni' instead of 'find . -name "Giovanni"')
find() {
    if [ $# -eq 1 ]; then
        command find . -name "$1"
    else
        command find "$@"
    fi
}

# Store shell history in a file on every command, to avoid losing it
shopt -s histappend
PROMPT_COMMAND='history -a; history -n'
HISTSIZE=100000
HISTFILESIZE=200000
export HISTTIMEFORMAT="%F %T "

# To change PATH, add something after : in the next line
export PATH="$PATH:"
