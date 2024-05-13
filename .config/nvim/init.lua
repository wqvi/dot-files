local vim = vim
local Plug = vim.fn['plug#']

vim.cmd('set nu')
vim.cmd('set rnu')
vim.opt.autoindent = true
vim.opt.smarttab = true
-- pywal doesn't work??? :(
--vim.opt.termguicolors = true
vim.cmd('syntax on')

vim.call('plug#begin')

Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

vim.call('plug#end')

vim.cmd('nnoremap <C-e> :NERDTreeToggle<CR>')
