local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 環境別の設定
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  --
elseif wezterm.target_triple == "x86_64-apple-darwin" then
  config.default_prog = { '/bin/bash', '--login' }
  config.window_decorations = "RESIZE"
  config.initial_rows = 240
  config.initial_cols = 800

elseif wezterm.target_triple == "aarch64-apple-darwin" then
  config.default_prog = { '/bin/bash', '--login' }

elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  config.default_prog = { '/bin/bash', '--login' }

end

config.term = 'wezterm'

-- theme list: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Catppuccin Latte'
-- config.color_scheme = 'Ayu Light (Gogh)'
-- color_scheme = "Ayu Mirage"
-- color_scheme = "nord"
-- color_scheme = 'ayu'
-- color_scheme = "Vs Code Dark+ (Gogh)"
config.font = wezterm.font_with_fallback({
  { family = "PleckJP" },
  { family = "PleckJP", assume_emoji_presentation = true },
})
config.cell_width = 1.1
config.line_height = 1.1
config.default_cursor_style = 'SteadyBar'

-- common settings
config.use_ime = true
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.automatically_reload_config = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.9

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- key bindings
config.disable_default_key_bindings = true
config.keys = require('keybinds').keys
config.key_tables = require('keybinds').key_tables
-- leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

return config
