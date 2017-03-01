autocmd! bufwritepost .vimrc sourc %

set pastetoggle=<F2>
set clipboard=unnamed

set mouse=a " on OSX press Option + Click
set backspace=indent,eol,start " make backspace work like most other apps
"set bs=2  " make backspace behave like backspace

let mapleader = "," " Rebind <Leader> Key

" bind Ctrl+<move_keys> to move around the windows, instead of Ctrl+w+<move_keys>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" remap moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function
vnoremap <Leader>s :sort<CR>

" move text blocks around
vnoremap < <gv
vnoremap > >gv 

" Syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

set history=700
set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

" no vim swap files
"set nobackup
"set nowritebackup
"set noswapfile

set ruler
colorscheme elflord

" Pathogen setup
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"execute pathogen#infect()
call pathogen#infect()

" autoload NerdTree
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1

" autoload NerdTreeTabs
" cd ~/.vim/bundle
" git clone https://github.com/jistr/vim-nerdtree-tabs.git
let g:nerdtree_tabs_open_on_console_startup=1
map <C-n> :NERDTreeTabsToggle<CR>

" vim-powerline plugin settings
" cd ~/.vim/bundle
" git clone https://github.com/Lokaltog/vim-powerline.git
" Then read vim-powerline/fontpatcher/README.rst to patch fonts, or install and
" use mine
" let g:miniBufExplForceSyntaxEnable = 1
let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256

" ctrlp settings
" $ cd ~/.vim/bundle
" $ git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30   
set wildignore+=*.pyc         
set wildignore+=*_build/*     
set wildignore+=*/coverage/*  

" jedi-vim settings
" cd ~/.vim/bundle/ && git clone --recursive https://github.com/davidhalter/jedi-vim.git
" sudo pip install jedi
let g:jedi#usages_command = "<leader>z"                       
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0                             
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" python-mode plugin settings
" cd ~/.vim/bundle
" git clone git://github.com/klen/python-mode.git
" sudo pip install rope ropemode ropevim
map <Leader>g :call RopeGotoDefinition()<CR>                    
"let g:pymode_rope = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let ropevim_enable_shortcuts = 1                                
let g:pymode_rope_goto_def_newwin = "vnew"                      
let g:pymode_rope_extended_complete = 0                         
let g:pymode_breakpoint = 0                                     
let g:pymode_syntax = 1                                         
let g:pymode_syntax_builtin_objs = 0                            
let g:pymode_syntax_builtin_funcs = 0                           
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>  

" Better navigating through omnicomplete option list                               
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" 
set completeopt=longest,menuone                                                 
function! OmniPopup(action)                                                     
    if pumvisible()                                                             
        if a:action == 'j'                                                      
            return "\<C-N>"                                                     
        elseif a:action == 'k'                                                  
            return "\<C-P>"                                                     
        endif                                                                   
    endif                                                                       
    return a:action                                                             
endfunction                                                                     
                                                                                   
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>                                 
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>  

" Python code block folding
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

"set ai                  " auto indenting
"set background=dark	" Makes dark fonts pop on dark terminal
"filetype plugin on      " use the file type plugins
