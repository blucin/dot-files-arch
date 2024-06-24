-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "catppuccin-mocha"

vim.g.copilot_filetypes = { markdown = true } -- false by default
vim.opt.guifont = "Iosevka:h17"
vim.opt.relativenumber = true
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.transparent_window = true

lvim.plugins = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }, {
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
  --   Old typst config
--   {
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
},{
    'justinmk/vim-sneak',
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    name = "oxocarbon",
  }, {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
}, {
  "EdenEast/nightfox.nvim",
  name = "nightfox-theme",
},
  { "xiyaowong/transparent.nvim" },
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {
  "windwp/nvim-ts-autotag",
  config = function()
    require("nvim-ts-autotag").setup()
  end,
},{
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
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
}
