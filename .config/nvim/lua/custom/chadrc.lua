---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'catppuccin',
  theme_toggle = { "catppuccin", "nord"},

  hl_override = {
    ["Normal"] = { bg = "NONE"},
    ["NormalFloat"] = { bg = "NONE"},
  --   ["NvimTreeNormal"] = { bg = "NONE"},
  },

  statusline = {
    overriden_modules = function()
      -- local st_modules = require "nvchad_ui.statusline.vscode_colored"
      -- Load info for harpoon
      local function get_marked()
        local Marked = require "harpoon.mark"
        local filename = vim.api.nvim_buf_get_name(0)
        local success, index = pcall(Marked.get_index_of, filename)
        if success and index and index ~= nil then
          return "󱡀 " .. index .. " "
        else
          return ""
        end
      end
      -- Load info for possession
      local function get_session()
        local session = require("nvim-possession").status()
        if session ~= nil then
          return "󰐃 "
        else
          return "󰐄 "
        end
      end

      return {
        LSP_Diagnostics = function()
          return "%#HarpoonHl#"
            .. get_marked()
            -- .. "%#BatteryHl#"
            -- .. require("battery").get_status_line()
            -- .. " "
            .. "%#SessionHl#"
            .. get_session()
            .. " "
        end,
      }
    end,
  },

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
