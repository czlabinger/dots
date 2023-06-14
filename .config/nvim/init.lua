--General
vim.opt.autochdir = true
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Keybindings
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')

-- Copy/Paste
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')


-- Plugins
require('plugins/init')
require('plugins/lualine')
require('plugins/bufferline')
require('plugins/treesitter')
require('plugins/nvimtree')
require('plugins/toggleterm')

-- Theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

require('lualine').setup()
