return {
	-- Plugin manager
	{ "folke/lazy.nvim" },

	-- Completion and snippets
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- LSP and related tools
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp", -- Ensure cmp-nvim-lsp is listed here
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "tsserver", "eslint", "jsonls", "html", "cssls" }, -- Ensure these servers are installed
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = { "lua_ls", "rust_analyzer", "pyright", "tsserver", "eslint", "jsonls", "html", "cssls" }
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"html",
					"css",
					-- Add other languages as needed
				},
				highlight = { enable = true },
			})
		end,
	},

	-- File explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
		end,
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- Comment toggler
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Color scheme
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- Which key
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},

	-- vgit
	{
		"tanvirtin/vgit.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		event = "VimEnter", -- Lazy loading on 'VimEnter' event is necessary.
		config = function()
			require("vgit").setup()
		end,
	},

	-- Find and replace
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				-- options, see Configuration section below
				engine = "ripgrep", -- Default engine for search and replace
			})
		end,
	},

	-- Markdown TOC generation
	{
		"hedyhli/markdown-toc.nvim",
		ft = "markdown", -- Lazy load on markdown filetype
		cmd = { "Mtoc" }, -- Or, lazy load on the Mtoc command
		opts = {}, -- Optional configuration for the plugin
	},

	-- Additional plugins without specific configurations
	{ "MunifTanjim/nui.nvim" },
	{ "tamago324/nlsp-settings.nvim" },
	{ "nvimtools/none-ls.nvim" },
	{ "Tastyep/structlog.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "tamago324/lir.nvim" },
	{ "ahmedkhalf/project.nvim" },
	{ "SmiteshP/nvim-navic" },
	{ "akinsho/bufferline.nvim" },
	{ "akinsho/toggleterm.nvim" },
	{ "b0o/schemastore.nvim" },
	{ "RRethy/vim-illuminate" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "folke/todo-comments.nvim" },
	{ "NeogitOrg/neogit" },
	{ "RRethy/vim-illuminate" },
}
