-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- disable spellcheck-by-default for text filetypes, keep the wrap part
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "quarto", "rmd", "r" },
  callback = function()
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "RCodeBlock", { bg = "NONE" })
    end)
  end,
})

-- force a full parse so injected code-chunk languages resolve everywhere, not just near the top
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto", "rmd" },
  callback = function(ev)
    local ok, parser = pcall(vim.treesitter.get_parser, ev.buf)
    if ok and parser then
      pcall(parser.parse, parser, true)
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "*.pdf",
  callback = function(args)
    vim.fn.jobstart({ "open", "-a", "Skim", args.file }, { detach = true })

    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(args.buf) then
        vim.cmd("enew") -- switch to empty buffer first
        vim.cmd("bdelete " .. args.buf)
      end
    end)
  end,
})
