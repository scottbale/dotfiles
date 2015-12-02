# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$HOME/.cabal/bin:$PATH"
fi

export NODE_PATH="/usr/local/lib/node_modules"
export EDITOR="zile"
export JDK_HOME="/usr/lib/jvm/java-7-openjdk-amd64"

# ssh agent: create or reuse existing (if creating, identities will
# have to be manually added via ssh-add)
if [ -f "$HOME/.sshagent" ] ; then
    . "$HOME/.sshagent"
fi

# if no PID value, or process no longer exists...
if ! $(ps -p "$SSH_AGENT_PID" > /dev/null 2>&1)
then
    ssh-agent > "$HOME/.sshagent"
    . "$HOME/.sshagent"
fi
