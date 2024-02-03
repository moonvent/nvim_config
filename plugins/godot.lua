vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.gd",
    callback = function()
        -- Set the indentation specifics here
        vim.bo.expandtab = true -- Use spaces instead of tabs
        vim.bo.shiftwidth = 4   -- Number of spaces to use for each step of (auto)indent
        vim.bo.tabstop = 4      -- Number of spaces that a <Tab> in the file counts for
        vim.bo.softtabstop = 4  -- See :help softtabstop
    end
})


return {}
