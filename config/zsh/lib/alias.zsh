alias sudo='sudo '
alias dnf='dnf5'

# color all the stuff
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias ls='ls --color=auto'

# colors in less (default PAGER in Arch)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# directories
alias dotfiles='cd $HOME/git/dotfiles/'
alias docs='cd $HOME/Documents/'
alias down='cd $HOME/Downloads/'
alias notes='cd $HOME/Documents/ObsidianNotes'

if [ $(command -v bat) ]; then alias cat='bat -P'; fi

alias blackbox="flatpak run com.raggesilver.BlackBox"

# fedora package manager
alias updatefedora='sudo dnf update && flatpak update'
alias logout='gnome-session-quit' 
alias reboot='systemctl reboot -i'

# If eza installed, then use exa for some ls commands
if [ $(command -v eza) ]; then
    alias l='eza -aF --icons' # Quick ls
    alias la='eza -aF --icons' # List all
    alias ll='eza -laF --icons' # Show details
    alias lm='eza -lahr --color-scale --icons -s=modified' # Recent
    alias lb='eza -lahr --color-scale --icons -s=size' # Largest / size
    alias tree='f() { eza -aF --tree -L=${1:-2} --icons };f'
else
    alias l='ls -l'
    alias l.='ls -d .*'
    alias la='ls -A' # List all files/ includes hidden
    alias ll='ls -lAFh' # List all files, with full details
    alias lb='ls -lhSA' # List all files sorted by biggest
    alias lm='ls -tA -1' # List files sorted by last modified
fi

# navigation
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias .....='cd ../../../..;pwd'

# directory stack
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index} > /dev/null"; unset index

# time gain
alias c='clear'

# config to don't fuck up all
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

alias mkdir='mkdir -pv'

alias ping='ping -c 5'

# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1 -nr'
alias psmem10='ps -e -orss=,args= | sort -b -k1 -nr | head -n 10'

# get top process eating cpu if not work try execute : export LC_ALL='C'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1,1n -nr'
alias pscpu10='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1,1n -nr | head -n 10'

# top10 of the history
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# suffix
alias -s {md,markdown,txt}="$EDITOR"
alias -s py='python'

alias nvimd='nvim --noplugin -u NONE' # lancar sem plugins e configuracoes

# Find 10 largest files
alias top10files="find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

# Find 10 largest directories
alias top10dirs="find . -type d -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

# find files in current directory
alias ff="find . -maxdepth 1 -type f"

alias duu='du -sh' # list directory size in current dir

# tmux
alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

# generate password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

#Grab audio only from YouTube
#    Usage: yta-mp3 https://youtube.com/watch?v=???????????
#
# You could also replace youtube-dl with 'yt-dlp' as they both more or
# less use the same arguments.

alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "

#Grab the highest quality of video+audio from YouTube
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg' # update grub

alias myxip='curl icanhazip.com' # get external IP
alias myip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'" # Show laptop's IP addresses
alias hackernews='curl hkkr.in' # get hacker news

#alias restartsound='systemctl --user restart pipewire pipewire-pulse && systemctl --user daemon-reload'
alias reload='source $ZDOTDIR/.zshrc'
alias editzshrc='nvim $ZDOTDIR/.zshrc'
alias editalias='nvim $ZDOTDIR/lib/alias.zsh'
