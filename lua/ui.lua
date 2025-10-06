-- lua/ui.lua
local opt = vim.opt
opt.termguicolors = true
local ok,_ = pcall(vim.cmd, "colorscheme habamax")
if not ok then pcall(vim.cmd, "colorscheme default") end
vim.cmd([[
  highlight clear SignColumn
  highlight clear LineNr
]])
