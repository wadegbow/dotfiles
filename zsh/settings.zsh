export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="solyaris"
source $ZSH/oh-my-zsh.sh
# move compdump files out of home
autoload -U compinit && compinit -i -d ~/.cache/zsh/zcompdump-$ZSH_VERSION