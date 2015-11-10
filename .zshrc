
# space

# basic env
export LANG=ja_JP.UTF-8
#export LANG=en_US.UTF-8
export PATH=$HOME/bin/:$PATH
export less="-iMR"

# local env
## golang
export GOPATH=$HOME/.gopath/
export PATH=$GOPATH/bin/:$PATH

## php
export PATH=$HOME/.composer/vendor/bin:$PATH

## opt
export PATH=/opt/bin:$PATH
export PATH=/opt/mytool:$PATH






# load
zmodload -i zsh/complist
autoload -Uz compinit && compinit

autoload -Uz zed 
autoload -Uz vcs_info
autoload -Uz colors && colors
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook && add-zsh-hook chpwd chpwd_recent_dirs


# alias
alias dpandoc='docker run -t -i -v `pwd`:/workspace greyia/pandoc pandoc  -V documentclass=ltjarticle --latex-engine=lualatex'

alias dpandoc_raw='docker run -t -i -v `pwd`:/workspace greyia/pandoc pandoc'

# ref: https://github.com/docker/docker/issues/8755
function dexec() {
  docker exec -it $1 script -q -c "/bin/bash" /dev/null;
}

# zstyle
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin     /bin$
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
zstyle ':chpwd:*' recent-dirs-max 10000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both


# prompt
PROMPT='
%F{blue}[%n@%m:%~]%f`vcs_echo`
%(?.$.%F{red}$%f) '

# color
alias ls="ls --color=auto"

# bindkey

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey '^R' anyframe-widget-execute-history
bindkey '^E' anyframe-widget-put-history
bindkey '^A' anyframe-widget-cdr
bindkey '^K' anyframe-widget-kill 
bindkey '^T' anyframe-widget-tmux-attach 
bindkey '^O' anyframe-widget-select-widget


# setopt

setopt auto_cd
setopt auto_pushd
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt correct
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt ignore_eof
setopt pushd_ignore_dups
setopt share_history
setopt append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_glob
setopt extended_history
setopt list_packed
setopt prompt_subst
setopt zle
setopt print_exit_value
setopt hist_no_functions
setopt hist_find_no_dups
setopt no_promptcr
setopt inc_append_history
setopt prompt_subst

unsetopt noclobber
unsetopt hist_verify

# setting 

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
LISTMAX=0


# functions


function chpwd() { ls }

function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}


# antigen

if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
source ~/.zsh/antigen/antigen.zsh
  antigen bundle mollifier/anyframe 
  antigen bundle zsh-users/zsh-syntax-highlighting
  #antigen-bundle b4b4r07/enhancd
  antigen apply
fi


