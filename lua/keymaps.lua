-- lua/keymaps.lua
local map = vim.keymap.set

map("i", "<C-u>", "<esc>viwUi", { desc = "Uppercase current word" })
map("i", "jk", "<esc>", { desc = "Exit insert mode" })

map("n", "<leader>w", ":w!<CR>", { silent = true, desc = "Write file" })
map("n", "<leader>cd", ":cd %:p:h<CR>", { silent = true, desc = "cd to buffer dir" })

map("n", "<leader>s", ":source $MYVIMRC<CR>", { silent = true, desc = "Source init.lua" })
map("n", "<leader>e", ":e ~/.config/nvim/init.lua<CR>", { silent = true, desc = "Edit init.lua" })

map("n", "<C-J>", "<C-W>j<C-W>_", { silent = true })
map("n", "<C-K>", "<C-W>k<C-W>_", { silent = true })
map("n", "<C-L>", "<C-W>l<C-W>_", { silent = true })
map("n", "<C-H>", "<C-W>h<C-W>_", { silent = true })

map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })
map("n", "Y", "y$", { noremap = true })

map("n", "<leader>/", ":set invhlsearch<CR>", { silent = true, desc = "Toggle hlsearch" })
map("n", "<leader>bn", ":bn<CR>", { silent = true, desc = "Next buffer" })
map("n", "<leader>bp", ":bp<CR>", { silent = true, desc = "Prev buffer" })

map("n", "<leader>dt", function()
  local ts = os.date("%d/%m/%y %H:%M:%S")
  vim.fn.setreg('"', ts)
  vim.api.nvim_feedkeys('p', 'n', false)
end, { desc = "Paste date/time" })
