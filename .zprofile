export CLICOLOR=1
export EDITOR=vim
export LESS=eFRX  # Super less mode

export PATH=$HOME/bin:/usr/local/bin:$PATH
# Postgres
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
# PyENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
