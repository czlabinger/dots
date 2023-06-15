local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  lazy.install(lazy.path)
  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/plugins/init.lua'
lazy.opts = {}

lazy.setup({
	{'folke/tokyonight.nvim'},
	{'nvim-lualine/lualine.nvim'},	
	{'kyazdani42/nvim-web-devicons'},
	{'akinsho/bufferline.nvim'},
	{'nvim-treesitter/nvim-treesitter'},
	{'kyazdani42/nvim-tree.lua'},
	{'akinsho/toggleterm.nvim'},
	{'neovim/nvim-lspconfig'},
})
