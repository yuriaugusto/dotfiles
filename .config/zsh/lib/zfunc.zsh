function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

# From Dan Ryan's blog - http://danryan.co/using-antigen-for-zsh.html
man() {		# some settings for man?
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

#Translator; requires Internet
#
#    Usage: translate <phrase> <output-language>
#    Example: translate "Bonjour! Ca va?" en
#
#See this for a list of language codes:
#http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
#
function translate(){ 
  wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$2&dt=t&q=$(echo $1 | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}'; 
}

#Converting audio and video files using ffmpeg and eyeD3
#(sudo pip install eyeD3). Album art is removed in the '2ogg' function
#because if you are using ogg, you probably either do not need it or
#want to save as much space as possible. The '2voc' is very useful when
#dealing with DOOM WADS or certain DOS software. If you need to cancel a
#conversion that uses FFmpeg, use CTRL+C as 'q' will still delete the
#original and then leave you with a partially converted file. If you
#hate the idea of deleting the original file, remove the '&& rm "$1"'
#parts at the end.
#
#    Usage example: 2ogg '/path/to/file.ext'
#
function 2ogg() { eyeD3 --remove-all-images "$1"; echo "" && echo "Converting using SoX..." && sox "$1" "${1%%.*}.ogg" && rm "$1" ; }
function 2wav() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.wav" && rm "$1"; }
function 2doswav() { ffmpeg -hide_banner -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "${1%%.*}_DOS.WAV" && rm "$1"; }
function 2doswav8() { ffmpeg -hide_banner -threads 0 -i "$1" -ar 8000 -acodec pcm_u8 -ac 1 "${1%%.*}_DOS.WAV" && rm "$1"; }
function 2doswav11() { ffmpeg -hide_banner -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "${1%%.*}_DOS.WAV" && rm "$1"; }
function 2voc() { ffmpeg -hide_banner -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "${1%%.*}.voc" && rm "$1"; }
function 2voc8() { ffmpeg -hide_banner -threads 0 -i "$1" -ar 8000 -acodec pcm_u8 -ac 1 "${1%%.*}.voc" && rm "$1"; }
function 2voc11() { ffmpeg -hide_banner -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "${1%%.*}.voc" && rm "$1"; }
function 2opus() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}_temp.wav" && opusenc --bitrate 2K --hard-cbr --downmix-mono "${1%%.*}_temp.wav" "${1%%.*}.opus" && rm "${1%%.*}_temp.wav" "$1" ; }
function 2aif() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.aif" && rm "$1"; }
function 2mp3() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.mp3" && rm "$1"; }
function 2mov() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.mov" && rm "$1"; }
function 2mp4() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.mp4" && rm "$1"; }
function 2avi() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.avi" && rm "$1"; }
function 2webm() { ffmpeg -hide_banner -threads 0 -i "$1" -c:v libvpx "${1%%.*}.webm" && rm "$1"; }
function 2h265() { ffmpeg -hide_banner -threads 0 -i "$1" -c:v libx265 "${1%%.*}_h265.mp4" && rm "$1"; }
function 2flv() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.flv" && rm "$1"; }
function 2mpg() { ffmpeg -hide_banner -threads 0 -i "$1" "${1%%.*}.mpg" && rm "$1"; }

#Converting documents and images using soffice
#(installed along with LibreOffice)
#
#    Usage example: 2pdf '/path/to/file.html'
#
function 2txt() { soffice --headless --convert-to txt "$1"; }
function 2pdf() {
    if [ ${1: -4} == ".html" ]
    then
        soffice --headless --convert-to odt "$1"
        soffice --headless --convert-to pdf "${1%%.*}.html"
    else
        soffice --headless --convert-to pdf "$1"
    fi
}
function 2doc() { soffice --headless --convert-to doc "$1"; }
function 2odt() { soffice --headless --convert-to odt "$1"; }

