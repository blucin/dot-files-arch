-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.colorscheme = "vesper"

vim.g.copilot_filetypes = { markdown = true } -- false by default
vim.opt.conceallevel = 1                      -- required by the obsidian plugin
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
  { 'datsfilipe/vesper.nvim' },
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
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup({})
    end
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "primary",
          path = "~/Sync/Obsidian",
        },
      },

      -- see below for full list of options 👇
      notes_subdir = "Zettelkasten",
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
      -- way then set 'mappings = {}'.
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        }
      },
      new_notes_location = "notes_subdir",

      -- Optional, configure additional syntax highlighting / extmarks.
      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
      ui = {
        enable = true,          -- set to false to disable all additional syntax features
        update_debounce = 200,  -- update delay after a text change (in milliseconds)
        max_file_length = 5000, -- disable UI features for files with more than this many lines
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
          -- Replace the above with this if you don't have a patched font:
          -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = "ObsidianRefText" },
        highlight_text = { hl_group = "ObsidianHighlightText" },
        tags = { hl_group = "ObsidianTag" },
        block_ids = { hl_group = "ObsidianBlockID" },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianImportant = { bold = true, fg = "#d73128" },
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianBlockID = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
      },

      -- images folder
      attachments = {
        img_folder = "Files",
      },
    },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
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
  { "ellisonleao/glow.nvim",     config = true, cmd = "Glow" },
}
