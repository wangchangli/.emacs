bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
dateTime=`date '+%F_%T'`

dotEmacs=~/.emacs
if [[ -f "$dotEmacs" && ! -L "$dotEmacs" ]]; then
    mv "$dotEmacs" "$dotEmacs.$dateTime"
fi

ln -sf "${bin}"/.emacs ~/.emacs