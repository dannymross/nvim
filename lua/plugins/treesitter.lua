-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "javascript", "typescript", "lua", "markdown", "vim", "python" },
    highlight = { enable = true },
  },
}
