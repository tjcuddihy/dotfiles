export CLICOLOR=1
export EDITOR=vim

# Create a folder and then move into it
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Dev
source /usr/local/bin/virtualenvwrapper.sh

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# Read aliases
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

