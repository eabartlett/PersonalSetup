execute pathogen#infect()

syntax on
colorscheme desert
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set smartindent
:set number
set smarttab

" NerdTree
map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR> 
