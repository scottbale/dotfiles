[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -s ~/.bash_prompt ]] && source ~/.bash_prompt

#export PS1="[\w]$ "

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home
export PYTHONPATH="/Users/scottbale/dev/automaton:/Users/scottbale/dev/py"
export PATH="$PATH:/Users/scottbale/dev/automaton/bin:/Users/scottbale/bin"
export AUTOMATON_PATH="/Users/scottbale/dev/automaton"
# PATH=/Users/sbale/bin:/Users/sbale/.cabal/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

# ssh agent: create or reuse existing (if creating, identities will
# have to be manually added via ssh-add)
if [ -f "$HOME/.sshagent" ] ; then
    . "$HOME/.sshagent" > /dev/null
fi

# if no PID value, or process no longer exists...
if [ -z $SSH_AGENT_PID ] || [ "ssh-agent" != $(ps -c -o comm= -p $SSH_AGENT_PID) ]
then
    ssh-agent > "$HOME/.sshagent"
    . "$HOME/.sshagent" > /dev/null
fi
