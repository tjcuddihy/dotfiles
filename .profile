# Add my personal bins
export PATH="$HOME/code/bin:$PATH"
export PATH="$HOME/.npm/bin:$PATH"


# Homebrew? sbin?
export PATH="/usr/local/sbin:$PATH"

# Apps
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# Scala
export SCALA_HOME="/usr/local/share/scala"
export PATH="$SCALA_HOME/bin:$PATH"
export PATH="/usr/local/activator-dist-1.3.5:$PATH"

export LESS=eFRX  # Super less mode

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
alias gaa="git add --all; git status"
alias gap="git add --patch"  # Interactively add hunks
alias gb="git branch -v --color"
alias gba="git branch -va --color"  # All
alias gc="git commit --message "  # Add a commit message
alias gd="git diff "
alias gdn="git --no-pager diff "
alias gdc="git diff --cached"  # Diff staged files
alias gdnc="git --no-pager diff --cached"  # Diff staged files
alias gll="git log -p"  # Log with full diff patch
alias gllg='git log --color --all --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias glog="git log --graph --decorate --all"
alias gpom="git push origin master"
alias gco="git checkout "
alias gs="git status --branch --short"  # Branch info, short form
alias gst="git stash"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gust="git reset HEAD -- "  # Unstage specific file
alias unstage="git reset -q HEAD -- "
alias discard="git checkout -- "

# Vim aliases
alias v="mvim "

# Test Kitchen
alias kc="kitchen converge"
alias kd="kitchen destroy"

# ctags build alias
alias btags="ctags -R --exclude=@$HOME/.ctagsignore --links=no ."

# Simplified virtual env activator
activenv () { source "$HOME/virtualenvs/$@/bin/activate"; }
alias svba="source venv/bin/activate"

# Silver Searcher aliases
alias ag="ag --color --context --smart-case --literal"
agq () { ag "$@" | less -SRi; }
agm () { ag "<<<<<<<" | less -SRi; } # Forgotten merge conflicts

# Create a folder and then move into it
mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

eval "$(rbenv init -)"
