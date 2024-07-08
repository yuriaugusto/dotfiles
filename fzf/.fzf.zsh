# Setup fzf
# ---------
if [[ ! "$PATH" == *$DOTFILES/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$DOTFILES/.fzf/bin"
fi

source <(fzf --zsh)
