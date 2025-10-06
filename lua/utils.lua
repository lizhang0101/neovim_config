-- lua/utils.lua
local M = {}

function M.toggle_bg()
  local bg = vim.opt.background:get()
  if bg == "dark" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end

vim.keymap.set("n", "<leader>bg", function() M.toggle_bg() end, { desc = "Toggle background" })
return M
