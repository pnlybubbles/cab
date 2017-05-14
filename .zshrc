# http://post.simplie.jp/posts/60

## Basic

setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt ignore_eof
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt magic_equal_subst
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt prompt_subst
setopt pushd_ignore_dups
setopt rm_star_wait
setopt share_history

## fpath

fpath=(/home/.zsh/completion $fpath)

## autoload

autoload -Uz add-zsh-hook
autoload -Uz compinit && compinit -u
autoload -Uz url-quote-magic
autoload -Uz vcs_info
zle -N self-insert url-quote-magic

## env

export XDG_CONFIG_HOME=$HOME/.config
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export EDITOR=nvim
export HISTFILE=~/.zhistory
export HISTSIZE=1000
export SAVEHIST=1000000
export TZ=JST-9

## Keybind

# bindkey -v
# bindkey -v '^?' backward-delete-char
bindkey '^[[Z' reverse-menu-complete
bindkey '^r' anyframe-widget-put-history

## Alias

alias ls="ls -G"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias g="git"
alias gs="git status"
alias ...="cd ../.."
alias ....="cd ../../.."
alias cc="cd +"
alias grep="grep --color"
alias vim="nvim"
alias e="vim"

## Module

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%B≪ %d ≫%f'
zstyle ':completion:*:options' description 'yes'

## Prompt

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b' '%c%u'
zstyle ':vcs_info:git:*' actionformats '%b|%a' '%c%u'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
# zstyle ':vcs_info:bzr:*' use-simple true
BRANCH_ICON=$'\ue725'
LEFT_LINE_TRIANGLE=$'\ue0b3'
_vcs_precmd () {
  vcs_info
  git_status=''
  if [ ! -z ${vcs_info_msg_0_} ]; then
    git_status=${vcs_info_msg_0_}
    if [ ! -z ${vcs_info_msg_1_} ]; then
      git_status='● '${git_status}
    fi
    git_status=${BRANCH_ICON}' '${git_status}
  fi
}
add-zsh-hook precmd _vcs_precmd
PROMPT='%F{197}❯ %f'
RPROMPT=' %F{239}${git_status} ${LEFT_LINE_TRIANGLE} %c%f'

## ssh

## Load

# source /cab/.zsh/incr-0.2.zsh
