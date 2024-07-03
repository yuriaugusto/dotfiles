# Execute code in the background to not affect the current session
(
    autoload -U zrecompile

    # Compile zcompdump, if modified, to increase startup speed.
    zcompdump="${ZCACHEDIR:-$HOME}/.zcompdump"
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
        zrecompile -pq "$zcompdump"
    fi
) &!