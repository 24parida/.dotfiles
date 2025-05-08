require "nvchad.mappings"
-- add yours e
local map = vim.keymap.set

---
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Debugging --
-- DAP breakpoint + stepping
vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: toggle breakpoint" })
vim.keymap.set("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "DAP: step over" })
vim.keymap.set("n", "<leader>ds", function()
  require("dap").step_into()
end, { desc = "DAP: step into" })
vim.keymap.set("n", "<leader>du", function()
  require("dap").step_out()
end, { desc = "DAP: step out" })
vim.keymap.set("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "DAP: start/continue" })

-- vim.keymap.set("n", "<leader>dui", function()
--   require("dapui").toggle()
-- end, { desc = "DAP-UI: toggle sidebar" })

-- MACROS --
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
vim.fn.setreg("n", "i<< '\\n';" .. esc .. "")
