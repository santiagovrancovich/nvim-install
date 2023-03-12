-- lua/custom/mappings 
local M = {}

M.general = {
  n = {
     ["<C-a>"] = {"ggVG", "Select all text"},
     ["<F5>"] = {"<Cmd>lua require'dap'.continue()<CR>", "Run DAP client"},
     ["<F6>"] = {"<Cmd>lua require'dap'.terminate()<CR>", "Terminate DAP client"},
     ["<F7>"] = {"<Cmd>lua require'dap'.restart()<CR>", "Restart current DAP session"},
     ["<F10>"] = {"<Cmd>lua require'dap'.step_over()<CR>", "DAP Step over"},
     ["<F11>"] = {"<Cmd>lua require'dap'.step_into()<CR>", "DAP Step into"},
     ["<F12>"] = {"<Cmd>lua require'dap'.step_out()<CR>", "DAP Step out"},
     ["<C-D>"] = {"<Cmd>lua require'dapui'.toggle()<CR>", "Toggle DAP UI"},
     ["<C-b>"] = {"<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint"},
  }
}

return M
