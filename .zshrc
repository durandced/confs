## Modified by Cedric Durand
## Login   <durand_c@epita.fr>
##
## Based on Charles Vu
## Login   <vu_c@epita.fr>
##
## Based on Pierre Brunetti
## Login   <brunet_p@epita.fr>
##
## Based on .zshrc by Faouzi Jaouan
## Login   <jaouan_f@epita.fr>


export PATH="${HOME}/bin:/sbin/:$PATH"

############################################################
#                        HISTORY                           #
############################################################
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.history

############################################################
#                      MISC / PERSO                        #
############################################################
export EDITOR='emacs'
export LOGCHECK='60'
export MAILCHECK=0
export PAGER='most'
export WATCH='all'
export SHELL='/bin/zsh'
export TERM='xterm-256color'
export LTERM='lxterminal'
export SVN_EDITOR='emacs -nw'
autoload -U tetris
zle -N tetris
xset b off &> /dev/null
xset r rate 300 100 &> /dev/null
umask 066

############################################################
#                        COMPLETION                        #
############################################################
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors "di=01;34:ma=43;30"
zstyle ':completion:*' max-errors 0
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle :compinstall filename '~/.zshrc'
fpath=(~/bin $fpath)
autoload -U compinit
compinit -u -i

############################################################
#                        COULEURS                          #
############################################################
BLACK="%{"$'\033[01;30m'"%}"
GREEN="%{"$'\033[01;32m'"%}"
RED="%{"$'\033[01;31m'"%}"
YELLOW="%{"$'\033[01;33m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
PURPLE="%{"$'\033[01;35m'"%}"
BROWN="%{"$'\033[00;33m'"%}"
CYAN="%{"$'\033[00;36m'"%}"
BOLD="%{"$'\033[01;39m'"%}"
NORM="%{"$'\033[00m'"%}"

############################################################
#                    OPTIONS KIKOO ZSH                     #
############################################################
autoload run-help
autoload -U colors
autoload -U zmv
colors
setopt correct
setopt always_to_end
setopt hist_ignore_all_dups
setopt No_Beep
setopt complete_in_word
setopt pushd_ignore_dups
setopt append_history
setopt hist_ignore_dups
setopt autocd
setopt auto_menu
setopt list_types
setopt hash_list_all
setopt printexitvalue
unsetopt rm_star_silent
unsetopt list_ambiguous
unsetopt GLOBAL_RCS

bindkey ';5A' history-search-backward
bindkey ';5B' history-search-forward
bindkey ';5C' emacs-forward-word
bindkey ';5D' emacs-backward-word
bindkey '^H' backward-kill-word
############################################################
#                         ALIASES                          #
############################################################
alias c='clear'
alias i='sudo apt-get install'
alias ls='ls --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias sed='sed -E'
alias fsed='sed -E -f'
alias mv='mv -i'
alias g='gcc -W -Wall -ansi -Werror -pedantic -g -ggdb -o'
alias mm='make clean;cls;make'
alias mmm='mm debug'
alias mc='make clean'
alias mcc='make cleanall'
alias x='$LTERM &'
alias t='tar -xf'
alias tv='tar -xvf'
alias du='du -h'
alias df='df -h'
alias dt='dmesg | tail -n 10'
alias 007='kill -9 -1'
alias kl='kill -9 -1'
alias s='cd ../'
alias ss='cd ../../'
alias ff='firefox &'
alias gpp='g++42 -Wall -Wextra -Werror -pedantic -pedantic-errors -std=c++98'
alias th='thunderbird &'

# Forcer ouverture par extension fichier
alias -s pdf=xpdf
alias -s c=e
alias -s h=e
# Work in Goinfre
#alias work='workdir=`mktemp -d /goinfre/durand_c-XXXXXX`; chmod 700 $workdir; cd $workdir; set_color -o red; echo "-Welcome to the Goinfre-"; set_color normal; pwd'
#alias tigrou='workdir=`mktemp -d /goinfre/durand_c-XXXXXX`; chmod 700 $workdir; set_color -o red; echo "-Welcome to the Goinfre, Get ready to work that Fuckin Tiger Project-"; set_color normal; pwd ;  cd ~/ing1/tiger/tc1/campan_t ; svn up ; cp -r ../ $workdir ; cd $workdir/campan_t ; export CONFIG_SITE=~/config.site ; ./bootstrap && ./configure && gmake'
#alias save='savedir=`basename $(pwd)`; mkdir ~/$savedir; cp -R * ~/$savedir/;set_color -o red; echo "-Folder saved-";set_color normal;'


