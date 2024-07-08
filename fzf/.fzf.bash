# Setup fzf
# ---------
if [[ ! "$PATH" == */home/yuri/git/dotfiles/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/yuri/git/dotfiles/.fzf/bin"
fi

eval "$(fzf --bash)"
