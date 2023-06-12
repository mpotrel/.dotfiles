return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    -- Themes
    use 'Mofiqul/dracula.nvim'

	-- Fuzzy
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Treesitter
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use 'nvim-treesitter/nvim-treesitter-context'

	-- Git
	use 'tpope/vim-fugitive'

	-- Terminal
	use 'numToStr/FTerm.nvim'

	-- Multi cursor
	use 'mg979/vim-visual-multi'

	-- Highlights
	use 'machakann/vim-highlightedyank'

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			{'neovim/nvim-lspconfig'},
			{
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	-- Formatting
	use 'psf/black'

	-- Comments
	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	})



end)
