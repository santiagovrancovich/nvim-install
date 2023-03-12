local M = {}

M.ui = {
  theme = "gruvbox"
}

--Custom mappings and plugins
M.plugins = require "custom.plugin"
M.mappings = require "custom.core.mappings"
M.options = require "custom.core.options"

--Custom commands
vim.cmd "command! -nargs=* SS %s/<args>/gc"

return M
