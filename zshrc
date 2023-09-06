alias vim=nvim
alias yr="yay -Rcns"
alias ys="yay -S"
alias yq="yay -Ss"
alias yy="yay -Sy"
alias yu="yay -Su"

source /app/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme bira
#antigen theme kphoen

antigen apply

[ -z "$TMUX" ] && { tmux attach &> /dev/null || exec tmux new-session && exit;}
