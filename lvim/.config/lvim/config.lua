lvim.colorscheme = "mellow"

vim.g.copilot_filetypes = { markdown = true } -- false by default
vim.opt.conceallevel = 1                      -- required by the obsidian plugin
vim.opt.guifont = "Iosevka:h17"
vim.opt.relativenumber = true
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

-- TODO Fix all the mess

lvim.builtin.which_key.mappings["t"] = {
    name = "+Terminal",
    v = { "<cmd>2ToggleTerm size=15 direction=vertical<cr>", "Split vertical" },
    h = { "<cmd>2ToggleTerm size=15 direction=horizontal<cr>", "Split horizontal" },

    -- Telescope plugins
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    f = { "<cmd>Telescope frecency<cr>", "Frecency" },
}
lvim.builtin.which_key.mappings["n"] = {
    name = "+VisualWhitespace",
    w = { "<cmd>lua require('visual-whitespace').toggle()<cr>", "Toggle" },
}
-- lvim.builtin.which_key.mappings["<character>"] = {
--     name = "+Session",
--     s = { "<cmd>SessionSave<cr>", "Save" },
--     l = { "<cmd>SessionLoad<cr>", "Load" },
-- }

lvim.builtin.terminal = {
    shell = "/usr/bin/fish",
}
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "frecency")
    pcall(telescope.load_extension, "project")
    -- any other extensions loading
end
lvim.transparent_window = false

-- tabline
local modes = {
    n = { "NORMAL", "" },
    niI = { "NORMAL i", "" },
    niR = { "NORMAL r", "" },
    niV = { "NORMAL v", "" },
    i = { "INSERT", "" },
    t = { "TERMINAL", "" },
    v = { "VISUAL", "" },
    V = { "V-LINE", "" },
    [""] = { "V-BLOCK", "" },
    R = { "REPLACE", "" },
    c = { "COMMAND", "" },
}
local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_info = modes[current_mode] or { "UNKNOWN", "" }
    return string.format("%s %s", mode_info[2], mode_info[1])
end
lvim.builtin.lualine.sections.lualine_a = { mode }

-- prefer tabs over spaces of 4 character indents
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

lvim.plugins = {
    {
        "catppuccin/nvim",
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
    },
    {
        "nvim-telescope/telescope-project.nvim",
        event = "BufWinEnter",
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    },
    {
        'akinsho/toggleterm.nvim',
        init = function()
            require("toggleterm").setup {}
        end
    },
    {
        'mcauley-penney/visual-whitespace.nvim',
        config = true
    },
    {
        "3rd/image.nvim",
        build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
        config = function()
            require("image").setup({
                backend = "kitty",
                processor = "magick_cli",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },
                    neorg = {
                        enabled = true,
                        filetypes = { "norg" },
                    },
                    typst = {
                        enabled = true,
                        filetypes = { "typst" },
                    },
                    html = {
                        enabled = false,
                    },
                    css = {
                        enabled = false,
                    },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
                editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
            })
        end
    },
    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = function()
            require('goto-preview').setup({
                width = 120,             -- Width of the floating window
                height = 25,             -- Height of the floating window
                default_mappings = true, -- Bind default mappings
                debug = false,           -- Print debug information
                opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil,    -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- default keybinds (don't uncomment, they are already in affect, read above)
                -- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
                -- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
                -- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
                -- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
                -- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
                -- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
            })
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end
    },
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end
    },
    {
        'datsfilipe/vesper.nvim',
        config = function()
            if lvim.transparent_window then
                require('vesper').setup({
                    transparent = true,
                })
            else
                require('vesper').setup({
                    transparent = false,
                })
            end
        end
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
        "mellow-theme/mellow.nvim",
        name = "mellow-theme",
    },
    {
        "wadackel/vim-dogrun"
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
                enable = false,         -- set to false to disable all additional syntax features
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
        "tpope/vim-surround",
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
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
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
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
