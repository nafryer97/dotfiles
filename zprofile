# add color to man pages
typeset -gx MANROFFOPT='-c'
typeset -gx LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
typeset -gx LESS_TERMCAP_md=$(tput bold; tput setaf 6)
typeset -gx LESS_TERMCAP_me=$(tput sgr0)
typeset -gx LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
typeset -gx LESS_TERMCAP_se=$(tput rmso; tput sgr0)
typeset -gx LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
typeset -gx LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
typeset -gx LESS_TERMCAP_mr=$(tput rev)
typeset -gx LESS_TERMCAP_mh=$(tput dim)

typeset -gx XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
typeset -gx XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
typeset -gx XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
typeset -gx XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}

typeset -gx XDG_DESKTOP_DIR=${XDG_DESKTOP_DIR:-$HOME/Desktop}
typeset -gx XDG_DOCUMENTS_DIR=${XDG_DOCUMENTS_DIR:-$HOME/Documents}
typeset -gx XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:-$HOME/Downloads}
typeset -gx XDG_MUSIC_DIR=${XDG_MUSIC_DIR:-$HOME/Music}
typeset -gx XDG_PICTURES_DIR=${XDG_PICTURES_DIR:-$HOME/Pictures}
typeset -gx XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-$HOME/Videos}
typeset -gx XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}

typeset -gx CLICOLOR=1

typeset -gx SHELL_SESSIONS_DISABLE=1

typeset -gx ZDOTDIR=$HOME/.config/zsh
typeset -gx ZLE_RPROMPT_INDEX=1
typeset -U PATH path fpath

eval "$(/opt/homebrew/bin/brew shellenv)"
eval $(thefuck --alias)

PATH=$HOME/bin:$PATH
