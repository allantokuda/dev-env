" Vundle packages
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'

  Plugin 'kien/ctrlp.vim'                   " fuzzy match file/buffer switching
  Plugin 'pangloss/vim-javascript'          " JavaScript syntax highlighting
  Plugin 'mxw/vim-jsx'                      " JSX syntax highlighting (depends on pangloss/vim-javascript)
  Plugin 'roryokane/detectindent'           " Automatically detect file indentation and change settings to match
  Plugin 'editorconfig/editorconfig-vim'    " automatic project-specific editor configuration (tabs/spaces etc).
  Plugin 'tpope/vim-fugitive'               " awesome Git control wrapper
  Plugin 'tpope/vim-unimpaired'             " handy paired mappings
  Plugin 'tpope/vim-commentary'             " gc, gcc, gcap  for commenting/uncommenting code
  Plugin 'vim-scripts/Align'                " text alignment
  Plugin 'airblade/vim-gitgutter'           " mark changed lines in editor
  Plugin 'scrooloose/syntastic'             " syntax checker
  Plugin 'scrooloose/nerdtree'              " file browser
  Plugin 'leafgarland/typescript-vim'       " Typescript syntax highlighting
  Plugin 'vim-scripts/IndentConsistencyCop'
" Plugin 'ternjs/tern_for_vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'tpope/vim-rails'                  " jump to definitions following Rails conventions
" Plugin 'tpope/vim-cucumber'               " jump to Cucumber step definitions
" Plugin 'tpope/vim-eunuch'                 " sugar for UNIX shell commands
" Plugin 'majutsushi/tagbar'                " tag visualizer
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'SirVer/ultisnips'                 " engine for quickly inserting snippets with smart placeholders
" Plugin 'honza/vim-snippets'               " actual big list of snippets for ultisnips
" Plugin 'bling/vim-airline'                " nicely formatted bottom bar (filename, mode, filetype, etc.)
" Plugin 'kana/vim-textobj-user'            " text objects for fast coding (selecting things)
" Plugin 'mattn/emmet-vim'                  " fancy abbreviations for expanding HTML elements like ul>li*
" Plugin 'nelstrom/vim-textobj-rubyblock'   " A custom text object for selecting ruby blocks.
" Plugin 'othree/html5-syntax.vim'          " Ctrl-X, Ctrl-O for omnicomplete HTML stuff
" Plugin 'ck3g/vim-change-hash-syntax'      " changing the Ruby hash syntax :from => 1.8 to: 1.9
" Plugin 'tpope/vim-surround'               " accelerator for adding and modifying text in terms of surrounding elements
" Plugin 'tpope/vim-repeat'                 " make the dot key repeat things like tpope/vim-surround
" Plugin 'vim-scripts/dbext.vim'            " run database scripts from within Vim and browse the results
" Plugin 'git@github.com:allantokuda/vim-hypermove'
call vundle#end()

filetype on
syntax on

set binary
set noeol
set number
set autoindent
set ignorecase
set incsearch
set nowrap
set mouse=a
set scrolloff=1
set sidescrolloff=5
set showcmd
set wildmenu
set ruler
set showmatch
set nofoldenable
set clipboard=unnamed
set guioptions=e
set hidden
set laststatus=2  " Always have a status line, even when there is only one buffer in the window, for consistency
set nostartofline
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set hlsearch
set backspace=indent,eol,start
nohls

map <F6> :set diff<CR>:set scrollbind<CR>

" sensible stuff: Y should behave like C and D
nnoremap Y y$

" Clear highlighted keywords
nnoremap <C-L> :nohls<CR><C-L>

" I do this more than anything
map <Space> :w<CR>

" Turn off Q -- I never use Ex mode
map Q <nop>

" get myself out of the habit of using `gd`.
nnoremap gd <nop>

" Insert javascript function with mark `i inside function parens,
" allowing for the function to be inside of something else
imap <D-F> function(<C-O>mi) {}<C-O>`i<C-O>f)
imap <D-C> console.log();<C-O>h
imap <D-I> it(''<C-O>mi, function() {});<C-O>`i
imap <D-X> expect();<C-O>h

" git grep the keyword under the cursor (opens quickfix list)
" search for the word without regex word boundaries, and 
" instead using the -w option to allow git grep to add its own word boundaries.
" Then add them back in again with "*" to setup vim search regex \<word boundaries\>
map <Leader>gr g*N:silent Ggrep -w <C-R>/<CR>$N*N:copen<CR><C-w><C-p>

