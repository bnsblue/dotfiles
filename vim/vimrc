"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'bling/vim-airline'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Installing jellybeans color scheme
NeoBundle 'nanotech/jellybeans.vim'

" Installing file tree package nerdtree
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

" Installing json syntax highlight
NeoBundle 'elzr/vim-json'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

imap <F2> hsuch@umich.edu (<C-R>=(strftime("%F %H:%M:%S"))<CR>)

"set fileencodings=utf-8,big5,gbk,latin1                                                                        
"set fileencoding=utf-8                                                                                    
"set tags=./tags,../tags,../*/tags,../../tags ",../../tags,../../../tags,*/tags,*/*/tags,*/*/*/tags                                      
set showmatch                                                                                                               
"set nu                                                                                                                         
syntax on                                                                                                                             
set viminfo='20,"50                                                                                                           
set cscopetag                                                                                                                
set cscopeverbose                                                                                                             
set history=50                                                                                     
"set ruler                                                                                                                                     
set cscopeprg=/usr/bin/cscope                                                                                                          
set background=dark                                                                                                             
"color ir_black 
color jellybeans
set hls     
set t_Co=256                                                                                                                          
"set tags+=~/.vim/tags/cpp                                                                                                              
"http://vim.wikia.com/wiki/Insert_current_date_or_time                         
"inoremap <F10> <C-R>=strftime("(%Y/%m/%d)")<CR>                                                                                          

                                                                                                                         
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                                               
                                                                                                                               
hi TabLine guifg=#90fff0 guibg=#2050d0 ctermfg=black ctermbg=white                                                 
hi TabLineSel guifg=#90fff0 guibg=#2050d0 ctermfg=white ctermbg=Magenta                                       
                                                                                                                                    
noremap <silent> <F4> :tabn<CR>                                                                                                   
noremap <silent> <F3> :tabp<CR>                                                                                                 
                                                                                                                                         
"enabling omnicppcomplete                                                                                                                
set nocp                                                                                                                               

"HotKeys                                                                                                                      
"F12 -- Build tags for omnicppcomplete                                                                                                  
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>                                                               
"F5 -- Open NERD_tree plugin                                                                                                     
nnoremap <silent> <F5> :NERDTreeToggle<CR>                                                                                      
                                                                                                                                  
"Move the cursor to the position at where was lastly edited                                                                       
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif   
                                                                                                                                          
                                                                                                                                   
                                                                                                                                     
"highlight Braces ctermfg=red                                                                                                         
highlight Pmenu ctermbg=1                                                                                                          
highlight PmenuSel ctermbg=7  ctermfg=4                                                                                             
highlight PmenuSbar ctermbg=4                                                                                                       
"highlight PmenuThumb guibg=Black                                                                                                 
                                                                                                                                
"Default encoding                                                                                                                  
set fileencodings=utf-8,big5,gbk,latin1                                                                                                 
set fileencoding=utf-8

if &term =~ '256color'
  "disable Background Color Erase (BCE) so that color schemes 
  "render properly when inside 256-color tmux and GNU screen.
  "see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
set sts=4
set modelines=4
set expandtab
set ts=4
set shiftwidth=4

set cursorline

" Setting for vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
