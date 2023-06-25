local M = {}

M.text = {
  i = {
    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
  },

  n = {
    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
  },

  v = {
    ["<C-Up>"] = { ":m'<-2<CR>gv=gv", "󰜸 Move selection up", opts = { silent = true } },
    ["<C-Down>"] = { ":m'>+1<CR>gv=gv", "󰜯 Move selection down", opts = { silent = true } },
  },

  c = {
    ["<C-j>"] = { "<C-n>", "nav next "},
    ["<C-k>"] = { "<C-p>", "nav prev "},
  },
}

M.general = {
  i = {
    ["<A-r>"] = { "<cmd> tabnew<CR>", "New tab" },
    ["<C-h>"] = { "<Backspace>", "Backspace" },
  },

  n = {
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },

    ["<A-e>"] = { "<cmd> q<CR>", "Exit" },

    ["<A-r>"] = { "<cmd> tabnew<CR>", "New tab" },
    ["<C-j>"] = { "<cmd> tabnext<CR>", "Next tab" },
    ["<C-k>"] = { "<cmd> tabprevious<CR>", "Previous tab" },

    ["<leader>uu"] = { "<cmd> Lazy update<CR>", "Lazy upadate" },
  }
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.git = {
  n = {
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "  Git commits" },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "  Git branches" },
    ["<leader>gs"] = { "<cmd>Telescope git_status<CR>", "  Git status" },
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "  LazyGit" },
    ["<leader>gl"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "  Blame line",
    },
    ["<leader>gvd"] = { "<cmd> DiffviewOpen<CR>", "  Show git diff" },
    ["<leader>gvf"] = { "<cmd> DiffviewFileHistory %<CR>", "  Show file history" },
    ["<leader>gvp"] = { "<cmd> DiffviewOpen --cached<CR>", "  Show staged diffs" },
    ["<leader>gvr"] = { "<cmd> DiffviewRefresh<CR>", "  Refresh diff view" },
    ["<leader>gvc"] = { "<cmd> DiffviewClose<CR>", "  Close diff view" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", " Find keymaps" },
    ["<leader>."] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>/"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    ["cd"] = { "<cmd> Telescope file_browser <CR>", "file browser in cwd" },

    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

return M
