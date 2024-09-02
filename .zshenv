#  ------------------------------------------------------------
#  According to https://unix.stackexchange.com/q/71253
#  Order of sourcing is:
#  .zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login]
#  There are also system-wide files e.g. /etc/zshrc, /etc/zprofile
#  ------------------------------------------------------------


export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
# Moved to .zshrc, needs to be ahead of /usr/bin/java in PATH
# eval "$(jenv init -)"
source $HOME/.zsh_aliases
source $HOME/.nurc

# ssh agent: create or reuse existing (if creating, identities will
# have to be manually added via ssh-add)
if [ -f "$HOME/.sshagent" ] ; then
    . "$HOME/.sshagent" > /dev/null
fi

# if no PID value, or process no longer exists...
if [ -z $SSH_AGENT_PID ] || [ "$(ps -c -o comm= -p $SSH_AGENT_PID)" != "ssh-agent" ]
then
    ssh-agent > "$HOME/.sshagent"
    . "$HOME/.sshagent" > /dev/null
fi

# fzf
# https://thevaluable.dev/fzf-shell-integration/
source <(fzf --zsh)
