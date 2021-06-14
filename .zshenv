export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

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
