
### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

compinit

# <Tab> でパス名の補完候補を表示したあと、
# # 続けて <Tab> を押すと候補からパス名を選択できるようになる
# # 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

### Prompt ###
## プロンプトに色を付ける
autoload -U colors; colors
## 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"
#
## rootユーザ時(太字にし、アンダーバーをつける)
#if [ ${UID} -eq 0 ]; then
#  tmp_prompt="%B%U${tmp_prompt}%u%b"
#    tmp_prompt2="%B%U${tmp_prompt2}%u%b"
#      tmp_rprompt="%B%U${tmp_rprompt}%u%b"
#        tmp_sprompt="%B%U${tmp_sprompt}%u%b"
#        fi
#
#        PROMPT=$tmp_prompt    # 通常のプロンプト
#        PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
#        RPROMPT=$tmp_rprompt  # 右側のプロンプト
#        SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
#        # SSHログイン時のプロンプト
#        [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#          PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#
# lsコマンドに常に色を付ける
alias ls='ls -G'

