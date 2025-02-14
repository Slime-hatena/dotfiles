local wezterm = require 'wezterm';

-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)

return {
  term = 'wezterm',
  default_prog = { '/bin/bash', '--login' },
  -- window fullscreen (alwayz fullsize window)
  -- window_decorations = "TITLE | RESIZE",
  window_decorations = "RESIZE",
  initial_rows = 240,
  initial_cols = 800,

  -- theme list: https://wezfurlong.org/wezterm/colorschemes/index.html
  -- color_scheme = "Ayu Mirage",
  -- color_scheme = "nord",
  color_scheme = 'ayu',
  -- color_scheme = "Vs Code Dark+ (Gogh)",
  font = wezterm.font_with_fallback({
    { family = "PleckJP" },
    { family = "PleckJP", assume_emoji_presentation = true },
  }),
  cell_width = 1.1,
	line_height = 1.1,
  default_cursor_style = 'SteadyBar',

  -- common settings
  use_ime = true,
  font_size = 16.0,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  automatically_reload_config = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  window_background_opacity = 0.75,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  -- key bindings
  disable_default_key_bindings = true,
  keys = require('keybinds').keys,
  key_tables = require('keybinds').key_tables
  -- leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
}
