require('user.dap_configs')

return {
  n = {
    ["<leader>dd"] = { "<cmd>q<cr>", desc = "Quit" },
    ["<leader>d"] = false,
    ["<leader>dr"] = false,
    ["<leader>dt"] = false,

    ["<leader>drd"] = { "<cmd>lua require'dap'.run(DjangoConf)<cr>", desc = "Debug: Run Django conf" },
    ["<leader>drx"] = { "<cmd>lua require'dap'.run(DockerFastApi)<cr>", desc = "Debug: Run Django conf" },
    ["<leader>drf"] = { "<cmd>lua require'dap'.run(LaunchFileConf)<cr>", desc = "Debug: Run file conf" },
    ["<leader>dra"] = { "<cmd>lua require'dap'.run(LaunchAppConf)<cr>", desc = "Debug: Run main file from poetry" },
    -- ["<leader>drx"] = { "<cmd>lua require'dap'.run(XLabFormDebugDocker)<cr>", desc = "Debug: Run xlab forms debugging" },
    -- ["<leader>drx"] = { "<cmd>lua require'dap.repl'.omnifunc<cr>", desc = "Debug: Run last session" },

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
    
    ["<S-l>"] = { '<cmd>BufferLineCycleNext<cr>', desc = "Buffer: Return to previous buffer in history" },
    ["<S-h>"] = { '<cmd>BufferLineCyclePrev<cr>', desc = "Buffer: Return to next buffer in history" },

    -- ["<S-k>"] = { vim.lsp.buf.hover, desc = "Buffer: Return to next buffer in history" },
  },
}
