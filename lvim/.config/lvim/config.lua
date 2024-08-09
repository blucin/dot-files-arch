-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "github_dark"

vim.g.copilot_filetypes = { markdown = true } -- false by default
vim.opt.guifont = "Iosevka:h17"
vim.opt.relativenumber = true
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
-- lvim.transparent_window = true

-- lsp overrides (run :LvimCacheReset after adding an entry here)
-- 1. Use tinymist over typst-lsp
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "typst-lsp", "typst_lsp", "typst" })
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(
--   function(server)
--     return server ~= "tinymist"
--   end,
--   lvim.lsp.automatic_configuration.skipped_servers)


lvim.plugins = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme "catppuccin-mocha"
    -- end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end
  },
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '0.3.*',
    build = function() require 'typst-preview'.update() end,
  },
  --   Old typst config {
  --   'kaarmu/typst.vim',
  --   ft = 'typst',
  --   lazy=false,
  --   config = function()
  --     -- vim.g.typst_pdf_viewer = 'evince'
  --     vim.g.typst_pdf_viewer = 'zathura'
  --   end
  -- },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
    },
    config = function()
      require("scrollbar").setup()
    end
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox-theme",
  },
  {
    "Biscuit-Theme/nvim",
    name = "biscuit-theme",
  },
  {
    "DanielEliasib/sweet-fusion",
    name = 'sweet-fusion',
    priority = 1000,
    opts = {
      -- Set transparent background
      -- transparency = true,
      dim_inactive = true,
      hl_styles = {
        comments = { italic = true },
        keywords = { bold = true },
      },
    }
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",   -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
      lang = "python3",
    },
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },
  -- { "justinmk/vim-sneak" }, -- replaced by leap
  { 
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
      -- Define equivalence classes for brackets and quotes, in addition to
      -- the default whitespace group.
      require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

      -- Use the traversal keys to repeat the previous motion without explicitly
      -- invoking Leap.
      require('leap.user').set_repeat_keys('<enter>', '<backspace>')
    end
  },
  { "xiyaowong/transparent.nvim" },
  { "ellisonleao/glow.nvim",               config = true, cmd = "Glow" },
}
