"#############################################################################
" author: chasel chen
" date  : 2014/07/25
"--------------------------------------------------
" Vundle Plugins
" General Settings
" autocmd
" Commands
" General Map
" Code Map
" Useful Map
" Functions
" Plugin Settings
" Redundant
"#############################################################################
set nocompatible              " be iMproved, required
filetype off                  " required

"http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

" set the runtime path to include Vundle and initialize
if has("gui_win32")
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$VIM/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
endif

"=============================================================================
" Vundle Plugins
" %s/Plugin '//g
" %s/'//g
" %s/\w\+\-\{0,1}\w+\///g
"=============================================================================
" --- for Windows gvim --- "
Plugin 'gmarik/Vundle.vim'

Plugin 'easymotion/vim-easymotion' " easymotion.txt
Plugin 'jiangmiao/auto-pairs'
Plugin 'Twinside/vim-cuteErrorMarker'
Plugin 'bling/vim-airline' ":h airline 不用詳讀
Plugin 'godlygeek/tabular'
" todo 讀到這裡
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim' "web 開發工具, <c-y>,
"Plugin 'mileszs/ack.vim' 改用Ag
Plugin 'rking/ag.vim'
Plugin 'msanders/snipmate.vim'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sukima/xmledit'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/AutoComplPop' ":h acp.txt
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/Syntastic'
"Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/javacomplete'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/pythoncomplete'
Plugin 'dkprice/vim-easygrep'
Plugin 'tommcdo/vim-exchange'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-abolish'
Plugin 'c9s/gsession.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/dbext.vim'
"Plugin 'vim-scripts/SQLComplete.vim'"
"Plugin 'ervandew/supertab'
Plugin 'tomasr/molokai'
Plugin 'OmniSharp/omnisharp-vim'


" --- for Linux --- "
""Plugin 'wincent/Command-T'
"Plugin 'scrooloose/snipmate-snippets'
"Plugin 'Valloric/YouCompleteMe'
""Plugin 'garbas/vim-snipmate'
Plugin 'xuhdev/SingleCompile'
" --- to be try --- "
"Plugin 'justinmk/vim-sneak
"Plugin 'goldfeld/vim-seek'

" --- discard --- "
"Plugin 'Townk/vim-autoclose' 似乎沒有 auto-paris 好
"Plugin 'vim-scripts/taglist.vim' 已有tagbar

"
"============================================================
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"=============================================================================
" General Settings
"=============================================================================
syntax on                 " syntax highlight

set bs=2                  " allow backspacing over everything in insert mode
set history=1000          " keep 50 lines of command line history
set ruler                 " show the cursor position all the time
set autoread              " auto read when file is changed from outside
set number
set clipboard=unnamed     " yank to the system register (*) by default
set showmatch             " Cursor shows matching ) and }
set showmode              " Show current mode
set wildchar=<TAB>        " start wild expansion in the command line using <TAB>
set wildmenu              " wild char completion menu
set backspace=indent,eol,start
set lines=36
set columns=120
winpos 600 0
" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent            " auto indentation
set hlsearch              " search highlighting
set incsearch             " incremental search & cobol
set copyindent            " copy the previous indentation on autoindenting
set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab              " insert tabs on the start of a line according to context
set nowrap

" files, backup and undo
set nobackup              " no *~ backup files
set noswapfile
set nowb

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Linebreak on 500 characters
set lbr
set tw=500

" cursorline & colors
set t_Co=256
set cursorline
set background=dark
" set background=light
colors molokai
" colors solarized
"  colors vgod
" cterm 終端 ctermbg 背景顏色 ctermfg 文字顏色
hi CursorLine   cterm=NONE ctermbg=Brown  guibg=DarkMagenta
"hi CursorLine   cterm=NONE ctermbg=DarkGreen ctermfg=white guibg=DarkMagenta
hi CursorColumn cterm=NONE ctermbg=DarkMagenta  guibg=DarkMagenta
hi CursorLineNr ctermfg=Yellow cterm=bold gui=bold guifg=Yellow
hi Visual cterm=NONE ctermbg=DarkMagenta guibg=DarkMagenta

