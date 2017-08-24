" Disable YCM
" let g:loaded_youcompleteme = 1

set nocompatible              " be iMproved, required
set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors    
" Use local vimrc
" set exrc
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'
" Match html tags
Plugin 'Valloric/MatchTagAlways'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'ternjs/tern_for_vim'
Plugin 'Raimondi/delimitMate'
" All of your Plugins must be added before the following line
call vundle#end()            " required
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
"sdf/
"Let's just use default YCM extra conf
" let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
set autoindent
set cindent
set number 
set hlsearch
" color elflord
" Show me good dropdown colors YCM
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#000000 guibg=#FFFFFF
highlight PmenuSel guifg=blue

" Well, alt was not working and stackoverflow said this
" BTW, just found this shit enables ALT in GNOME TERMINAL (somehow) but after
" this FORGET using ^[ in recording mode (well, yes, pathetic.. I'll find
" something soon)
" let c='a'
" while c <= 'z'
"   exec "set <A-".c.">=\e".c
"   exec "imap \e".c." <A-".c.">"
"   let c = nr2char(1+char2nr(c))
" endw
" set ttimeout ttimeoutlen=50
" " Increment/decrement features on vim should live!
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>
:nnoremap <A-v> <C-v>
:nnoremap <A-c> <C-c>
" I DON'T need ^C ^V to Copy Paste and all
" source $VIMRUNTIME/mswin.vim
" behave mswin
" Some sort of pattern not found error in YCM
set shortmess+=c
" Gonna try a new style (Solarized)
syntax enable
" C'on, CPP files are also cpp files
autocmd BufNewFile,BufReadPost *.CPP,*.cpp set filetype=cpp
"When I don't want YCM to compile for me (See Diagnostics)
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0
"Highlight current line
set cursorline
" I REALLY don't need the Ex-Mode
nnoremap Q <nop>
" Compile my C++, and run as well ;)
nmap <F8> :w<CR>:!g++ -std=c++98 "%"<CR>:!./a.out<CR>
nmap <F7> :!./a.out<CR>
nmap <F5> :source ~/.vimrc<CR>
nmap f :YcmCompleter FixIt<CR>
nmap <F2> :w<CR>
nmap <F3> :q<CR>
" All text typed in insert mode will be sent to your shell. Use the <F9> key
" to send a visual selection from any buffer to the shell. 
nmap t :ConqueTermSplit bash<CR>
nmap tv :ConqueTermVSplit bash<CR>
" Configuring my splits, use C-w _ to maximize horizontally, C-| to max.
" vertically
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Mr. Delimate work fine now!
 let delimitMate_expand_cr = 1
 let delimitMate_expand_space = 1
"Ycm, time for error handling
let g:ycm_always_populate_location_list = 1
nmap , :lprev<CR>
nmap . :lnext<CR>
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:ycm_autoclose_preview_window_after_completion = 1
if &term=~'screen-256color'
	set term=screen-256color
	let g:solarized_termcolors=256
	set background=dark
	colorscheme solarized
	let g:Powerline_symbols = 'fancy'
else
	colorscheme atom-dark-256
	color atom-dark-256
	let g:Powerline_symbols = 'fancy'

endif
"Search selected text with //
vnoremap <expr> // 'y/\V'.escape(@",'\').'<CR>''")
map <C-n> :NERDTreeToggle<CR>
" Opening nerd tree when opening a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open nerd tree when vim starts without any file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open new buffers w/o saving a buffer
set hidden
" Ignore case in searching
set ignorecase
set smartcase
filetype indent on
" Airline custom settings
let g:airline#extensions#tabline#enabled = 1
call airline#parts#define_accent('mode', 'none')
set encoding=utf-8   
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
let g:airline_powerline_fonts = 1
" Command area autocompletion. Tab: once - complete as much pos. twice: list,
" three: cycle through list
set wildmode=longest,list,full
set wildmenu
" Let YCM handle completions only. (In case of eclim installed)
let g:EclimCompletionMethod = 'omnifunc'
set splitbelow
" Buffer navigation
nmap <Right> :bnext<CR>
nmap <Left> :bprev<CR>
" Close eclim error window with 'q' TODO: write how it works
autocmd FileType qf nnoremap <silent> <buffer> q  :quit\|:wincmd b<CR> 
" Commentings TODO: how it works
autocmd FileType javascript,cpp,cc,c,java  nnoremap <buffer> ; I//<esc>
