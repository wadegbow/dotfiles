# Basic Stuff
alias ls="ls --color"
alias src="source ~/.zshrc"
alias cp="rsync -ahv --progress"
alias filecount="ls -l | wc -l"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Networking
alias lanip="ifconfig | grep 'inet'"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias mkhttp="python -m http.server"

# Misc
alias ytdlmp3="youtube-dl --add-metadata -x --audio-format 'mp3' --audio-quality 0"
alias mpv="mpv --no-border"
alias mpvpip="mpv --ontop --no-border --on-all-workspaces --autofit=384x216 --geometry=99%:2%"

alias btop="btop -t"
alias bmon="bmon -f /Users/wade/.config/bmon.conf"

# macOS Show/Hide Hidden Files
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
alias hideIcons="defaults write com.apple.finder CreateDesktop -bool false; killall Finder"
alias showIcons="defaults write com.apple.finder CreateDesktop -bool true; killall Finder"
