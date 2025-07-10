require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"texlab", "lua_ls", "clangd", "jdtls", "marksman"}
})
