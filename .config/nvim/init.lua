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
Plug('ms-jpq/coq_nvim')

vim.call('plug#end')

vim.cmd('let g:coq_settings = { \'auto_start\': \'shut-up\' }')

vim.cmd('nnoremap <C-e> :NERDTreeToggle<CR>')
vim.cmd('nnoremap <C-f> :NERDTreeFocus<CR>')
vim.cmd.colorscheme 'catppuccin-mocha'
