# Docker on QNAP
# export DOCKER_HOST=tcp://192.168.16.30:2376 DOCKER_TLS_VERIFY=1
# DOCKER_API_VERSION=1.23 docker ps

# bash-git-prompt
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
	GIT_PROMPT_THEME=Default
	source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
. <(eksctl completion bash)


# Aliases
alias ll='ls -lrta'

# disk usage 
function duf {
du -sk "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done
}

# Read .bashrc
[[ -r ~/.bashrc ]] && . ~/.bashrc

complete -C '/usr/local/bin/aws_completer' aws
export PATH=/usr/local/bin:/usr/local/sbin::$PATH:/Users/jgallo/Documents/workspace/exercism
#export http_proxy=http://proxy.cpg.org:8080/
#export https_proxy=http://proxy.cpg.org:8080/
