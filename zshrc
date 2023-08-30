source /app/antigen.zsh

alias vim=nvim

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme bira
#antigen theme kphoen

antigen apply
