return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    -- quarto has no treesitter grammar of its own, so reuse markdown's
    vim.treesitter.language.register("markdown", "quarto")
  end,
  opts = function(_, opts)
    -- This system can't compile tree-sitter parsers (GLIBC too old).
    -- Remove any parsers that require compilation from source.
    local cant_compile = { latex = true, bibtex = true }
    opts.ensure_installed = vim.tbl_filter(function(lang)
      return not cant_compile[lang]
    end, opts.ensure_installed or {})
    return opts
  end,
}