############################################################
#                        FUNCTIONS                         #
############################################################

function e
{
    emacs $1 &
}

function n
{
    echo "/*------------------------------------------------------------------------------"
    echo "**-- Copyright (c) ReFLEX CES AAAA"
    echo     "**------------------------------------------------------------------------------"
    echo     "**-- Project     : "
    echo     "**------------------------------------------------------------------------------"
    echo  "**-- Author      : "
    echo "-- Title       : "
    echo "-- File        : "
    echo "-- Application : "
    echo "-- Created     : "
    echo "-- Last update : "
    echo "-- Version     : "
    echo "-- Dependency  : "
    echo "**------------------------------------------------------------------------------"
    echo "-- Description : "
    echo "-- Limitations : "
    echo "**------------------------------------------------------------------------------"
    echo "--  Rev.   |    Date    | Author | Description"
    echo "**------------------------------------------------------------------------------"
    echo "--         |            |        | "
    echo "**------------------------------------------------------------------------------"

}

function se
{
    sudo emacs $1 &
}

function ownit
{
    sudo chown -R $USER:$USER $1 && sudo chmod -R 755 $1
}

function dtn
{
    dmesg | tail -n $1
}

function srch
{
    grep -Ri "$@" . 2> /dev/null
}

function showcache
{
    for i in $(apt-cache --installed search $1 | awk '{print $1}')
    do
	printf "$i\t"
	apt-cache show $i | grep Version | awk '{print $2}'
    done

}

############################################################
#                         PROMPT                           #
############################################################
function precmd {
	 local TERMWIDTH
    	 (( TERMWIDTH = ${COLUMNS} - 1 ))
	 #Truncate the path if it's too long.
	 PR_FILLBAR=""
    	 PR_PWDLEN=""
    	 local promptsize=${#${(%):---(%n@%m:%D{%H:%M:%S})---()--}}
    	 local pwdsize=${#${(%):-%~}}
    	 if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
    	       ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    	 else
		PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    	 fi
}

setprompt () {
	  setopt prompt_subst
	  typeset -A altchar
    	  set -A altchar ${(s..)terminfo[acsc]}
    	  PR_SET_CHARSET="%{$terminfo[enacs]%}"
    	  PR_SHIFT_IN="%{$terminfo[smacs]%}"
    	  PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    	  PR_HBAR=${altchar[q]:--}
    	  PR_ULCORNER=${altchar[l]:--}
    	  PR_LLCORNER=${altchar[m]:--}
    	  PR_LRCORNER=${altchar[j]:--}
    	  PR_URCORNER=${altchar[k]:--}
	  smiley="%(?,%{${GREEN}%}=%)%{${NORM}%},%{${RED}%}=(%{${NORM}%})"
#${PURPLE}%$PR_PWDLEN<...<%.%<<\
	  PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
${CYAN}$PR_SHIFT_IN$PR_ULCORNER${CYAN}$PR_HBAR$PR_SHIFT_OUT${CYAN}%(!.[\
${RED}.${GREEN})% %n${NORM}@${GREEN}%m${NORM}:${GREEN}%D{%H:%M:%S}${NORM}\
${CYAN}]$PR_SHIFT_IN$PR_HBAR${CYAN}$PR_HBAR${(e)PR_FILLBAR}${CYAN}$PR_HBAR$PR_SHIFT_OUT(\
${PURPLE}%$PR_PWDLEN<...<%~%<<\
${CYAN})$PR_SHIFT_IN$PR_HBAR${CYAN}$PR_URCORNER$PR_SHIFT_OUT${RED}\

${CYAN}$PR_SHIFT_IN$PR_LLCORNER${CYAN}$PR_HBAR$PR_SHIFT_OUT(\
${smiley}${CYAN})$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT${RED}>>\
${NORM} '

	PS2='${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
${GREEN}%_${CYAN})'
}

setprompt

############################################################
#                     LAUNCHING ZSH                        #
############################################################
#clear
