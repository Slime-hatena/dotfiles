INTERACTIVE_FILTER="fzf-tmux"

unsetopt nomatch

# macOS: enable ^q ^s etc...
setopt no_flow_control

export HISTSIZE=100000
export SAVEHIST=100000
setopt hist_ignore_dups     # 前と重複する行は記録しない
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに保存する
setopt HIST_IGNORE_SPACE    # 行頭がスペースのコマンドは記録しない
setopt HIST_IGNORE_ALL_DUPS # 履歴中の重複行をファイル記録前に無くす
setopt HIST_FIND_NO_DUPS    # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_NO_STORE        # histroyコマンドは記録しない

setopt GLOB_SUBST

DISABLE_AUTO_TITLE="true"

export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls='ls -GF'
alias rmm='rm'
alias rm='trash'

export FZF_DEFAULT_OPTS='--height 40% --reverse --select-1'

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#c6c6c6,bg=#106a84,bold,underline"

