local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup({
  ensure_installed = {
    "bash","c","css","cpp","go","html","java","javascript","json",
    "lua","markdown","markdown_inline","python","rust","tsx","typescript",
  },
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})

