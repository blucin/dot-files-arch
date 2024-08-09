-- mappings
vim.cmd("noremap <Up> <Nop>")
vim.cmd("noremap <Down> <Nop>")
vim.cmd("noremap <Left> <Nop>")
vim.cmd("noremap <Right> <Nop>")
vim.cmd("noremap <C-d> <C-d>zz")
vim.cmd("noremap <C-u> <C-u>zz")
vim.cmd("noremap n nzzzv")
vim.cmd("noremap N Nzzzv")

-- native copy paste keybinds 
vim.cmd("noremap <leader>y \"+y")
vim.cmd("noremap <leader>p \"+p")

-- <space> as the leader key
vim.g.mapleader = " "

-- general indent and tab options
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.relativenumber = true
vim.opt.expandtab = true

-- enable highlighting of the line at the cursor
vim.opt.cursorline = true

-- enable better spliting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- enable persistant undos 
vim.opt.undofile = true

-- enable 24-bit colors
vim.opt.termguicolors = true

-- enable sign columns to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- enable 80 character column 
vim.opt.colorcolumn = "80"
