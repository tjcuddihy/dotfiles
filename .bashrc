# Bash aliases
alias ls="ls -a"
alias ll="ls -al"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Git aliases

alias gaa="git add -A; git status"
alias gb="git branch -v --color"
alias gba="git branch -va --color"  # All
alias gc="git commit -m "  # Add a commit message
alias gd="git diff "
alias gdc="git diff --cached"  # Diff staged files
alias glog="git log --graph --decorate --all"
alias gpom="git push origin master"
alias gr="git checkout -- "  # Revert a specific file
alias gs="git status -b"  # Add -s for short form

# Vim aliases
alias v="mvim "

