export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git docker kubectl minikube)

source $ZSH/oh-my-zsh.sh

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -p'
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset - %Cblue%an%Creset %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias vim='nvim'

export EDITOR='nvim'
export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/gradle/gradle-7.6/bin
export PATH=$PATH:/opt/maven/maven-3.8.6/bin
export PATH=$PATH:/home/ls/.local/share/nvim/mason/bin