" dark, [DarkRed/DarkBlue/Brown/Black
" highlight Pmenu ctermbg=brown ctermfg=white colors=yellow

" TAB setting{
set expandtab                "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
au FileType Makefile set noexpandtab
au FileType text   set softtabstop=4
au FileType text   set shiftwidth=4
au FileType cobol    set shiftwidth=3
au FileType cobol    set softtabstop=3
"}

"去掉左右邊的滾條
"set guioptions-=r
"set guioptions-=L
"set showtabline=0

" status line {
set laststatus=2
if !has("gui_running")
    "set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
    "set statusline+=\ \ \ [%{&ff}/%Y]
    "set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
    "set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
endif

" guifont Settings
if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h13
        "set guifont=Monospace:h13
    else
        set guifont=Monaco\ 13
    endif
end

nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \ if &omnifunc == "" |
                \ setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
endif
set cot-=preview "disable doc preview in omnicomplete

" encoding
if !has("gui_win32")
    set encoding=utf-8
    set termencoding=utf-8
endif

set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

"解決 windows Gvim CP950 選單亂碼
"http://electronic-blue.wikidot.com/blog:33
let $LANG="zh_TW.UTF-8"
set langmenu=zh_tw.utf-8
language message zh_TW.UTF-8
set encoding=utf8

"reload menu with UTF-8 encoding
source $VIMRUNTIME/delmenu.vim "會造成linux底下儲存後視窗縮小
source $VIMRUNTIME/menu.vim

"Restore cursor to file position in previous editing session
"http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
if has("gui_win32")
    set viminfo='10,\"100,:20,%,n$VIM\\.viminfo
else
    set viminfo='10,\"100,:20,%,n~/.viminfo
endif

" Disable all blinking:
set guicursor+=a:blinkon0
highlight ColorColumn ctermbg=yellow guibg=yellow


"=============================================================================
" autocmd
"=============================================================================
" for file
"-----------------------------------------------------------------------------
" ftplugin 不會重新載入，所以進入檔案前先設定filetype
autocmd BufReadPost *.cob set filetype=cobol
autocmd BufReadPost *.jcl set filetype=jcl
autocmd FileType * set colorcolumn=80

" auto reload vimrc when editing it
if has("gui_win32")
    autocmd! bufwritepost _vimrc source $MYVIMRC
else
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" format file
autocmd BufWritePre * call AutoFormatFile()
" delete spaces
autocmd BufWritePre * call StripTrailingWhitespaces()

" turn line wrapping off with HTML file
autocmd BufNewFile,BufRead *.html setlocal nowrap

" Restore cursor position
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
autocmd FocusLost * silent! up " vim 窗口失去焦點時
autocmd BufLeave * silent! up " vim buffer 切換時自動儲存
" for
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END
"=============================================================================
" Commands
"=============================================================================
command! -nargs=* Wrap set wrap linebreak nolist " vimcasts.org #16

"=============================================================================
" General Map
"=============================================================================
" set leader to ,
let mapleader=","
let g:mapleader=","

inoremap ;; <esc>A;
noremap ;; <esc>A;
" edit .vimrc or _vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
"map <leader>cc :botright cope<CR>
" move to next error
map <leader>. :cn<CR>
" move to the prev error
map <leader>m :cp<CR>

" --- move around splits {
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
"" help filename-modifiers
"" :p Make file name a full path.
"" :h Head of the file nam (the last component and any separators removed.)
cmap cd. lcd %:p:h
" from vimcasts.org #14
"cnoremap %% <c-r>=fnameescape(expand('%:h')).'/'<cr>
"map <leader>ew :e <c-r>=expand("%:p:h") . "/" <cr>
"map <leader>ew :e %%

