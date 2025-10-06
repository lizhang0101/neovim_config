-- lua/settings.lua  （优化与个性化版）
-- 目标：Ubuntu 终端；UTF-8 中文；无 GUI；稳定优先

local opt = vim.opt
local g   = vim.g

-- ===== 性能：新 Lua 模块加载器（0.9+ 可用，安全启用）=====
pcall(function() vim.loader.enable() end)

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
pcall(function() opt.shortmess:append("filmnrxoOtT") end)
opt.history = 1000
opt.hidden  = true

-- iskeyword 删除项（用 :set 方式）
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
opt.whichwrap = "b,s,h,l,<,>,[,]"
opt.scrolloff = 3
opt.winminheight = 0
opt.signcolumn = "auto:2"   -- 避免诊断/折叠标记抖动
opt.lazyredraw = true       -- 批量重绘更顺滑
opt.updatetime = 200        -- CursorHold 响应更快
opt.timeoutlen = 400        -- 连按映射更灵敏

-- ===== UI 显示 =====
opt.number       = true
opt.relativenumber = false   -- 需要可用 <leader>rl 切换（见 keymaps）
opt.showmatch    = true
opt.showmode     = true
opt.cursorline   = true
opt.linebreak    = true
opt.foldenable   = true
opt.foldmethod   = "marker"

-- 命令行/状态行（0.9+ 才有 cmdheight=0；做兼容）
opt.ruler   = true
opt.showcmd = true
opt.laststatus = 2
if vim.fn.has("nvim-0.9") == 1 then
  vim.o.cmdheight = 0
else
  vim.o.cmdheight = 1
end
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

-- 目录（如遇工具冲突可注释）
opt.autochdir = true

-- Leader
g.mapleader = ","

-- iabbrev
vim.cmd([[iabbrev @@ lizhang0101@gmail.com]])

-- ===== 诊断显示（即使未启用 LSP，也安全）=====
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Provider 全禁用（按你的需求）
g.loaded_python3_provider = 0
g.loaded_node_provider    = 0
g.loaded_ruby_provider    = 0
g.loaded_perl_provider    = 0
