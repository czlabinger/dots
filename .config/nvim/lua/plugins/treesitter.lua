require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true
	},
	ensure_installed = {
		'java',
		'lua',
		'python',
		'rust',
		'html',
		'javascript',
		'c',
		'cpp',
	},
})
