local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "nvim-tree/nvim-tree.lua",
    -- lazy = false,
  },
  {
    "gennaro-tedesco/nvim-possession",
    lazy = false,
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("nvim-possession").setup {
        autoload = false,
        sessions = {
          sessions_icon = "",
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp
  },

  {
    "ratataque/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        show_hidden = true,
        ignore_gitignore = true,
      }
    end
  },
}
return plugins
