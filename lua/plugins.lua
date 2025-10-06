-- lua/plugins.lua
-- Modern replacements, all disabled by default. Flip toggles to true when ready.
local enable = {
  tree      = true,
  telescope = true,
  comments  = true,
  lualine   = true,
  indent    = true,
  hop       = true,
  markdown  = true,
  colors    = true,
}

require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = enable.tree,
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>n", function() vim.cmd("Neotree toggle") end, desc = "Neo-tree toggle" },
    },
    opts = { filesystem = { bind_to_cwd = true, follow_current_file = { enabled = true } }, window = { width = 32 } },
  },
  {
    "nvim-telescope/telescope.nvim",
    enabled = enable.telescope,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Grep (rg)" },
    },
    opts = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then pcall(telescope.load_extension, "fzf") end
      return { defaults = { mappings = { i = { ["<esc>"] = require("telescope.actions").close } } } }
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = enable.telescope, build = "make" },
  { "numToStr/Comment.nvim", enabled = enable.comments, opts = {} },
  {
    "nvim-lualine/lualine.nvim",
    enabled = enable.lualine,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "auto", section_separators = "", component_separators = "" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
  { "lukas-reineke/indent-blankline.nvim", enabled = enable.indent, main = "ibl", opts = { indent = { char = "│" }, scope = { enabled = false } } },
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
  { "plasticboy/vim-markdown", enabled = enable.markdown, ft = { "markdown" }, init = function() vim.g.vim_markdown_folding_disabled = 1 end },
  { "Mofiqul/dracula.nvim", enabled = enable.colors, priority = 1000, config = function() vim.cmd("colorscheme dracula") end },
}, { defaults = { lazy = true }, change_detection = { notify = false } })