" Writing Restructured Text (Sphinx Documentation) {
" Ctrl-u 1:    underline Parts w/ #'s
noremap  <C-u>1 yyPVr#yyjp
inoremap <C-u>1 <esc>yyPVr#yyjpA
" Ctrl-u 2:    underline Chapters w/ *'s
noremap  <C-u>2 yyPVr*yyjp
inoremap <C-u>2 <esc>yyPVr*yyjpA
" Ctrl-u 3:    underline Section Level 1 w/ ='s
noremap  <C-u>3 yypVr=
inoremap <C-u>3 <esc>yypVr=A
" Ctrl-u 4:    underline Section Level 2 w/ -'s
noremap  <C-u>4 yypVr-
inoremap <C-u>4 <esc>yypVr-A
" Ctrl-u 5:    underline Section Level 3 w/ ^'s
noremap  <C-u>5 yypVr^
inoremap <C-u>5 <esc>yypVr^A
"}

" Mappings to move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" delete line
map <C-d> <esc>dd

nmap <Leader>w :w!<cr>
nmap <Leader>q :q!<cr>

" todo
" Movement Mappings
" http://learnvimscriptthehardway.stevelosh.com/chapters/15.html
onoremap w iw
onoremap p i(
onoremap b /return<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap pp  :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
onoremap ah :<c-u>execute "normal! ?^==\\+\r:nohlsearch\rg_vk0"<cr>

nmap <C-S-P> :call <SID>SynStack()<CR>

" from vimcasts
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" save and load view
map <leader>k :mkview<cr>
map <leader>jk :loadview<cr>
" wikia: Replace a word with yanked text
xnoremap p "_dP
nnoremap S diw"0P
vnoremap S "_d"0P
nnoremap <F4> "+yiw
vnoremap <F4> "+y
nnoremap <F5> viw"+p
vnoremap <F5> "+p

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
"=============================================================================
" Code Map
"=============================================================================
" --- ruby --- "
inoremap <S-CR> <CR><CR>end<Esc>-cc

inoremap jk <Esc><esc>
"inoremap <Esc> <nop>

inoremap l; <Esc>$a;<CR>
inoremap ;; <Esc>A;<Esc>
nnoremap ;; <Esc>A;<Esc>
" noremap ;; <Esc>A;<Esc>
"imap jo <Esc>o
"imap ko <Esc>ko<cr>
imap =+ =>
map <leader>yr :YRShow<cr>
nnoremap <leader>l :set list!<cr>
"nnoremap <leader>, <Esc>A,
"inoremap <leader>, <Esc>A,


nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>a
inoremap <c-s> <esc><c-s>
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
map <c-space> ?
" shift-enter, insert to next line
inoremap <S-CR> <Esc>o

"=============================================================================
" Useful Map
"=============================================================================
" calculate 3 * 3 =
" or with visual selectino => normal Q
nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>

"=============================================================================
" functions
"=============================================================================
" Show syntax highlighting groups for word under cursor
function! ClearRegisters()
    " let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"' | let i=0 | while (i<strlen(regs)) | exec 'let @'.regs[i].'=""' | let i=i+1 | endwhile | unlet regs
    redir => l:register_out
    silent register
    redir end
    let l:register_list = split(l:register_out, '\n')
    call remove(l:register_list, 0) " remove header (-- Registers --)
    call map(l:register_list, "substitute(v:val, '^.\\(.\\).*', '\\1', '')")
    call filter(l:register_list, 'v:val !~ "[%#=.:]"') " skip readonly registers
    for elem in l:register_list
        execute 'let @'.elem.'= ""'
    endfor
endfunction
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

" 去除多個空白
function! DelWhite()
    :%s/\s\+/ /g
    :%s/^\s\+//g
endfun

function! StripTrailingWhitespaces()
    let _s = @/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l,c)
endfu

function! AutoFormatFile()
    let l = line(".")
    let c = col(".")
    " Don't format txt filetype
    if &ft =~ 'text'
        return
    endif
    if &ft =~ 'cobol'
        return
    endif
    if &ft =~ 'vim'
        return
    endif
    :normal gg=G
    call cursor(l,c)
endfunction

fun! SpaceToOne()
    %s/\s\+/ /g
