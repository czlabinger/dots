return {
	-- plugin manager
	{ "folke/lazy.nvim" },

	-- completion and snippets
	{
		"hrsh7th/nvim-cmp",
		event = "insertenter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"l3mon4d3/luasnip",
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
					["<c-b>"] = cmp.mapping.scroll_docs(-4),
					["<c-f>"] = cmp.mapping.scroll_docs(4),
					["<c-space>"] = cmp.mapping.complete(),
					["<cr>"] = cmp.mapping.confirm({ select = true }),
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

	-- lsp and related tools
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp", -- ensure cmp-nvim-lsp is listed here
			{ "p00f/clangd_extensions.nvim", opts = {} }, -- clangd extensions
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "tsserver", "eslint", "jsonls", "html", "cssls" }, -- ensure clangd is installed
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers =
				{ "lua_ls", "rust_analyzer", "pyright", "tsserver", "eslint", "jsonls", "html", "cssls", "clangd" }
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			require("clangd_extensions").setup({
				server = {
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--log=verbose",
					},
					init_options = {
						fallbackFlags = { "-std=c++17" },
					},
				},
			})

			vim.keymap.set(
				"n",
				"<leader>ch",
				"<cmd>ClangdSwitchSourceHeader<cr>",
				{ desc = "Switch Source/Header (C/C++)" }
			)
			vim.keymap.set("n", "<leader>ci", "<cmd>ClangdSymbolInfo<cr>", { desc = "Show Symbol Info (C/C++)" })
			vim.keymap.set("n", "<leader>cth", "<cmd>ClangdTypeHierarchy<cr>", { desc = "Type Hierarchy (C/C++)" })
		end,
	},
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":tsupdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"html",
					"css",
					-- add other languages as needed
				},
				highlight = { enable = true },
			})
		end,
	},

	-- file explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup()
		end,
	},

	-- git integration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},

	-- auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- comment toggler
	{
		"numtostr/comment.nvim",
		config = function()
			require("comment").setup()
		end,
	},

	-- color scheme
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- which key
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
		event = "vimenter", -- lazy loading on 'vimenter' event is necessary.
		config = function()
			require("vgit").setup()
		end,
	},

	-- find and replace
	{
		"magicduck/grug-far.nvim",
		config = function()
			require("grug-far").setup({
				-- options, see configuration section below
				engine = "ripgrep", -- default engine for search and replace
			})
		end,
	},

	-- markdown toc generation
	{
		"hedyhli/markdown-toc.nvim",
		ft = "markdown", -- lazy load on markdown filetype
		cmd = { "mtoc" }, -- or, lazy load on the mtoc command
		opts = {}, -- optional configuration for the plugin
	},

	-- additional plugins without specific configurations
	{ "muniftanjim/nui.nvim" },
	{ "tamago324/nlsp-settings.nvim" },
	{ "nvimtools/none-ls.nvim" },
	{ "tastyep/structlog.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "joosepalviste/nvim-ts-context-commentstring" },
	{ "tamago324/lir.nvim" },
	{ "ahmedkhalf/project.nvim" },
	{ "smiteshp/nvim-navic" },
	{ "akinsho/bufferline.nvim" },
	{ "akinsho/toggleterm.nvim" },
	{ "b0o/schemastore.nvim" },
	{ "rrethy/vim-illuminate" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "folke/todo-comments.nvim" },
	{ "neogitorg/neogit" },
	{ "rrethy/vim-illuminate" },
}
