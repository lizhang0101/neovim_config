-- lua/autocmds.lua

-- 新文件提示（原有）
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    vim.cmd('echom ">_<"')
  end,
})

-- python: iff -> if:
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    vim.api.nvim_buf_set_keymap(args.buf, "i", "iff", "if:", { noremap = true })
  end,
})

-- 复制高亮
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 }) end,
})

-- 终端 buffer 体验（可选但舒服）
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})
