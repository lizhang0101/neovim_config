-- lua/keymaps.lua
local map = vim.keymap.set

-- 插入态
map("i", "<C-u>", "<esc>viwUi", { desc = "Uppercase current word" })
map("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- 保存 / 目录
map("n", "<leader>w", ":w!<CR>", { silent = true, desc = "Write file" })
map("n", "<leader>cd", ":cd %:p:h<CR>", { silent = true, desc = "cd to buffer dir" })

-- 重新加载/编辑配置
map("n", "<leader>s", ":source $MYVIMRC<CR>", { silent = true, desc = "Source init.lua" })
map("n", "<leader>e", ":e ~/.config/nvim/init.lua<CR>", { silent = true, desc = "Edit init.lua" })

-- 窗口移动
map("n", "<C-J>", "<C-W>j<C-W>_", { silent = true })
map("n", "<C-K>", "<C-W>k<C-W>_", { silent = true })
map("n", "<C-L>", "<C-W>l<C-W>_", { silent = true })
map("n", "<C-H>", "<C-W>h<C-W>_", { silent = true })

-- 软换行按屏幕行移动
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })
map("n", "Y", "y$", { noremap = true })

-- 切换搜索高亮
map("n", "<leader>/", ":set invhlsearch<CR>", { silent = true, desc = "Toggle hlsearch" })

-- Buffer
map("n", "<leader>bn", ":bn<CR>", { silent = true, desc = "Next buffer" })
map("n", "<leader>bp", ":bp<CR>", { silent = true, desc = "Prev buffer" })

-- 时间戳
map("n", "<leader>dt", function()
  local ts = os.date("%d/%m/%y %H:%M:%S")
  vim.fn.setreg('"', ts)
  vim.api.nvim_feedkeys('p', 'n', false)
end, { desc = "Paste date/time" })

-- ===== 你的 TODO：Quickfix 键位 =====
map("n", "]q", ":cnext<CR>", { silent = true, desc = "Quickfix next" })
map("n", "[q", ":cprev<CR>", { silent = true, desc = "Quickfix prev" })
map("n", "<leader>qo", ":copen<CR>", { silent = true, desc = "Quickfix open" })
map("n", "<leader>qc", ":cclose<CR>", { silent = true, desc = "Quickfix close" })

-- ===== 常用开关 =====
map("n", "<leader>tw", ":set invwrap<CR>",        { silent = true, desc = "Toggle wrap" })
map("n", "<leader>rl", ":set invrelativenumber<CR>", { silent = true, desc = "Toggle relativenumber" })
map("n", "<leader>cl", ":set invcursorline<CR>",  { silent = true, desc = "Toggle cursorline" })