map <Leader>gr g*N:set grepprg=~/.local/bin/rbgitgrep<CR>:silent grep! -w <C-R>/<CR>*N:copen<CR><C-w><C-p>:redraw!<CR>
map <Leader>gj g*N:set grepprg=~/.local/bin/jsgitgrep<CR>:silent grep! -w <C-R>/<CR>*N:copen<CR><C-w><C-p>:redraw!<CR>
map <Leader>gri g*N:set grepprg=~/.local/bin/rbgrep<CR>:silent grep! -w <C-R>/<CR>*N:copen<CR>/def <CR><CR>:cclose<CR>:redraw!<CR>
map <Leader>grh g*N:set grepprg=~/.local/bin/rbgrep<CR>:silent grep! -w <C-R>/<CR>*N:copen<CR><C-w><C-p>:redraw!<CR>

vmap <Leader>gr "ly/<C-R>l<CR>N:silent Ggrep -w "<C-R>l"<CR>

" Don't move when hitting * or # (so annoying!)
map * *N
map # #N

" From Nick
nmap <Leader>f :%s/<C-r><C-w>//gc<Left><Left><Left>

map <Leader>p :CtrlPClearAllCaches<CR>

"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='+'
"let g:multi_cursor_prev_key='-'
"let g:multi_cursor_skip_key='='
"let g:multi_cursor_quit_key='<Esc>'

" Syntastic plugin
let g:syntastic_check_on_open=1
let g:syntastic_enable_balloons=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0  " don't auto-pop-up the list of errors
let g:syntastic_auto_jump=0
let g:syntastic_echo_current_error=1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['mri']
"let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_html_tidy_ignore_errors = [
\   'proprietary attribute'
\ , '<path> is not recognized!'
\ , '<svg> is not recognized!'
\ , 'discarding unexpected <path>'
\ , 'discarding unexpected </path>'
\ , 'discarding unexpected <svg>'
\ , 'discarding unexpected </svg>'
\ ]

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php'],
                           \ 'passive_filetypes': ['puppet', 'html'] }

" Ctrl-P plugin: turn off letting it set its own working directory (what does that mean??)
let g:ctrlp_working_path_mode = '0'
" Unlimited files, deep recursive directory search for files
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100

" Reformat (valid) JSON strings
set equalprg=python\ -mjson.tool

" Files and folders to ignore in Ctrl-P and :e tab-completion
set wildignore+=node_modules,trash,tmp,cache,coverage,vendor,cassettes,build

" Where to look for ctags files
" set tags=./tags,tags,/Users/allan.tokuda/.rvm/gems/ruby-2.0.0-p451/gems/tags,/Users/allan.tokuda/.rvm/gems/ruby-2.0.0-p451/bundler/gems/tags
set tags=./tags,tags,~/src/*/tags

" Treat hyphens as part of a file when editing DOM stuff. Would like it to be
" smart about HAML, but HAML is a combination of HTML and Ruby, and I think
" the Ruby part is more important, so I'm treating HAML as Ruby.
au! BufNewFile,BufRead *.css,*.scss,*.sass,*.html,*.txt setlocal isk+=-
au! BufNewFile,BufRead *.rb,*.js,*.coffee,*.haml,*.sql setlocal isk-=-

au VimEnter * DetectIndent

" Load vim-jsx "javascript.jsx" syntax even for files without JSX extension
let g:jsx_ext_required=0

hi PreProc ctermfg=LightBlue
hi Statement ctermfg=LightBlue
hi Special ctermfg=Yellow
hi Noise ctermfg=Yellow
hi Identifier ctermfg=Cyan
hi Type ctermfg=Green
hi String ctermfg=Magenta
hi Number ctermfg=DarkMagenta
hi Conditional ctermfg=Red
hi Comment ctermfg=DarkGrey
hi LineNr ctermfg=Black
hi StatusLine ctermfg=DarkGreen ctermbg=Black
hi StatusLineNC ctermfg=Black ctermbg=White

hi clear SignColumn
hi GitGutterAdd ctermfg=green guifg=#00cc00;
hi GitGutterChange ctermfg=yellow guifg=yellow
hi GitGutterDelete ctermfg=red guifg=red
hi GitGutterChangeDelete ctermfg=yellow guifg=yellow
hi SyntasticErrorSign guibg=red guifg=#ff9999;
hi SyntasticWarningSign guifg=#CFCF00; guibg=#777700;


" Usage -- echo SyntaxAtCursor()
function! SyntaxAtCursor()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction


if has('statusline')
  set statusline=
  set statusline+=%-2.2n\                      " buffer number
  set statusline+=%f\                          " file name
  set statusline+=%#Conceal#                   " set highlighting
  set statusline+=%h%m%r%w\                    " flags
  set statusline+=%{strlen(&ft)?&ft:'none'},   " file type
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}, " encoding
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%{&fileformat},              " file format
  set statusline+=%{&spelllang}                " language of spelling checker
  set statusline+=%=                           " ident to the right
" set statusline+=%{SyntaxAtCursor()}          " syntax highlight group under cursor
  set statusline+=0x%-8B\                      " character code under cursor
  set statusline+=%-7.(%l,%c%V%)\ %<%P         " cursor position/offset
endif


" automatically reload vimrc when it's saved
augroup AutoReloadVimRC
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END