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

# To change PATH, add something after : in the next line
export PATH="$PATH:"
