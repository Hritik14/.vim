" Disable YCM
" let g:loaded_youcompleteme = 1

if exists('py2') && has('python')
elseif has('python3')
endif


set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors    

"------------- YCM misc options------------------
"Let's just use default YCM extra conf
" let g:ycm_confirm_extra_conf = 0
let g:ycm_python_interpreter_path = 'python'
let g:ycm_python_sys_path = ['/usr/lib/python3.8/site-packages']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1,
      \ 'go': 1,
      \ '': 1
      \} "use vim-go for golang

set autoindent
set cindent
set number 
set hlsearch
set incsearch
filetype plugin indent on

" Increment/decrement features on vim should live!
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>
:nnoremap <A-v> <C-v>
:nnoremap <A-c> <C-c>
" Some sort of pattern not found error in YCM
set shortmess+=c

syntax enable
" C'on, CPP files are also cpp files
autocmd BufNewFile,BufReadPost *.CPP,*.cpp set filetype=cpp

"When I don't want YCM to compile for me (See Diagnostics)
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0


" I REALLY don't need the Ex-Mode
nnoremap Q <nop>

" Hotkeys
" Compile my C++, and run as well ;)
nmap <F8> :w<CR>:!g++ -std=c++98 "%"<CR>:!./a.out<CR>
nmap <F7> :!./a.out<CR>
nmap <F5> :source ~/.vim/vimrc<CR>
" nmap f :YcmCompleter FixIt<CR>
nmap <F2> :w<CR>
nmap <F3> :q<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-F> :BLines<CR>
nmap <C-U> :Lines<CR>
cabbrev E Files
nnoremap <C-d> :YcmCompleter GoToDeclaration<CR>
cabbrev YC YcmCompleter
" Faster error (loclist) navigation
nmap <C-b> :lbefore<CR>
nmap <C-n> :lafter<CR>
nmap <leader>1 :lrewind<CR>
let g:lt_location_list_toggle_map = '<F9>'
nmap <F1> <Plug>(YCMHover)
imap <F1> <ESC><Plug>(YCMHover)

" Configuring my splits, use C-w _ to maximize horizontally, C-| to max.
" vertically
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Search selected text with // NOTE: Use * to search text under cursor [inbuilt]
vnoremap // y/<C-R>"<CR>
" Buffer navigation
nmap <Right> :bnext<CR>
nmap <Left> :bprev<CR>


"Ycm, time for error handling
let g:ycm_always_populate_location_list = 0 "Deprecated in favor of auto_hover
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set completeopt+=popup


map <C-t> :NERDTreeToggle<CR> " T for tree
" Opening nerd tree when opening a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
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
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
set encoding=utf-8   
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Command area autocompletion. Tab: once - complete as much pos. twice: list,
" three: cycle through list
set wildmode=longest,list,full
set wildmenu

set splitbelow
" Close eclim error window with 'q' TODO: write how it works
autocmd FileType qf nnoremap <silent> <buffer> q  :quit\|:wincmd b<CR> 
" Commentings TODO: how it works
autocmd FileType javascript,cpp,cc,c,java  nnoremap <buffer> ; I//<esc>
" Set tab width
set tabstop=4
" Set indentation width
set shiftwidth=4
" No dealy in InsertLeave
set timeoutlen=1000 ttimeoutlen=0
" Foldings
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
set foldcolumn=2
set foldnestmax=2
set guifont=Source\ Code\ Pro\ 13
" AlE Settings
let g:ale_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 0
let g:ale_sign_highlight_linenrs = 1
let g:ale_completion_enabled = 1
let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = {
			\   '*': ['remove_trailing_lines', 'trim_whitespace'],
			\ 	'python': ['autopep8', 'yapf'],
			\   'javascript': ['eslint'],
			\ }
let g:ale_pattern_options = {
			\   '.*(\.md)|(\.txt)$': {'ale_enabled': 0},
			\}
autocmd FileType gitcommit :ALEDisableBuffer

nmap L :ALEToggle<CR>
nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)
" Close loclist on buffer close
augroup CloseLoclistWindowGroup
	autocmd!
	autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END



" MatchTagAlways config
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
	\ 'php' : 1,
    \}

" Quickfix window size
" Stolen from https://vim.fandom.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(1, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" ultisnips 
" make YCM compatible with UltiSnips (using supertab, installed via pacman)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabDefaultCompletionType = "context"         " Trying to make vim-go work

let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

" Following blocks cause some lag issues while typing
" If it's solved by next time, remove following lines
" I copied it from somewhere, find the author and talk to them
"
" " Use C-R for snip expand
" let g:ulti_expand_or_jump_res = 0 "default value, just set once
" function! Ulti_ExpandOrJump_and_getRes()
"     call UltiSnips#ExpandSnippetOrJump()
"     return g:ulti_expand_or_jump_res
" endfunction
" inoremap <silent> <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":""<CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Paste images in markdown files (md-img-paste.vim)
autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>


" vim-go
let g:go_list_type = "locationlist"
let g:go_doc_popup_window = 1
autocmd FileType go nmap <F1> :GoDoc<CR>
autocmd FileType go imap <F1> <ESC>:GoDoc<CR>

" vim-markdown
set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1


" Visuals
let g:Powerline_symbols = 'fancy'
" Cursor shapes
au VimEnter * silent execute "!print -n -- '\033[2 q'"
au InsertEnter * silent execute "!print -n -- '\033[5 q'"
au InsertLeave * silent execute "!print -n -- '\033[2 q'"
au VimLeave * silent execute "!print -n -- '\033[5 q'"
" No one line essays
set cc=80
" Neat left margin
set foldcolumn=0
set nuw=3
" Highlight current line number ONLY
set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold
colorscheme sorcerer
hi Normal guibg=NONE
hi Visual guibg=#2F2F2F guifg=NONE ctermbg=lightyellow
set termguicolors

" NEOVIM SPECIFIC CONFIG [No errors with vim, might not work with vim]
" True terminal colors
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" This conflicts with tmux
"set termguicolors
au VimLeave * set guicursor=a:ver100-blinkon1

let dart_html_in_string=v:true
let dart_format_on_save = 1
