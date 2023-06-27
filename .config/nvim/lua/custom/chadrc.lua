---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'catppuccin',
  theme_toggle = { "catppuccin", "nord"},

  -- transparency = true,

  nvdash = {
    load_on_startup = true,
    header = {
      [[⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠉⠙⠲⡀     ]],
      [[⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀ ⢳⡀⠀⡏⠀⠀⠀⠀   ⢷    ]],
      [[⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀ ⣧⠀⢸⠀⠀⠀     ⡇   ]],
      [[⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲ ⣿⠀⣸⠀Sauce? ⡇   ]],
      [[⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀ ⣿⠀⢹⠀⠀⠀⠀    ⡇   ]],
      [[⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀    ⡼    ]],
      [[⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⣄⣠⣄⠞⠀    ]],
      [[⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ]],
      [[⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀      ]],
      [[⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀      ]],
      [[⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀      ]],
      [[⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀⠀        ]],
    },
    buttons = {
      { "󰊳 Update", "Spc u u", "Lazy update" },
      { "󰈞  Find Project", "Spc f p", "Telescope project" },
      { "  File Browser", "c d    ", "Telescope file_browser" },
      { "󰈭  Global Search", "Spc f w", "Telescope live_grep" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰔫 Diagnostics", "Spc t  ", "TroubleToggle"},
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}



M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
