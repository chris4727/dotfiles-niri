#== BASHRC =======================================
# This file runs every time a new terminal is opened

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---  UTILITY FUNCTIONS  ------------------------

_source_if() { [[ -r "$1" ]] && source "$1"; }
_have() { type "$1" &>/dev/null; }

# ---  ENVIRONMENT VARIABLES  --------------------

export OS
[[ $(uname) =~ Linux ]] && OS=linux
[[ $(uname -o) =~ Msys ]] && OS=windows
#[[ $(uname -o) =~ Darwin ]] && OS=apple
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export TERM="xterm-256color"
export DOCUMENTS="$HOME/Documents"
export DOTFILES=$HOME/.config
export DOTFILE_REPO=$HOME/dotfiles
export DOWNLOADS="$HOME/Downloads"
export MUSIC="$HOME/Music"
export NOTES="$HOME/Notes"
export PICTURES="$HOME/Pictures"
export SCRIPTS="$HOME/.local/bin"
export TEMPLATES="$HOME/Templates"
export TRASH="$HOME/.local/share/Trash"
export VIDEOS="$HOME/Videos"
if [[ $OS == "linux" ]]; then
  export FILEMANAGER="dolphin"
  export BROWSER="qutebrowser"
  export TERMINAL="kitty"
  export MEDIA="/run/media/$USER"
elif [[ $OS == "windows" ]]; then
  export FILEMANAGER="explorer"
  export BROWSER="chrome"
  export TERMINAL="mintty"
fi

# Use nvim if installed
if _have "nvim"; then
  export EDITOR="nvim"
else
  export EDITOR="vim"
fi

# Set Caps Lock to Esc
if [[ $OS == "linux" ]]; then
  test -n "$DISPLAY" && setxkbmap -option caps:escape &>/dev/null
fi

# ---  COLORS  -----------------------------------

export BG1="\033[0;30m"
export RD1="\033[0;31m"
export GR1="\033[0;32m"
export YL1="\033[0;33m"
export BL1="\033[0;34m"
export PR1="\033[0;35m"
export CY1="\033[0;36m"
export FG1="\033[0;37m"
export BG2="\033[0;40m"
export RD2="\033[1;31m"
export GR2="\033[1;32m"
export YL2="\033[1;33m"
export BL2="\033[1;34m"
export PR2="\033[1;35m"
export CY2="\033[1;36m"
export FG2="\033[1;37m"
export NC="\033[0m" # No Color


# ---  SETTINGS  ----------------------------------

# Use vim keybindings:
set -o vi
# Prevent overwriting files with `>`. Use `>|` to overwrite.
set -o noclobber
# Ignore case when Tab completing
bind "set completion-ignore-case on"
# Bash history
export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignorespace:erasedups
export HISTTIMEFORMAT="%Y%m%d%H%M%S "
# Append to the history file, don't overwrite it.
shopt -s histappend

# ---  PAGER  -------------------------------------

if [[ -x /usr/bin/lesspipe ]]; then
	export LESSOPEN="| /usr/bin/lesspipe %s"
	export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

# Use bat as manpager
eval "$(batman --export-env)"

# ---  DIRCOLORS  ---------------------------------

if _have dircolors; then
	if [[ -r "$HOME/.config/ls/dircolors" ]]; then
		eval "$(dircolors -b "$HOME/.config/ls/dircolors")"
	else
		eval "$(dircolors -b)"
	fi
fi

# ---  PATH  -------------------------------------

# Manage Shell Path: https://www.youtube.com/watch?v=pOr7Wt72INo
pathappend() {
# pathappend $(PWD) will add the working directory to the top of
#   the path list
	declare arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

pathprepend() {
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

# last arg will be first in path
pathprepend \
	"$HOME/.local/bin" \
	"$HOME/Scripts" \

pathappend \
	/usr/local/bin \
	/bin

# ---  BASH SHELL OPTIONS  -----------------------

# shopt is for BASHOPTS, set is for SHELLOPTS
shopt -s autocd       # change to named directory
shopt -s cdspell      # autocorrects cd misspellings
shopt -s checkwinsize # Ensure $LINES and $COLUMNS are updated
shopt -s globstar     # Allows `**` glob for searching subdirectories
shopt -s dotglob      # Allows filenames beginning with `.` to be matched
shopt -s extglob      # Allows all matching types in `pathname expansion`

# ---  COMPLETION  -------------------------------

_have pandoc && . <(pandoc --bash-completion)

# --- PERSONALIZED CONFIGURATIONS  ---------------

_source_if "$XDG_CONFIG_HOME/bash/aliases.sh"
_source_if "$XDG_CONFIG_HOME/bash/aliases.local.sh"
_source_if "$XDG_CONFIG_HOME/bash/functions.sh"
_source_if "$XDG_CONFIG_HOME/fzf/fzfrc"

# ---  PROMPT  -----------------------------------

# Define color variables
# Surround escape codes with `\[\]` to prevent overwriting prompt
blk='\[\e[30m\]' # Black 
red='\[\e[31m\]' # Red
grn='\[\e[32m\]' # Green
yel='\[\e[33m\]' # Yellow
blu='\[\e[34m\]' # Blue
prp='\[\e[35m\]' # Purple
cyn='\[\e[36m\]' # Cyan
wht='\[\e[37m\]' # White
def='\[\e[39m\]' # Default
nc='\[\e[0m\]' # No Color

ps1() {
  export PS1="$prp\u$grn@$prp\h$grn:$prp\W$grn->$nc "
}

# Use starship if installed, else use bash ps1
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init bash)"
  export STARSHIP_CONFIG=~/.config/starship/starship.toml
else
  PROMPT_COMMAND='ps1'
fi

# Use nerdfetch if installed
if [ -x "$(command -v nerdfetch)" ]; then
  printf "\n" && nerdfetch
fi

