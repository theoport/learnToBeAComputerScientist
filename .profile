alias list='tmux list-sessions'
alias tmux='TERM=screen-256color-bce tmux'

start() {
  tmux new -s "$1" 
}

enter() {
  tmux attach -t "$1"
}

finish() {
  tmux kill-session -t "$1"
}

function _completeSSHHosts {

    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"

    completeHosts=$(
        cat ~/.ssh/config | \
        grep -Ee "^Host " | \
        awk '{print $2}' ;
        cat /etc/hosts | \
        grep -Ee "^[0-9]{3}\." | \
        awk '{print $2}'
    )

    COMPREPLY=($(compgen -W "${completeHosts}" -- $cur))
    return 0
}

complete -F _completeSSHHosts ssh

PATH="$PATH:/Users/theoport/bin/go-ethereum-1.7.2/build/bin"
