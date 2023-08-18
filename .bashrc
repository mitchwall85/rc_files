# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#####################
#### MWALL ADDED ####
#####################

## Aliases
alias l='ls -lrth'
alias c='clear'
alias curcLogin='ssh -X miwa6095@login10.rc.colorado.edu'
alias open='xdg-open'
alias audioConnect='bluetoothctl connect 0C:8D:CA:17:CA:44'
alias audioDisconnect='bluetoothctl disconnect 0C:8D:CA:17:CA:44'
alias tf='tail -f'
alias pytecplot='tec360-env -- python' # must have a pytecplot enviroment active
alias cpath='pwd | tr -d "\n" | xclip -sel clip'
alias nv='nvim'
alias tma='tmux attach-session -t '
alias tmr='tmux rename-session '

## Rsync Folders
alias myRsync_proj2local_full='rsync -av --progress --human-readable  miwa6095@login.rc.colorado.edu:/projects/miwa6095/ /home/mitch/summitProj/miwa6095/'
alias myRsync_local2proj_full='rsync -av --progress --human-readable  /home/mitch/summitProj/miwa6095/ miwa6095@login.rc.colorado.edu:/projects/miwa6095/'
alias myRsync_proj2local_nozzle='rsync -av --update  miwa6095@login.rc.colorado.edu:/projects/miwa6095/nozzle/ /home/mitch/summitProj/miwa6095/nozzle/'
alias myRsync_local2proj_nozzle='rsync -av --update  /home/mitch/summitProj/miwa6095/nozzle/ miwa6095@login.rc.colorado.edu:/projects/miwa6095/nozzle/'

# Alias Paths
alias dirSummit='cd /home/mitch/summitProj/miwa6095'
alias activateNGPDLenv='source "/home/mitch/odrive-agent-mount/OneDrive For Business/CUBoulder/NGPDL/python/NGPDLenv/bin/activate"'
alias dirOdrive='cd "/home/mitch/odrive-agent-mount/OneDrive For Business"'
alias dirLocal='cd /home/mitch/local_data'
alias dirNGPDL='cd "/home/mitch/odrive-agent-mount/OneDrive For Business/CUBoulder/NGPDL"'

# Paths
export PATH=/home/mitch/Documents/tempNGPDL/python/postProc:$PATH
export PATH=/home/mitch/odrive-agent/bin:$PATH
export PATH=/usr/local/tecplot/360ex_2022r2/bin:$PATH
export PATH=/home/mitch/software/MATLAB/R2022b/bin:$PATH
export PATH=/home/mitch/.local/bin:$PATH
export PATH=/home/mitch/software/zotero/Zotero_linux-x86_64:$PATH
export PATH=/home/mitch/software/cmake/cmake-2.8.8-Linux-i386/bin:$PATH
export CDS_LIC_FILE=5280@10.225.226.136
# export PATH=/opt/Fidelity/Pointwise/PointwiseV18.6R4:$PATH
# temp
export PATH="/home/mitch/odrive-agent-mount/OneDrive For Business/CUBoulder/NGPDL/rocketModel/python/postProc":$PATH
export PATH="/home/mitch/software/GRAM/GRAM_Suite_1.5.0__1_/GRAM Suite 1.5/Linux":$PATH
export PATH="/home/mitch/.local/bin":$PATH

# color terminal
export PS1='\[\e[1;34m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;33m\]\w\[\e[0m\]\$ '

# Functions
# move up multiple directories
function cd..() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}

# scp to local with a curc data transfer node (no password), copies to current directory
function scpdtn() {
  scp miwa6095@dtn.rc.int.colorado.edu:$1 .;
}

# scp to curc with a curc data transfer node (no password), copies to current directory
function scptodtn() {
  scp $1 miwa6095@dtn.rc.int.colorado.edu:$2;
}


testFuns() {
	echo $1;
}

function rsyncProj2Local() {
   # assemble local path
   local localDirBase=/home/mitch/summitProj/miwa6095/
   local localDirFull=$localDirBase$1/
   #echo $localDirFull
   
   # assemble remote path
   local remoteDirBase=miwa6095@login.rc.colorado.edu:/projects/miwa6095/
   local remoteDirFull=$remoteDirBase$1/
   #echo $remoteDirFull

   # execute rsync
   local syncCommand="rsync -av --progress --human-readable $remoteDirFull $localDirFull";
   #echo $syncCommand
   eval "$syncCommand"
}

function rsyncLocal2Proj() {
   # assemble local path
   local localDirBase=/home/mitch/summitProj/miwa6095/
   local localDirFull=$localDirBase$1/
   #echo $localDirFull

   # assemble remote path
   local remoteDirBase=miwa6095@login.rc.colorado.edu:/projects/miwa6095/
   local remoteDirFull=$remoteDirBase$1/
   #echo $remoteDirFull

   # execute rsync
   local syncCommand="rsync -av --progress --human-readable $localDirFull $remoteDirFull";
   #echo $syncCommand
   eval "$syncCommand"
}

# Change Terminal Name
function set-title() {
  if [[ -z "$ORIG" ]]; then
	 ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
  }


# SU2 Things
export SU2_RUN="usr/local/bin"
export SU2_HOME="/home/mitch/odrive-agent-mount/OneDrive For Business/CUBoulder/CSCI5636/finalProject/SU2"
export PATH=$PATH:$SU2_RUN
export PYTHONPATH=$SU2_RUN:$PYTHONPATH

# Cantera Path
# export CANTERA_DATA="/home/mitch/anaconda3/envs/ct-dev/share/cantera/data/data"
# export PATH=$PATH:"/home/mitch/anaconda3/envs/ct-dev/bin"

#########################
#### MWALL ADDED END ####
#########################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/mitch/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/mitch/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/mitch/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/mitch/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<


export GRIDPRO=/home/mitch/GridPro
export PYTHONPATH=/home/mitch/GridPro/lib:$PYTHONPATH

export PATH=$GRIDPRO/bin:$PATH
export PATH=$GRIDPRO/lc_mngr:$PATH
