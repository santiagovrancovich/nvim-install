local present, dap = pcall(require, "dap")
local present, dapui = pcall(require, "dapui")

if not present then
  return
end

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = "/home/" .. os.getenv("USER") .. "/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.adapters.python = {
  type = 'executable';
  command = "/home/" .. os.getenv("USER") .. "/.local/share/nvim/mason/bin/debugpy",
  args = { '-m', 'debugpy.adapter' };
}

-- Language configuration
dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  }
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- UI Setup and controls
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- Breakpoint character and color customization
vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ff0000'})
vim.fn.sign_define('DapBreakpoint', { text='⏺', texthl='DapBreakpoint'})
