# slime-hatena/dotfiles/WezTerm

[WezTerm](https://wezfurlong.org/wezterm/)

## install

```sh { name=wezterm-install }
tempfile=$(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wezterm/wezterm/main/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile

mkdir -p ~/.config/wezterm/
ln -nfs ~/.dotfiles/env/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -nfs ~/.dotfiles/env/wezterm/keybinds.lua ~/.config/wezterm/keybinds.lua
```
