# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$HOME/.cabal/bin:$PATH"
fi


export NODE_PATH="/usr/local/lib/node_modules"
export EDITOR="zile"
export JDK_HOME="/usr/lib/jvm/java-7-openjdk-amd64"

export PATH

# ssh agent: create or reuse existing (if creating, identities will
# have to be manually added via ssh-add)
if [ -f "$HOME/.sshagent" ] ; then
    . "$HOME/.sshagent" 
fi

# if no PID value, or process no longer exists...
if [ -z $SSH_AGENT_PID ] || [ "ssh-agent" != $(ps c o comm= -p $SSH_AGENT_PID) ]
then
    ssh-agent > "$HOME/.sshagent"
    . "$HOME/.sshagent" 
fi
