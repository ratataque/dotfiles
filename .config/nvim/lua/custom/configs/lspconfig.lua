local config = require("plugins.configs.lspconfig")
local util = require("lspconfig.util")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  -- root_dir = function(fname)
  --   return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
  --   util.path.dirname(fname)
  -- end
})

lspconfig.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
  root_dir = function()
    return vim.loop.cwd()
  end;
})

-- lspconfig.eslint.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "javascript" },
--   root_dir = function()
--     return vim.loop.cwd()
--   end;
-- })

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript" },
  root_dir = function()
    return vim.loop.cwd()
  end;
})
