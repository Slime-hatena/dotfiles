function _hgrep
  command hgrep $argv
end

function hgrep
  command hgrep --theme "Visual Studio Dark+" --term-width "$COLUMNS" "$argv" | less --raw-control-chars
end