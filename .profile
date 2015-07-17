# Add my personal bins
export PATH="$HOME/code/bin:$PATH"

# Apps
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
# Scala
export SCALA_HOME="/usr/local/share/scala"
export PATH="$SCALA_HOME/bin:$PATH"

# Bash aliases
alias ll="ls -al"
alias lh="ls -a"

# Nav aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git aliases
alias g="git "
alias ga="git add "
alias gaa="git add -A; git status"
alias gb="git branch -v --color"
alias gba="git branch -va --color"  # All
alias gc="git commit -m "  # Add a commit message
alias gd="git diff "
alias gdc="git diff --cached"  # Diff staged files
alias gll="git log -p"
alias gllg='git log --color --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias glog="git log --graph --decorate --all"
alias gpom="git push origin master"
alias gr="git checkout -- "  # "Revert" a specific file
alias gs="git status -b"  # Add -s for short form
alias gst="git stash"
alias gsl="git stash list"
alias gsp="git stash pop"

# Vim aliases
alias v="mvim "

# Make aliases
alias m="make "

# Simplified virtual env activator
activenv () { source "$HOME/virtualenvs/$@/bin/activate"; }
alias svba="source venv/bin/activate"


# Silver Searcher aliases
agl () { ag --color --after=4 "$@" | less -SRi; }
ags () { ag --color --after=4 --smart-case "$@" | less -SRi; }
agq () { ag --color --before=2 --after=4 --literal "$@" | less -SRi; }
agm () { ag --color --after=20 --literal "<<<<<<<" | less -SRi; } #Forgotten merge conflicts

# Create a folder and then move into it
mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

