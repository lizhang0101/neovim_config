-- lua/ui.lua  — 轻定制 / 主题无关
local opt = vim.opt
opt.termguicolors = true

-- 不在这里设置任何 colorscheme，换主题时只改 :colorscheme 或插件开关

-- 诊断浮窗边框 & 虚拟文本前缀（任何主题都适用）
vim.diagnostic.config({
  float = { border = "rounded" },
  virtual_text = { prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- 用“缺省链接”统一一些常见 UI 元素的颜色，保持主题友好
vim.cmd([[
  hi! def link NormalFloat Normal
  hi! def link FloatBorder Comment
  hi! def link WinSeparator Comment
  hi! def link CursorLineNr WarningMsg
  " 缩进线（indent-blankline）若未定义，给个温和的回退
  hi! def link IblIndent Comment
  hi! def link IblScope  Identifier
]])

-- （可选）Telescope 的边框样式，不改颜色
pcall(function()
  local has_telescope, telescope = pcall(require, "telescope")
  if has_telescope then
    telescope.setup({
      defaults = {
        border = true,
        -- 不改配色，交给主题；这里只是开启边框
      },
    })
  end
end)
