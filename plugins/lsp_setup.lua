local nvim_lsp = require('lspconfig')

local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/Users/nikitakurkurin/Documents/omnisharp-linux-arm64/run"

require('lspconfig').omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
    root_dir = nvim_lsp.util.root_pattern("*.csproj","*.sln");
    ...
}

return {}
