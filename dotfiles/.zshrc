fpath=(~/zsh-completions/src $fpath)

alias ack='ack --type-add html=.tpl,.tmpl,.tt'
alias s='~/tools/scripts/screen_loader.sh'
alias ls='ls --color'

export SVN_EDITOR=vim
export LANG=ja_JP.UTF-8
export JAVA_HOME=/usr

autoload -U compinit && compinit 

HISTFILE=$HOME/.zsh-history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_cd
setopt correct
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'


if [ "$TERM" = xterm -o "$TERM" = xterm-color -o "$TERM" = kterm ]; then
        print_esc() { print -nr ${1//[^\ -~]/_} }  #unprintableな文字を_に置換
        precmd() { print -n "\e]0;"; print_esc "[${PWD/~HOME/~}:$HOST]"; print -n "\a" }
        preexec() { print -n "\e]0;"; print_esc "$1 [${PWD/~HOME/~}:$HOST]"; print -n "\a" }
fi

function history-all { history -E 1 } # 全履歴の一覧を出力する

function set_screen_title () { echo -ne "\ek$1\e\\" }
function title() {
    if [[ -n "$SCREENTITLE" ]]; then
        if [[ -n "$1" ]]; then
            # set title explicitly
            export SCREENTITLE=explicit
            set_screen_title "$1"
        else
            # automatically set title
            export SCREENTITLE=auto
        fi
    fi
}
function m() { title Model }
function v() { title View }
function c() { title Controller }
function log() { title Log }
function schema() { title Schema }
function css() { title CSS }
function db() { title DB }
function js() { title JS }

