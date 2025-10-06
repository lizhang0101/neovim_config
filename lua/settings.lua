-- lua/settings.lua  （Neovim 兼容版，插件全禁用）
-- 目标：Ubuntu 22.04 终端环境；UTF-8；显示/输入中文；不启用 LSP/TS

local opt = vim.opt
local g   = vim.g

-- ===== 编码 / 剪贴板 =====
opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "gbk", "gb2312", "gb18030", "latin1" }

if vim.fn.has("clipboard") == 1 then
  if vim.fn.has("unnamedplus") == 1 then
    opt.clipboard = "unnamed,unnamedplus"
  else
    opt.clipboard = "unnamed"
  end
end

-- ===== 基本开关 =====
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
opt.mouse = "a"
-- Neovim 不支持 mousehide，已移除

-- 简洁消息
pcall(function() opt.shortmess:append("filmnrxoOtT") end)

-- viewoptions：使用默认（保守）；如需可启用下行：
-- opt.viewoptions = { "folds", "cursor", "options" }

opt.history = 1000
opt.hidden  = true

-- iskeyword 删除项（用 :set 兼容方式）
vim.cmd("set iskeyword-=" .. "\\.")
vim.cmd("set iskeyword-=#")
vim.cmd("set iskeyword-=-")

-- 备份/交换文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- ===== 搜索 =====
opt.ignorecase = true
opt.smartcase  = true
opt.incsearch  = true
opt.hlsearch   = true
vim.cmd("highlight Search ctermfg=0 ctermbg=13")

-- ===== 窗口/移动 =====
opt.whichwrap = "b,s,h,l,<,>,[,]"  -- 注意逗号位置
-- Neovim 不支持 scrolljump
-- opt.scrolljump = 5
opt.scrolloff = 3
opt.winminheight = 0

-- ===== UI 显示 =====
opt.number     = true
opt.showmatch  = true
opt.showmode   = true
opt.cursorline = true
opt.linebreak  = true
opt.foldenable = true
opt.foldmethod = "marker"

-- 命令行/状态行
opt.ruler  = true
opt.showcmd = true
opt.laststatus = 2
vim.o.cmdheight = 1
vim.o.statusline = table.concat({
  "%<%f",
  " %w%h%m%r",
  " [%{&ff}/%Y]",
  " [%{getcwd()}]",
  " %=%l,%c %p%%"
})

-- ===== 缩进/Tab =====
opt.autoindent  = true
opt.shiftwidth  = 4
opt.expandtab   = true
opt.smarttab    = true
opt.tabstop     = 4
opt.softtabstop = 4
opt.joinspaces  = false
opt.splitright  = true
opt.splitbelow  = true
-- Vim 的 'so' 简写在 Neovim 不存在
-- opt.so = 7
-- opt.pastetoggle = "<F12>"
opt.colorcolumn = "81"

-- 指定文件类型的 2 空格缩进
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css" },
  callback = function()
    vim.opt_local.tabstop     = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth  = 2
  end,
})

-- 目录
opt.autochdir = true

-- Leader
g.mapleader = ","

-- iabbrev
vim.cmd([[iabbrev @@ lizhang0101@gmail.com]])

-- Provider 全禁用
g.loaded_python3_provider = 0
g.loaded_node_provider    = 0
g.loaded_ruby_provider    = 0
g.loaded_perl_provider    = 0
