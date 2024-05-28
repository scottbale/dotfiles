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

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
source $HOME/.zsh_aliases
source $HOME/.nurc
