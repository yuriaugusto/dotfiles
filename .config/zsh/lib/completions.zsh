# Options related with completions
# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt EXTENDED_GLOB         # Enabled extended globbing / needed for file modification glob modifiers with compinit
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
unsetopt FLOW_CONTROL     # disable start/stop characters in shell editor
unsetopt CASE_GLOB        # makes globbing (filename generation) case-sensitive
setopt AUTO_MENU            # show completion menu on a successive tab press
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END        # move cursor to the end of a completed word
setopt AUTO_PARAM_SLASH     # if completed parameter is a directory, add a trailing slash
setopt PATH_DIRS            # perform path search even on command names with slashes
setopt GLOBDOTS             # files beginning with a . be matched without explicitly specifying the dot


# Zstyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

zle -C alias-expension complete-word _generic
bindkey '^Xa' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias

# Use cache for commands which use it

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

zstyle ':completion:*' file-sort modification

# Enable $LS_COLORS for directories in completion menu.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 

# Enable completion menu of ./ and ../ special directories.
zstyle ':completion:*' special-dirs true 

# ignores unavailable commands
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'

# completion element sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# ignore multiple entries
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Configure completion of 'kill' command.
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Configure completion of 'man' command.
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*:manuals' separate-sections yes
zstyle ':completion:*:manuals.*' insert-sections yes

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# Matches and grouping in completion menu
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Enable case insensitive completion.
zstyle ':completion:*' menu select # Enable highlighting in menu.
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description yes
zstyle ':completion:*:matches' group yes # Separate matches in menu into groups.
zstyle ':completion:*' group-name '' # Required for completion to be in good groups (named after the tags)
# Format group matches in completion menu.
#zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f' # Comment when using fzf-tab plugin. More info: https://github.com/Aloxaf/fzf-tab/issues/43
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:*:*:*:corrections' format '%F{green}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' verbose yes

# fuzzy match mistyped completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*' keep-prefix true

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Initialize and optimize completion
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