endfun
" --- Encoding Settings --- "
fun! ViewUTF8()
    set encoding=utf-8
    set termencoding=big5
endfun

fun! UTF8()
    set encoding=utf-8
    set termencoding=big5
    set fileencoding=utf-8
    set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
    set encoding=big5
    set fileencoding=big5
endfun

fun! GetSeq(num)
    :normal ggi1
    :normal Yp<c-a>
endfun

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
fun! ToCSV()
    %s/\s\+/,/g
    let s=expand('%:t') . ".csv"
endfun

fun! ToTmp()
    let path='G:\tempto234\'
    let f=expand('%:r')
    let fname=matchstr(f,'_.*$')
    echo 'w ' . path . f
    execute 'w! '.path . f
endfun
fun! SQLUpper()
    "exec "normal! %s/select/SELECT/g"
    :normal! %s/select/SELECT/g
endfun
map <F3> :call ToTmp()<CR>
"=============================================================================
" Plugin Settings
"=============================================================================
" --- EasyMotion --- "
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
"nmap s <Plug>(easymotion-s2) " search tw characters
"nmap t <Plug>(easymotion-t2)
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
" ,,w
" ,,fo find o

" --- TagBar --- "
nnoremap <silent> <F8> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1
if has("gui_win32")
    let g:tagbar_ctags_bin="c:/ctags.exe"
endif

" ---  Ctrlp --- "
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ }

let g:ctrlp_cmd='CtrlPBuffer' "use <C-f> to change

" --- AutoClose --- "
" Inserts matching bracket, paren, brace or quote
" fixed the arrow key problems caused by AutoClose
"if !has("gui_running")
"   set term=linux
"   imap OA <ESC>ki
"   imap OB <ESC>ji
"   imap OC <ESC>li
"   imap OD <ESC>hi
"
"   map OA k
"   map OB j
"   map OC l
"   map OD h
"endif

" --- SuperTab --- "
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" --- SnipMate ---"
let g:snipMateAllowMatchingDot = 0
let g:snips_trigger_key = '<C-\>'

" --- YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" --- RSense --- "
let g:rsenseHome = "/usr/lib/rsense-0.3"
let g:rsenseUseOmniFunc = 1

" --- SingleCompile --- "
"nmap <F9> :SCCompile<cr>
"nmap <F10> :SCCompileRun<cr>

" --- emmet --- "

" --- taglist --- "
"if has("gui_win32")
"   " 不確定哪個對，要用在試
"   let g:Tlist_Ctags_Cmd = 'C:/ctags.exe'
"   let g:Tlist_Ctags_Cmd = 'C:\\ctags.exe'
"endif

" --- NERDTree --- "
map <F2> :NERDTreeToggle<CR>

" --- airline --- "
let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>>'
let g:airline#extensions#tabline#left_alt_sep = '|'


" --- YankRing --- "
let g:yankring_max_element_length = 0

"=============================================================================
" Redundant
"=============================================================================
" move to and maximize the below split
"map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
"map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
"nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
"nmap <c-l> <c-w>l<c-w><bar>
"set wmw=0                     " set the min width of a window to 0 so we can maximize others
"set wmh=0                     " set the min height of a window to 0 so we can maximize others

" --- compile key --- "
"autocmd BufRead *.py nmap <F12> :w !python %<CR>
"autocmd FileType java map <F12> :!javac "%:p" && java -cp "%:p:h" "%:t:r"<CR>
"autocmd FileType java map <F12> :!javac %<CR>
"autocmd FileType c map <F12> :!gcc -o "%:p:r.out" % && "%:p:r.out"<CR>
"autocmd FileType c map <F12> :!gcc -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>
"autocmd FileType php noremap <F12> :w!<CR>:!/usr/bin/php %<CR>
"autocmd BufRead *.sh nmap <F12> :w !sh %<CR>
"autocmd FileType ruby compiler ruby
""
let g:dbext_default_profile_mySQL = 'type=MYSQL:user=root:passwd=whatever:dbname=mysql'
" test
