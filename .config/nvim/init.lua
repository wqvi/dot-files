local vim = vim
local Plug = vim.fn['plug#']

vim.cmd('set nu')
vim.cmd('set rnu')
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.cmd('syntax on')

vim.call('plug#begin')

Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })
Plug('catppuccin/nvim')
Plug('williamboman/mason.nvim')
Plug('mfussenegger/nvim-lint')
Plug('stevearc/conform.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')
Plug('rafamadriz/friendly-snippets')
Plug('onsails/lspkind.nvim')
Plug('neovim/nvim-lsp')

vim.call('plug#end')

vim.cmd('nnoremap <C-e> :NERDTreeToggle<CR>')
vim.cmd('nnoremap <C-f> :NERDTreeFocus<CR>')
vim.cmd.colorscheme 'catppuccin-mocha'

require('mason').setup()

local lint = require('lint')
lint.linters_by_ft = {
	c = { 'cpplint' }
}
lint.linters.cpplint.args = {
	[[--filter=
		-whitespace/tab,
		-legal,
		-readability/casting
	]]
}
lint.try_lint()

local format = require('conform')
format.formatters_by_ft = {
	c = { 'clang-format' }
}

local luasnip = require('luasnip')

local caps = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{ capabilities = caps }
vim.keymap.set('n', '<C-f>', function() format.format() end)

local cmp = require('cmp')
local mapping = cmp.mapping
cmp.setup({
	formatting = {
		fields = { 'kind', 'abbr', 'menu' }
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = {
		['<C-j>'] = mapping.select_next_item(),
		['<C-k>'] = mapping.select_prev_item(),
		['<C-e>'] = mapping.close(),
		['<CR>'] = mapping.confirm({ select = false }),
		['<Tab>'] = mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' })
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
})
