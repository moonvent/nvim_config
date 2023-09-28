require('user.dap_configs')


vim.cmd('filetype plugin on')


map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    for k, v in pairs(opts or {}) do
        options[k] = v
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

python_mappings = function()
    map('n', '<Leader><F1>', "<cmd>lua require'dap'.run(LaunchAppConf)<cr>")
    map('n', '<Leader><F2>', "<cmd>lua require'dap'.run(LaunchFileConf)<cr>")
    map('n', '<Leader><F3>', "<cmd>lua require'dap'.run(DjangoConf)<cr>")
    map('n', '<Leader><F4>', "<cmd>lua require'dap'.run(DjangoConf3)<cr>")
end

godot_mappings = function()
    map('n', '<Leader><F1>', "<cmd>lua require'dap'.run(gdscript)<cr>")
end

-- Set up autocmds

vim.cmd('autocmd FileType python lua python_mappings()')
vim.cmd('autocmd FileType gdscript lua godot_mappings()')


return {
  n = {
    ["<leader>d"] = false,
    ["<leader>h"] = false,
    ["<leader>dr"] = false,
    ["<leader>dt"] = false,
    ["<leader>q"] = false,
    ["<leader>qw"] = { "<cmd>q<cr>", desc = "Quit from buffer" },
    ["<leader>wq"] = { "<cmd>wqa<cr>", desc = "Quit with saving session and buffers" },

    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", desc = "Debug: Continue" },

    ["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", desc = "Debug: Terminate" },

    ["<leader>dso"] = { "<cmd>lua require'dap'.step_out()<cr>", desc = "Debug: Step Out" },
    ["<leader>dsi"] = { "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug: Step Into" },

    ["<leader>dro"] = { "<cmd>lua require('dapui').open()<cr>", desc = "Debug: Open debug terminal" },
    ["<leader>drc"] = { "<cmd>lua require('dapui').close()<cr>", desc = "Debug: Close debug terminal" },
    ["<leader>drt"] = { "<cmd>lua require('dapui').toggle()<cr>", desc = "Debug: Toggle debug terminal" },

    ["<leader>dbc"] = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", desc = "Debug: Clear all breakpoints" },
    ["<leader>dbt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Debug: Toggle Breakpoint" },

    ["<leader>bp"] = { "<cmd>:b#<cr>", desc = "Buffer: Return to previous buffer in history" },
    ["<F1>"] = { "<cmd>let @+=expand('%')<cr>", desc = "Copy relative path of current opened in buffer file" },
    ["<F2>"] = { "<cmd>let @+=expand('%:p')<cr>", desc = "Copy relative path of current opened in buffer file" },
    
    -- ["<S-l>"] = { ']b', desc = "Buffer: Return to previous buffer in history" },
    -- ["<S-h>"] = { '[b', desc = "Buffer: Return to next buffer in history" },

    -- ["<S-k>"] = { vim.lsp.buf.hover, desc = "Buffer: Return to next buffer in history" },
    --
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },  },

}
