setopt autocd
setopt cdablevars
setopt pushd_ignore_dups
setopt extended_glob
setopt mark_dirs
setopt nomatch
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_dups
setopt hist_lex_words
setopt hist_no_store
setopt hist_save_no_dups
setopt correct
setopt correct_all
setopt check_jobs
setopt check_running_jobs
setopt prompt_subst
unsetopt inc_append_history
unsetopt share_history
unsetopt inc_append_history_time
#setopt warn_create_global
#setopt warn_nested_var

HISTSIZE=5000
REPORTTIME=10

. /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
typeset -gx ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

. /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

FPATH=/opt/homebrew/share/zsh-completions:/opt/homebrew/Cellar/zsh-async/1.8.5/share/zsh/site-functions:$FPATH
autoload -U colors && colors
autoload -Uz vcs_info
autoload -Uz async && async

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(git):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

PS1="%? %n@%m:%2~ %# "
PS2="%__>"
RPS1="’${vcs_info_msg_0_}’ %T"
RPS2="%^"

autoload -U compinit
if [[ ! -v $TMPPREFIX ]]; then
    typeset -gx TMPPREFIX=/tmp/zsh
fi
compinit -d $TMPPREFIX/zcompdump

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# default to file completion
zstyle ':completion:*' completer _expand _complete _files _correct _approximate

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l="ls -GF"
alias ls="ls -F --color=auto"
alias la="ls -AFG"
alias ll="ls -lFG"
alias llh="ls -lh,FG"
alias lla="ls -laFhG"
alias rmf="rm -rif"
alias rm="rm -i"
alias grep="grep --color=auto"
alias less="less -g -M -s"
alias python="python3"
alias pip="pip3"
