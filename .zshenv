#  -------------------------------------------------------------
#  According to https://unix.stackexchange.com/q/71253
#  Order of sourcing is:
#  .zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login]
#  There are also system-wide files e.g. /etc/zshrc, /etc/zprofile
#
#  For reasons I don't understand, $PATH is prepended to _after_
#  this file is sourced. So make any $PATH modifications in a
#  new file, ~/.zpath, that is sourced by both ~/.zshrc and
#  ~/.zprofile
#  -------------------------------------------------------------

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
