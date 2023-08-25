local ruled = require("ruled")
local awful = require("awful")

local function setup_rules()
  ruled.client.connect_signal("request::rules", function()
    -- Workspaces
    ruled.client.append_rule({
      rule_any = { class = { "Code", "code", "neovide" } },
      properties = { tag = "1", switchtotag = true },
    })
    ruled.client.append_rule({
      rule_any = { class = { "Brave-browser", "brave-browser", "Navigator", "firefox" } },
      properties = { tag = "2", switchtotag = true },
    })

    ruled.client.append_rule({
      rule_any = { class = { "thunar", "Thunar" } },
      properties = { tag = "3", switchtotag = true },
    })

    ruled.client.append_rule({
      rule_any = { class = { "Alacritty", "kitty", "org.wezfurlong.wezterm" } },
      properties = { tag = "4", switchtotag = true },
    })

    ruled.client.append_rule({
      rule_any = { class = { "vlc", "Vlc" } },
      properties = { tag = "5", switchtotag = true },
    })

    ruled.client.append_rule({
      rule_any = { class = {"Element", "telegram-desktop", "TelegramDesktop", "whatsapp-for-linux", "Whatsapp-for-linux" } },
      properties = { tag = "6", switchtotag = true },
    })

    ruled.client.append_rule({
      id = "global",
      rule = {},
      properties = {
        focus = awful.client.focus.filter,
        raise = true,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      },
    })
    ruled.client.append_rule({
      id = "floating",
      rule_any = {
        instance = { "copyq", "pinentry" },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "Sxiv",
          "Tor Browser",
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
        },
        name = {
          "Event Tester", -- xev.
        },
        role = {
          "AlarmWindow", -- Thunderbird's calendar.
          "ConfigManager", -- Thunderbird's about:config.
          "pop-up",   -- e.g. Google Chrome's (detached) Developer Tools.
        },
      },
      properties = { floating = true },
    })
    ruled.client.append_rule({
      id = "titlebars",
      rule_any = { type = { "normal", "dialog" } },
      properties = { titlebars_enabled = true },
    })
  end)

  ruled.notification.connect_signal("request::rules", function()
    ruled.notification.append_rule({
      rule = {},
      properties = {
        screen = awful.screen.preferred,
        implicit_timeout = 5,
      },
    })
  end)
end

setup_rules()