#Convert images using ImageMagick
#
#    Usage example: 2jpg '/path/to/image.ext'
#
function 2pcx() { convert "$1" -colors 256 "${1%%.*}.pcx" && rm "$1"; }
function 2lbm() { convert "$1" -remap "/PATH/TO/DPAINT/LORES/THEPAINT.BMP" -colors 4 -depth 2 -resize 320x200 "${1%%.*}.lbm" && rm "$1"; echo "$1 was converted to LBM format, but do not forget to convert again using PICTVIEW"; }
function 2jpeg() { convert "$1" "${1%%.*}.jpg" && rm "$1"; }
function 2jpg() { convert "$1""${1%%.*}.jpg" && rm "$1"; }
function 2png() { convert "$1" "${1%%.*}.png" && rm "$1"; }
function 2png8() { convert "$1" "${1%%.*}.png8" && mv "${1%%.*}.png8" "$fname.png" && rm "$1"; }
function 2bmp() { convert "$1" "${1%%.*}.bmp" && rm "$1"; }
function 2dosbmp() { convert "$1" -colors 16 -depth 4 -dither none -resize 640x480 BMP3:"${1%%.*}_DOS.bmp" && rm "$1"; }
function 2dosgif() { convert "$1" -colors 256 -dither none -resize 320x200\! GIF87:"${1%%.*}_DOS.gif" && rm "$1"; }
function 2tiff() { convert "$1" "${1%%.*}.tiff" && rm "$1"; }
function 2ico() { convert -background transparent "$1" -define icon:auto-resize=16,32,48,64,128 "${1%%.*}.ico" && rm "$1"; }

#If input is a video, convert use '2gif' to created an animated
#(89a) GIF; otherwise, use ImageMagick to create a still (87a) GIF.
#
#    Usage example: 2gif '/path/to/image/or/video.ext'
#
function 2gif() {
    if [ ! -d "/tmp/2gif" ]; then mkdir "/tmp/2gif"; fi
    if [ ${1: -4} == ".mp4" ] || [ ${1: -4} == ".mov" ] || [ ${1: -4} == ".avi" ] || [ ${1: -4} == ".flv" ] || [ ${1: -4} == ".mpg" ] || [ ${1: -5} == ".webm" ]
    then
        ffmpeg -hide_banner -threads 0 -i "$1" -r 10 -vf 'scale=trunc(oh*a/2)*2:480' /tmp/2gif/out%04d.png
        convert -delay 1x10 "/tmp/2gif/*.png" -fuzz 2% +dither -coalesce -layers OptimizeTransparency +map "${1%%.*}.gif"
    else
        convert "$1" GIF87:"${1%%.*}.gif"
        rm "$1"
    fi
    if [ -d "/tmp/2gif" ]; then rm -r "/tmp/2gif"; fi
}

#Grab a pretty ascii forecast picture for anywhere; without arguments,
#uses ISP location to print your weather. Example: weather New York, NY
function weather() { curl -s http://wttr.in/$1; }

#Grab weather information from USAirNet and have a pretty Wttr.in ascii
#output. Example: weather 02118 boston
function weatherus() { echo ""; w3m http://www.usairnet.com/weather/forecast/local/?pands=$1 | grep -A 10 "${2^^}"; echo ""; curl -s http://wttr.in/$2; }

#Convert hex data file to a binary
function hex2bin() { s=${@^^}; for i in $(seq 0 1 $((${#s}-1))); do printf "%04s" `printf "ibase=16; obase=2; ${s:$i:1};\n" | bc` ; done; printf "\n"; }

#Move up by a number of specified directories
function up(){
    local d=""
    local limit="$1"
    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi
    for ((i=1;i<=limit;i++)); do
        d="../$d"
    done
    if ! cd "$d"; then
        echo "Could not go up $limit directories.";
    fi
}

function syncrepos() {
    local notes='/home/yuri/Documents/ObsidianNotes/'
    local dotfiles='/home/yuri/git/dotfiles/'
    
    if cd "$1"; then
        if [[ $(git status --porcelain) ]]; then
            git add . 
            git commit -m "Sync"
            git push
        else
            echo "Nothing to commit."
        fi
    else
        echo "Failed to change directory to $1" >&2
        return 1
    fi
}


function gacp(){
    git add .
    git commit -m "Update"
    git push -u origin main
}

find_man() {
    man $1 | grep -- $2
}

srccmd() {
    compgen -c | sort | fzf --preview 'man {}' --preview-window 'right:60%:wrap' | xargs man
} 

srcman() {
    local man_page
    man_page=$(man -k . | sort | fzf --prompt='Man Pages> ' --preview='echo {} | awk "{print \$1}" | xargs man' --preview-window=down:50%:wrap)
    man "$(echo "$man_page" | awk '{print $1}')"
}


#Lists URLs that start with 'http' or 'https' on a webpage using cURL
#
#    Usage: listurls https://example.org
#
function listurls() {
    curl -s -f -L "$1" | grep -Eo '"(http|https)://[a-zA-Z0-9#~.*,/!?=+&_%:-]*"' | sed 's/"//g' ; 
}
