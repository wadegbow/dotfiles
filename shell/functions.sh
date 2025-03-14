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

#tmux with session named after directory basename
function tmuxcd() {
    dir_name=$(basename "$PWD" | tr  . _)

    if ! tmux has-session -t=$dir_name 2> /dev/null; then
        tmux new-session -s "$dir_name"
    else 
        tmux attach -t $dir_name
    fi
}

#get app bundle id
function bid() {
    osascript -e 'id of app "'$1'"'
}

# yt music dl album
function ytmdl() {
    yt-dlp -x --audio-quality best $1 $2 -o "%(artist)s/[%(release_year)s] %(album)s/%(playlist_index)s %(track)s.%(ext)s"
}
