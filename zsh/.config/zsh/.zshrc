# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

#export ZSH='/home/sayago/.oh-my-zsh'
export MYVIMRC='/home/sayago/.config/nvim/init.lua'
export TERM=xterm-256color
export EDITOR=/usr/bin/nvim

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# ZSH_THEME="spaceship"

plugins=(git zsh-autosuggestions zsh-completions autojump)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source ${ZSH:-$ZDOTDIR/ohmyzsh}/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install

# User configuration

# Config autosuggest-accept
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fabd2f,underline"
autoload -U compinit && compinit

# The following lines were added by compinstall
zstyle :compinstall filename '/home/sayago/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

# Alias personales
alias rm='rmtrash'
alias rmn='/bin/rm -rf'
alias rmdir='rmdirtrash'
alias sudo='sudo '
alias tl='trash-list'
alias te='trash-empty'
alias ts='trash-restore'
alias cat='bat'
alias catn='/bin/cat'
alias catnl='/bin/bat --paging=never'
alias vi="nvim"
alias vim="nvim"
alias update='yay -Syu'
alias reloadsx="pkill -usr1 -x sxhkd && notify-send 'sxhkd ¡¡¡Actualizado!!!'"
alias server="browser-sync start --server --browser firefox-developer-edition --files ."
alias vpn='windscribe'
alias class='xprop WM_CLASS'
alias his='anamnesis --browser'
alias wk='cd /home/sayago/workspace'
alias clk='while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &'
alias ls='exa --icons --group-directories-first'
alias lsn='/bin/ls'
alias la='exa -lah --icons --group-directories-first'
alias z='vim $ZDOTDIR/.zshrc'
alias v='vim ~/.config/nvim/init.init'
alias music='ncmpcpp'
alias h='catnl ~/files/horario.txt'
alias sx='vim ~/.config/sxhkd/sxhkdrc'
alias ra='ranger'
alias d2pdf='unoconv'
alias aenv='source env/bin/activate'
alias man2='tldr'
alias ca='calendar.py'
alias rwifi='sudo systemctl restart systemd-networkd.service'

keys() { xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }' }

pdfmerge () { gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$1.pdf *.pdf }

send() { kdeconnect-cli --share=$@ -d 0a0ee965470b1be8 }

topdf() {soffice --headless --convert-to pdf $@}

dmp3() { yt-dlp -f 'ba' -x --audio-format mp3 $1 -o '%(title)s.%(ext)s' }

ordenar() {
  for f in *."$1"; do
      if [[ "$f" =~ [0-9]+ ]]; then
        mv "$f" "$(printf %.3d "${f%.*}")"."$1"
      fi
  done
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

se() {
  case $1 in
    f)
      var=$(du -a $HOME/files/* | awk '{print $2}') ;;
    b)
      var=$(du -a $HOME/.local/bin/* | awk '{print $2}') ;;
  esac

  echo $var | fzf | xargs -r $EDITOR
}

cdx() {
  var="$HOME/Documents/path.txt"
  cd "$(cat $var | fzf)"
}

xmodmap $HOME/.Xmodmap

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [[ `date | grep "jue 21"` ]] && cat ~/files/afis.md
# cd $(echo -e "/home/sayago\n/home/sayago/.config" | fzf)
# sort 1.txt 2.txt | uniq -u >> 1.txt
# perl-rename 's/(\w.*(\s+\w.*)+).(#\d+)/$3 $1/g' *.mp4
# Restart Wifi: systemd-networkd.service
# Buscar con el path completo: tree -P <file> --prune
# Solucionar problemas: fsck -f -y <path>
# ffmpeg -i in.mp3 -i test.png -map 0:0 -map 1:0 -c copy -id3v2_version 3 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" out.mp3
# add new song: mpc update && mpc add <song>
# dd bs=4M if=path/to/ubuntu.iso of=/dev/sdx status=progress oflag=sync
