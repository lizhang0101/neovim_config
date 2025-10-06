-- lua/autocmds.lua
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    vim.cmd('echom ">_<"')
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    -- 简单的 iabbrev 效果：输入 iff 立即变 if:
    -- 这里用 keymap 近似实现（插入模式下输入 'iff' -> 'if:'）
    vim.api.nvim_buf_set_keymap(args.buf, "i", "iff", "if:", { noremap = true })
  end,
})
