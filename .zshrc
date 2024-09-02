#  ------------------------------------------------------------
#  According to https://unix.stackexchange.com/q/71253
#  Order of sourcing is:
#  .zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login]
#  There are also system-wide files e.g. /etc/zshrc, /etc/zprofile
#  ------------------------------------------------------------

# BASIC CONFIGURATION
#   ------------------------------------------------------------

source $HOME/.zsh_prompt
source $HOME/.zpath

# fzf
# https://thevaluable.dev/fzf-shell-integration/
# only needed in interactive shell ...?
source <(fzf --zsh)

# Moved here from .zshenv, needs to be ahead of /usr/bin/java in PATH
# eval "$(jenv init -)"
