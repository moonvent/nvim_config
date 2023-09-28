local nvim_lsp = require('lspconfig')


-- require('lspconfig').pylsp.setup{
--     -- pylsp = {  
--     --   plugins = {
--     --     autopep8 = {enabled = false},
--     --     yapf = {enabled = false,
--     --                 based_on_style="google", indent_width=2},
--     --     black = {enabed = false},
--     --     pycodestyle = {enabled = false, indentSize=2, maxLineLength=80},
--     --   },
--     -- },
-- }

local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/Users/nikitakurkurin/Documents/omnisharp-linux-arm64/run"


require('lspconfig').omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
    root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln");
    -- handlers = {
    --   ["textDocument/publishDiagnostics"] = function() end,
    -- };
    -- ...
}


require'lspconfig'.gdscript.setup{}


return {}
