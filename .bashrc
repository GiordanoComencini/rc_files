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

# Rewrite commit history to change the name of a variable.
# Usage: gitrename [--start <commit>] <old_variable_name> <new_variable_name>
gitrename() {
  local START_COMMIT="HEAD~10"  # Default to HEAD~10
  local OLD_VAR=""
  local NEW_VAR=""

  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --start)
        if [[ -n "$2" ]]; then
          START_COMMIT="$2"
          shift 2
        else
          echo "Error: --start requires a commit START."
          return 1
        fi
        ;;
      *)
        if [[ -z "$OLD_VAR" ]]; then
          OLD_VAR="$1"
        elif [[ -z "$NEW_VAR" ]]; then
          NEW_VAR="$1"
        else
          echo "Error: Too many arguments."
          return 1
        fi
        shift
        ;;
    esac
  done

  # Check required arguments
  if [[ -z "$OLD_VAR" || -z "$NEW_VAR" ]]; then
    echo "Usage: gitrename [--start <commit>] <old_variable_name> <new_variable_name>"
    echo "Default start commit: HEAD~10."
    return 1
  fi

  # Verify inside a Git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: Not a git repository."
    return 1
  fi

  echo "Rewriting history from $START_COMMIT, replacing '$OLD_VAR' with '$NEW_VAR'..."

  git filter-branch --index-filter "
    for file in \$(git diff-tree --no-commit-id --name-only -r \$GIT_COMMIT); do
      if [ -f \"\$file\" ]; then
        sed -r -i \"s/\\<${OLD_VAR}\\>/${NEW_VAR}/g\" \"\$file\"
        git add \"\$file\"
      fi
    done
  " ${START_COMMIT}..HEAD
}

# Store shell history in a file on every command, to avoid losing it
shopt -s histappend
PROMPT_COMMAND='history -a; history -n'
HISTSIZE=100000
HISTFILESIZE=200000
export HISTTIMEFORMAT="%F %T "

# To change PATH, add something after : in the next line
export PATH="$PATH:"
