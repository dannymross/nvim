return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    on_colors = function(colors)
      colors.bg = "#000000"
      colors.bg_dark = "#000000"
      colors.yellow = "#bb9af7"
      colors.orange = "#9d7cd8"
    end,
    on_highlights = function(hl, _)
      hl.RenderMarkdownCode = { bg = "#000000" }
      hl["@markup.raw.block"] = { bg = "#000000" }
      hl.RCodeBlock = { bg = "#000000" }
      hl.String = { fg = "#bb9af7" }
      hl["@string"] = { fg = "#bb9af7" }
      hl["@variable"] = { fg = "#7aa2f7" }
      hl["@variable.parameter"] = { fg = "#7aa2f7" }
      hl["Function"] = { fg = "#89ddff" }
      hl["@function"] = { fg = "#89ddff" }
      hl["@function.call"] = { fg = "#89ddff" }
      hl["@function.method"] = { fg = "#89ddff" }
      hl["@function.method.call"] = { fg = "#89ddff" }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
