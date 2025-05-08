require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "clang-format" }
vim.lsp.enable(servers)
