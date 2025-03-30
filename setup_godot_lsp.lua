require("lspconfig")["gdscript"].setup({
  name = "godot",
  cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
})

return {}
