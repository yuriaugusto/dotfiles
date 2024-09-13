source $ZDOTDIR/lib/alias.zsh
source $ZDOTDIR/lib/keybinds.zsh
source $ZDOTDIR/lib/expansions.zsh
source $ZDOTDIR/lib/cursor.zsh
source $ZDOTDIR/lib/completions.zsh
source $ZDOTDIR/lib/history.zsh

# plugins
# get zsh_unplugged
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]
  then git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# plugins list, loaded in order of listing
repos=(
  romkatv/zsh-defer
  zsh-users/zsh-completions
  zdharma-continuum/fast-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
)

# loading plugins
plugin-load $repos

# plugins update
function plugin-update {
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

fpath=($ZDOTDIR/lib/functions $fpath)
autoload -U $ZDOTDIR/lib/functions/*(:t)

declare -U path                             # prevent duplicate entries in path

# prints colors
palette() {
    local -a colors
    for i in {000..255}; do
        colors+=("%F{$i}$i%f")
    done
    print -cP $colors
}
palette2() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# navigation options
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
setopt COMPLETEALIASES
#setopt auto_cd              # Auto changes to a directory without typing cd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt CLOBBER              # turn off warning "file exists" with > and >>
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

eval $(dircolors "$XDG_CONFIG_HOME"/dircolors/dir_colors)
eval $(thefuck --alias fuck)
eval "$(starship init zsh)"
fastfetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source <(fzf --zsh)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yuri/.config/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yuri/.config/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yuri/.config/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yuri/.config/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

