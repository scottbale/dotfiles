[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -s ~/.bash_prompt ]] && source ~/.bash_prompt

#export PS1="[\w]$ "

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home
export PYTHONPATH="/Users/scottbale/dev/automaton":${PYTHONPATH}
export PATH="$PATH:/Users/scottbale/dev/automaton/bin"
export AUTOMATON_PATH="/Users/scottbale/dev/automaton"
# PATH=/Users/sbale/bin:/Users/sbale/.cabal/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

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
