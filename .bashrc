IP=$(/sbin/ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
zopeDir=/home/guilherme/env/zope
userHome=/home/guilherme
export userHome
export IP
export zopeDir
cowsay muuu... nothing new here my good friend

#system commands
alias ls='ls -hF --color'
alias cd..='cd .. && pwd && ls'
alias cd~='cd ${userHome}/ && pwd && ls'
alias down='cd ${userHome}/Downloads && pwd && ls'
alias docs='cd ${userHome}/Documents && pwd && ls'
alias ~='cd ${userHome} && pwd && ls'
alias ..='cd .. && pwd && ls'
alias home='cd ${userHome} && pwd && ls'
alias start='startx; kill -9 $$'
alias task='ps aux | grep'
alias tasks='ps aux'
alias eyebeam='/home/guilherme/scripts/logar-eyebeam.sh'
alias edit='sublime_text'

#zope commands
alias zres='${zopeDir}/bin/zopectl restart'
alias zlog='tailf ${zopeDir}/log/event.log'
alias zstop='${zopeDir}/bin/zopectl stop'
alias zstart='${zopeDir}/bin/zopectl start'
alias zconf='gvim ${zopeDir}/etc/zope.conf'

#application commands
alias installpackage='LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 sublime_text'

#webdav commands
# alias nwebdav_mount='sudo mount -t davfs 192.168.10.100:1980 ${HOME}/webdav_nube/ && export webdav_nube_status=1'
# alias lwebdav_mount='sudo mount -t davfs localhost:1980 ${HOME}/webdav_local/ && export webdav_local_status=1'
# alias lwebdav_umount='sudo umount ${HOME}/webdav_local'
# alias nwebdav_umount='sudo umount ${HOME}/webdav_nube'
# alias createWebDav='mkdir ${HOME}/webdav_nube/ && mkdir ${HOME}/webdav_local/'
# alias deleteWebDav='rm -rf ${HOME}/webdav_nube && rm -rf ${HOME}/webdav_local'

mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
mk7z() { 7za e  "${1%%/}.7z"     "${1%%/}/"; }

extract() {    
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2) tar xvjf "$1"   ;;
      *.tar.gz)  tar xvzf "$1"   ;;
      *.bz2)     bunzip2 "$1"    ;;
      *.rar)     unrar x "$1"    ;;
      *.gz)      gunzip "$1"     ;;
      *.tar)     tar xvf "$1"    ;;
      *.tbz2)    tar xvjf "$1"   ;;
      *.tgz)     tar xvzf "$1"   ;;
      *.zip)     unzip "$1"      ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7za e "$1"       ;;
      *)
      echo "'$1' Cant be extracted."
      return 1
      ;;
    esac
  else
    echo "'$1' Not a valid file."
    return 1
  fi
  return 0
}

export PS1="[\W]>\\$ \[$(tput sgr0)\]"
