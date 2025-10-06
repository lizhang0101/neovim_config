-- lua/plugins.lua
-- Modern replacements & personalization

local enable = {
  tree      = true,   -- 你现在已启用，可按需改 false
  telescope = true,
  comments  = true,
  lualine   = true,
  indent    = true,
  hop       = true,
  markdown  = true,
  colors    = true,
}

require("lazy").setup({
  -- ========== 文件树：neo-tree ==========
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = enable.tree,
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>n", function() vim.cmd("Neotree toggle") end, desc = "Neo-tree toggle" },
    },
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        filtered_items = { visible = false, hide_dotfiles = false, hide_gitignored = true },
      },
      default_component_configs = {
        git_status = { symbols = { added = "A", modified = "M", deleted = "D", renamed = "R" } },
      },
      window = { width = 32 },
    },
    init = function()
      -- 禁用 netrw（避免与文件树冲突）
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  -- ========== 搜索：telescope ==========
  {
    "nvim-telescope/telescope.nvim",
    enabled = enable.telescope,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "Find files" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Grep (rg)" },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = { i = { ["<esc>"] = actions.close } },
          file_ignore_patterns = { "%.git/", "node_modules/", "dist/", "build/" },
        },
        pickers = {
          find_files = { hidden = true },
        },
      }
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = enable.telescope, build = "make", config = function() pcall(require("telescope").load_extension, "fzf") end },

  -- ========== 注释：Comment.nvim ==========
  { "numToStr/Comment.nvim", enabled = enable.comments, opts = {} },

  -- ========== 状态栏：lualine ==========
  {
    "nvim-lualine/lualine.nvim",
    enabled = enable.lualine,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "auto", section_separators = "", component_separators = "" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },     -- path=1：相对路径
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- ========== 缩进线：indent-blankline ==========
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = enable.indent,
    main = "ibl",
    opts = { indent = { char = "│" }, scope = { enabled = false } },
  },

  -- ========== 快速跳转：hop ==========
  {
    "smoka7/hop.nvim",
    enabled = enable.hop,
    version = "*",
    opts = {},
    keys = {
      { "<leader><leader>w", function() require("hop").hint_words() end,  desc = "Hop words" },
      { "<leader><leader>l", function() require("hop").hint_lines() end,  desc = "Hop lines" },
      { "<leader><leader>c", function() require("hop").hint_char1() end,  desc = "Hop char" },
    },
  },

  -- ========== Markdown ==========
  {
    "plasticboy/vim-markdown",
    enabled = enable.markdown,
    ft = { "markdown" },
    init = function()
      vim.g.vim_markdown_folding_disabled = 1
    end
  },

  -- ========== Dracula 主题（可选）==========
  {
    "Mofiqul/dracula.nvim",
    enabled = enable.colors,
    priority = 1000,
    config = function() vim.cmd("colorscheme dracula") end,
  },
}, {
  defaults = { lazy = true },
  change_detection = { notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin",
        "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})
