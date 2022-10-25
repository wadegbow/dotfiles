#-----------------#
#  Install Stuff  #
#-----------------#

export ZSH=/Users/wade/.oh-my-zsh
ZSH_THEME="solyaris"
source $ZSH/oh-my-zsh.sh
# move compdump files out of home
autoload -U compinit && compinit -i -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# ceo_c2
export PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python3.7/site-packages/ceo_c2/submodules"

# rbenv
eval "$(rbenv init -)"


#----------#
#  Custom  # 
#----------#

# Basic Stuff
alias ls="ls --color"
alias edit="code"
alias subl="subl"
alias src="source ~/.zshrc"
alias open.=" open ."
alias cl="clear"
alias cp="rsync -ahv --progress"
alias filecount="ls -l | wc -l"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# macOS Show/Hide Hidden Files
alias showFiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder"
alias hideIcons="defaults write com.apple.finder CreateDesktop -bool false; killall Finder"
alias showIcons="defaults write com.apple.finder CreateDesktop -bool true; killall Finder"

# Networking
alias lanip="ifconfig | grep 'inet'"
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias mkhttp="python -m http.server"

# Compiling
alias compA='g++ -g -Wall -std=c++11 *.cpp *.h'
alias comp='g++ -g -Wall -std=c++11'

# Misc
alias ytdlmp3="youtube-dl --add-metadata -x --audio-format 'mp3' --audio-quality 0"
alias mpv="mpv --no-border"
alias mpvpip="mpv --ontop --no-border --on-all-workspaces --autofit=384x216 --geometry=99%:2%"
#alias colors="python ~/Scripts/colors.py -t"
#alias get_embed="python ~/Scripts/scrape-sa.py"
alias aqua="asciiquarium"
alias bmon="bmon -f /Users/wade/.config/bmon.conf"
alias crunchy="~/Scripts/crunchy.sh"
alias limelight="limelight &> /dev/null &"


#---------------#
# TO BE REMOVED #
#---------------#

#-------------#
#  Functions  #
#-------------#

#convert to .webm
function ffwebm () {
    ffmpeg -i $1 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis $2
}

#convert to gif
function convert2gif () {
    mkdir frames
    ffmpeg -i $1 -vf scale=$2:-1:flags=lanczos,fps=$3 frames/ffout%03d.png
    convert -delay $4 -loop 0 frames/ffout*.png output.gif
    rm -rf frames
}

#xo install
function xo-install() {
    curl -s https://s3.amazonaws.com/static.getsnworks.com/local-dev/setup.sh | /bin/bash
    ./xo build
    ./xo up
}

#clone-templates
function clone-templates() {
    git clone  git@bitbucket.org:statenews/$1.git $2
}

export NVM_DIR="/Users/wade/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
if [ -f ~/.zshrc ]; then nvm use stable; fi

#example of command on terminal start
#if [ -f ~/.zshrc ]; then
#   nvm use stable
#fi

#for qmk
export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"