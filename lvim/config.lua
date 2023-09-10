-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "catppuccin-macchiato"

-- global options
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_general_options = "--unique file:@pdf\027#src:@line@tex"
vim.g.tex_flavor = "latex"
vim.g.copilot_filetypes = {markdown = true} -- false by default

-- Setters
vim.opt.relativenumber = true

-- keybinds 
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Split vertical" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Split horizontal" },
}

-- Additional Plugins
lvim.plugins = {
  { 
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      -- copilot assume mapped 
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
    end,
  },{
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },{
    "lervag/vimtex",
    ft = "tex",
  },
  { "lunarvim/colorschemes" },
  { "catppuccin/nvim" },
}
