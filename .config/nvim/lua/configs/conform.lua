local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c_pp = { "clang-format"},
    cpp = { "clang_format" },
    c = { "clang_format" },
    css = { "prettier" },
    html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
