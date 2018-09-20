export CLICOLOR=1
export EDITOR=vim

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Dev
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Add NPM
export PATH="$HOME/.npm/bin:$PATH"

# Add my bins
export PATH="$HOME/code/bin:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# Read aliases
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Enable git autocomplete
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
