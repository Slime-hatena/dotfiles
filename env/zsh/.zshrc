ZSHHOME="${HOME}/.zsh.d"
touch $ZSHHOME/.profile.zsh

if [ -f "$HOME/.bash_path" ]; then
  . "$HOME/.bash_path"
fi

# brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

if [ -z "$TMUX" ]; then
  export FZF_DEFAULT_OPTS='--height 40% --reverse --select-1'
  # tmux new-session -A -s "default"
  tmux new-session -A -s "${TERM}"
  # tmuximum
fi

source <(fzf --zsh)

firstInitializeFiles=(
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
  "$(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh"
  "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "$ZSHHOME/.default.zsh"
  "$ZSHHOME/.profile.zsh"
)

finalInitializeFiles=(
  "$ZSHHOME/.bindkey.zsh"
  # To customize prompt, run `p10k configure` or edit .p10k.zsh
  "$ZSHHOME/.p10k-functions.zsh"
  "$ZSHHOME/.p10k.zsh"
)

ignore_files=(${firstInitializeFiles[*]} ${finalInitializeFiles[*]})
initializeFiles=()
while read -d $'\0' file; do
  echo ${ignore_files[@]} | xargs -n 1 | grep -E "^$file$" > /dev/null
  if [ $? -ne 0 ]; then
    [[ ${file##*/} = *.zsh ]] && [ \( -f $file -o -h $file \) -a -r $file ] && initializeFiles+=("$file")
  fi
done < <(find -L $ZSHHOME -mindepth 1 -maxdepth 2 -print0)

files=(${firstInitializeFiles[*]} ${initializeFiles[*]} ${finalInitializeFiles[*]})

for i in $files; do
  source $i
done
