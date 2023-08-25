local menubar = require "menubar"

terminal = "wezterm"
explorer = "thunar"
browser = "brave"
launcher = "rofi -show drun"
editor = "neovide"
visual_editor = "code" -- vscode
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4" -- super, the windows key

-- Set the terminal for applications that require it
menubar.utils.terminal = terminal
