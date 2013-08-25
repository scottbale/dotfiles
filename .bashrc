# notes:
# - tab completion for Git branches
# - display the current branch on the prompt
# - show a * if there are unstaged changes, and a + for staged changes
source /usr/local/git/contrib/completion/git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=true

export PS1='[\[\033[01;34m\]\u \w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]]\$'
