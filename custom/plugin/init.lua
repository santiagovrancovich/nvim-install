return {
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = { "clangd", "python-lsp-server", "lua-language-server", "debugpy", "cpptools" }
    }
  },
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = {
      renderer = {
        icons = {
          show ={
            folder = false
          }
        }
      }
    }
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_installed = { "c", "lua", "python", "bash" }
    }
  },
  ["mfussenegger/nvim-dap"] = {
  },
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    config = function()
      require("custom.plugin.dap")
    end,
  },
}
