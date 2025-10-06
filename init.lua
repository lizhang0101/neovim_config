-- Neovim init.lua (migration v2: lazy.nvim scaffold; all plugins disabled by default)
require("settings")
require("keymaps")
require("autocmds")
require("ui")
require("utils")

-- === lazy.nvim bootstrap ===
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")
