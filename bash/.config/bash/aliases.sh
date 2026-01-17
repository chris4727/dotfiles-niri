#== BASH ALIASES =================================
# This file is sourced by ~/.bashrc
# Sourced from "$XDG_CONFIG_HOME/bash/aliases"

# Find most common commands using: 
# TODO Get this alias working to show top commands in history
#alias hist='history | awk '{cmd[$2]++} END {for(elem in cmd) {print cmd[elem] " " elem}}' | sort -n -r | head -10'
# https://lite.duckduckgo.com/lite?kd=-1&kp=-1&q=%s
# TODO Setup script to read user unput to identify file to set as wallpaper.
# Copy image to wallpaper directory, and set as wallpaper (will need to refresh window manager).
# TODO Update pacman aliases for paru package manager
# TODO Add if statement to check for pacman or paru
# TODO setup rofi powermenu script 
# See: https://github.com/ericmurphyxyz/dotfiles/blob/master/.local/bin/powermenu

# ---  GENERAL  ---------------------------------

alias c='printf "\e[H\e[2J"'
alias ip="curl http://myip.dnsomatic.com && echo ''"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias v='$EDITOR'
alias file='$FILEMANAGER'
alias grep='grep --color=auto'
alias diff='diff -u --color'
alias diffdir='diff -qr'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'

# ---  NAVIGATION  -------------------------------

alias conf='cd /$DOTFILES && ll'
alias dot='cd /$DOTFILE_REPO && ll'
alias bin='cd /$SCRIPTS && ll'
alias med='cd /$MEDIA && ll'

# ---  LIST  -----------------------------------

# If eza is installed, run eza, otherwise use ls
if command -v eza &> /dev/null; then
  alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first"
  alias la='eza -a --icons --group-directories-first'
  alias ll='eza -lAh --icons --group-directories-first --time-style=long-iso'
  # Tree with colors, icons, and show git status
  alias lt='eza --tree --icons --group-directories-first'
else
  alias ls='ls -F --color=auto --group-directories-first'
  alias la='ls -aF --color=auto --group-directories-first'
  alias ll='ls -lAhF --color=auto --group-directories-first --time-style=long-iso --ignore=lost+found'
  # Tree with colors, icons, and show git status
  alias lt='tree'
fi

# ---  BAT  --------------------------------------

# If bat is installed, use bat, otherwise use basic command
if command -v bat &> /dev/null; then
  alias cat='bat -p $@'
  alias lsblk='lsblk | bat -pl conf'
fi

# ---  FILE HANDLING  -----------------------------------

alias rcp="rsync --archive --human-readable --progress --verbose"
alias trash="move_to_trash.sh"
alias empty="empty_trash.sh"

# ---  PACAGE MANAGER  ----------------------- 

alias pacu='pacman -Syu && paru'			# Update
alias pacls='pacman -Qet'					# List user installed packages
alias pacs='pacman -Ss'					# Search repositories for package
#alias pacs='pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S'
alias paci='pacman -S'						# Install package
#alias pacr='pacman -Rs'					# Remove package
alias pacc='pacman -Qdtq | pacman -Rs'		# Cleanup packages

# ---  APPLICATION LAUNCHERS  -----------------------------------

alias tmx='tmux new-session -A -s Tmux'
#bind '"\C-t":"tmx\n"'
alias music='rmpc'
function y() {
  # y instead of yazi to start
  # q to quit, you'll see the CWD changed
  # Q to quit without changing cwd
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ---  LOCK & SCREENSAVERS  ----------------------

alias lock='betterlockscreen -l ~/.config/wallpaper/'	# Lock the computer
alias wall='cp -i $DOTFILES/wallpaper/.config/wallpaper/wallpaper.jpg'

if command -v gomatrix &> /dev/null; then
  alias matrix='gomatrix'
fi

if command -v astroterm &> /dev/null; then
  alias astro='astroterm --color --unicode --speed 100 --fps 8 --city Seattle'
fi

# ---  FILES  -----------------------------------

if [[ $OS = linux ]]; then
  alias open='xdg-open'		# Open using default program
elif [[ $OS = windows ]]; then
  alias open='start'		  # Open using default program
fi
alias image='magick'			# Convert image with imagemagick

# ---  SYSTEM MANAGEMENT  -----------------------------------

# Show disk usage sorted and summarized
alias dus='du -d 1 -h | sort -h'  # Show files sorted by size
alias btm='btm --battery'         # Show system resources and battery
alias dust='dust && df -h .'      # Run dust, and give a summary of disk space usage

# ---  FETCH  -----------------------------------

alias fetch='clear && neofetch'

# ---  SHUTDOWN  -----------------------------------

alias reboot='shutdown -r now'

# ---  RIP DISKS TO FILE  -----------------------------------

# Rip audio CD to flac
alias ripcd='abcde -o flac -c $HOME/.config/abcde/abcde.conf && eject'

# ---  GIT  -----------------------------------

alias lzg='lazygit'									# Git tui
alias gs='git status -sb'							# Git status
alias ga='git add'								    # Git add
alias gg='!git rev-list --all | xargs git grep -F'	# Search commits (grep)
alias gl='git log --graph'					# Git log
alias gd='git diff origin/main'				# Diff staged changes
alias gb='git branch'
alias gc='git commit'								  # Commit message in editor
alias gp='git push -u origin main'		# Git push to origin
alias gu='git pull'								    # Git pull (update)

# ---  DOCKER  -----------------------------------

alias lzd='lazydocker'									# Docker tui
alias docu='docker-compose up -d'			  # Start docker-compose
alias docd='docker-compose down'			  # Stop docker-compose
alias docp='docker-compose pull'			  # Pull image updates

