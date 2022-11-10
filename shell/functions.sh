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