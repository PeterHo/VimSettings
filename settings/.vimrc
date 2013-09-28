"/////////////////////////////////////////////////////////////////////////////
" vundle
"/////////////////////////////////////////////////////////////////////////////
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" :BundleInstall   " Install All Plugin
" :BundleInstall!  " Upgrade All Plugin
" :BundleClean     " Clean Unuse Plugin

" vim-scripts repos

" 界面类

" ARM汇编高亮
" Bundle 'armasm'
" 颜色配色方案
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/Colour-Sampler-Pack'
" 快捷浏览配色方案
Bundle 'vim-scripts/Color-Scheme-Explorer'
" 高亮Tag
Bundle 'magic-dot-files/TagHighlight'
" 美化状态栏
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/powerline-fonts'


" 工程管理

" 一些插件的依赖项
Bundle 'DfrankUtil'
" 管理工程相关的设置
Bundle 'vimprj'
" 源代码管理
Bundle 'tpope/vim-fugitive'
" 项目向导
Bundle 'PeterHo/VimAssist'


" 文件管理

" 目录树
Bundle 'scrooloose/nerdtree'
" 让nerdTree在最后一个buffer窗口关闭时，不让其缩放
Bundle 'oblitum/bufkill'
" 查看Buf文件
Bundle 'fholgado/minibufexpl.vim'
" 搜索目录下的文件
Bundle 'kien/ctrlp.vim'


" 快速编辑

" 快速注释代码
Bundle 'scrooloose/nerdcommenter'
" 自动括号
Bundle 'jiangmiao/auto-pairs'
" 代替snipMate
Bundle 'SirVer/ultisnips'
" 相当牛逼的补全,一旦拥有别无所求
Bundle 'Valloric/YouCompleteMe'
" 命令补全
Bundle 'CmdlineComplete'
" 快速移动光标
Bundle 'Lokaltog/vim-easymotion'


" 编程辅助

" 快速在.c和.h文件之间切换
Bundle 'a.vim'
" 代替taglist.vim
Bundle 'majutsushi/tagbar'
" 方便对齐代码
Bundle 'godlygeek/tabular'
" 文件中查找替换
Bundle 'vim-scripts/EasyGrep'
" 快速设置书签
Bundle 'vim-scripts/Vim-bookmark'
" TopCoder
Bundle 'vim-scripts/VimCoder.jar'
Bundle 'chazmcgarvey/vimcoder'


" Python编程环境

" Bundle 'klen/python-mode' " 确实用不了
" 补全
"Bundle 'vim-scripts/Pydiction'
" 代码折叠
"Bundle 'vim-scripts/python_fold'
" 代码检查
Bundle 'kevinw/pyflakes-vim'
" 调试
Bundle 'gotcha/vimpdb'

" Go编程环境
Bundle 'jnwhiteh/vim-golang'
Bundle 'nsf/gocode'

" 其它
" 个人wiki
Bundle 'vim-scripts/vimwiki'
" Orgmode
Bundle 'hsitz/VimOrganizer'
Bundle 'vim-scripts/utl.vim'
Bundle 'mattn/calendar-vim'
Bundle 'chrisbra/NrrwRgn'

filetype plugin indent on

"/////////////////////////////////////////////////////////////////////////////
" General
"/////////////////////////////////////////////////////////////////////////////
let mapleader = ";"

set nocompatible " Use Vim settings, rather then Vi settings (much better!). This must be first, because it changes other options as a side effect.
set langmenu=none " always use English menu

set encoding=utf-8

behave xterm  " set mouse behavior as xterm

set nobackup
set nowritebackup
set noswapfile

" programming related 
"set tags+=./tags,./../tags,./**/tags,tags,~/.vim/systags " which tags files CTRL-] will find 


set viminfo+=! " make sure it can save viminfo 
filetype on " enable file type detection 
filetype plugin on " enable loading the plugin for appropriate file type 

" Redefine the shell redirection operator to receive both the stderr messages
" and stdout messages
set shellredir=>%s\ 2>&1

set history=50 " keep 50 lines of command line history
set updatetime=1000 " default = 4000
set autoread " auto read same-file change ( better for vc/vim change )

" enlarge maxmempattern from 1000 to ... (2000000 will give it without limit)
set maxmempattern=1000

set clipboard=unnamedplus

"/////////////////////////////////////////////////////////////////////////////
" Variable settings ( set all )
"/////////////////////////////////////////////////////////////////////////////

" ------------------------------------------------------------------ 
" Desc: Visual
" ------------------------------------------------------------------ 

set showmatch " show matching paren 
set matchtime=0 " 0 second to show the matching paren ( much faster )
set nu " Show LineNumber
set scrolloff=3 " minimal number of screen lines to keep above and below the cursor 
set nowrap " I don't like wrap, cause in split window mode, it feel strange
set cursorline

" color scheme define
if has("gui_running")
    colorscheme solarized
	"colorscheme desert
	"colorscheme desertEx
	" colorscheme desert_my
	" set background=dark
	set background=light
else " if we are in terminal mode
	colorscheme molokai
	set background=light
endif

" ------------------------------------------------------------------ 
" Desc: Vim UI
" ------------------------------------------------------------------ 

set wildmenu " turn on wild menu, try typing :h and press <Tab> 
set showcmd	" display incomplete commands
set cmdheight=1 " 1 screen lines to use for the command-line 
set ruler " show the cursor position all the time
set hid " allow to change buffer without saving 
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
set lazyredraw " do not redraw while executing macros (much faster) 
set display+=lastline " for easy browse last line with wrap text
set laststatus=2 " always have status-line
set noshowmode

set showfulltag " show tag with function protype.
set guioptions+=b " Present the bottom scrollbar when the longest visible line exceen the window

" disable menu & toolbar
set guioptions-=m
set guioptions-=T

" set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" ------------------------------------------------------------------ 
" Desc: Text edit
" ------------------------------------------------------------------ 

set ai " autoindent 
set si " smartindent 
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" indent options
"  see help cinoptions-values for more details
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30
" default '0{,0},0),:,0#,!^F,o,O,e' disable 0# for not ident preprocess
" set cinkeys=0{,0},0),:,!^F,o,O,e

" Official diff settings
set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary -w '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    silent execute '!' .  'diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
endfunction

set cindent shiftwidth=4 " Set cindent on to autoinent when editing C/C++ file, with 4 shift width
set tabstop=4 " Set tabstop to 4 characters
set expandtab " Set expandtab on, the tab will be change to space automaticaly

" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=
" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block

" ------------------------------------------------------------------ 
" Desc: Fold text
" ------------------------------------------------------------------ 

set foldmethod=marker foldmarker={,} foldlevel=9999
set diffopt=filler,context:9999

" ------------------------------------------------------------------ 
" Desc: Search
" ------------------------------------------------------------------ 

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif
set incsearch " do incremental searching
set ignorecase " Set search/replace pattern to ignore case 
set smartcase " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.

" set this to use id-utils for global search
set grepprg=lid\ -Rgrep\ -s
set grepformat=%f:%l:%m

" ------------------------------------------------------------------ 
" Desc: Syntax
" ------------------------------------------------------------------ 

let c_gnu = 1
let c_no_curly_error = 1
"let c_no_bracket_error = 1

"/////////////////////////////////////////////////////////////////////////////
" Key Mappings
"/////////////////////////////////////////////////////////////////////////////

" Don't use Ex mode, use Q for formatting
map Q gq  

" define the copy/paste judged by clipboard
if &clipboard ==# "unnamed"
    " fix the visual paste bug in vim
    " vnoremap <silent>p :call g:()<CR>
else
    " general copy/paste.
    " NOTE: y,p,P could be mapped by other key-mapping
    map <leader>y "+y
    map <leader>p "+p
    map <leader>P "+P
endif

" F8:  Set Search pattern highlight on/off
nnoremap <F8> :let @/=""<CR>

" map Ctrl-Tab to switch window
nnoremap <S-Up> <C-W><Up>
nnoremap <S-Down> <C-W><Down>
nnoremap <S-Left> <C-W><Left>
nnoremap <S-Right> <C-W><Right>

nnoremap <M-k> <C-W><Up>
nnoremap <M-j> <C-W><Down>
nnoremap <M-h> <C-W><Left>
nnoremap <M-l> <C-W><Right>

"" Easy Diff goto
"noremap <C-Up> [c
"noremap <C-k> [c
"noremap <C-Down> ]c
"noremap <C-j> ]c

" Enhance '<' '>' , do not need to reselect the block after shift it.
vnoremap < <gv
vnoremap > >gv

" map Up & Down to gj & gk, helpful for wrap text edit
noremap <Up> gk
noremap <Down> gj

" VimTip 329: A map for swapping words
" http://vim.sourceforge.net/tip_view.php?tip_id=
" Then when you put the cursor on or in a word, press "\sw", and
" the word will be swapped with the next word.  The words may
" even be separated by punctuation (such as "abc = def").
nnoremap <silent><leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

"save file
:nmap <C-S> <ESC>:w<cr>
:imap <C-S> <ESC>:w<cr>

"Fast edit vimrc
if has ("unix")
    "Fast reloading of the .vimrc
    map <silent> <leader>src :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <silent> <leader>erc :e ~/.vimrc<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
elseif has ("win32")
    " Set helplang
    set helplang=cn
    "Fast reloading of the _vimrc
    map <silent> <leader>src :source ~/_vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>erc :e ~/_vimrc<cr>
    "When _vimrc is edited, reload it
    autocmd! bufwritepost _vimrc source ~/_vimrc
endif

:inoremap <M-h> <Left>
:inoremap <M-j> <Down>
:inoremap <M-k> <Up>
:inoremap <M-l> <Right>
:inoremap <C-d> <Esc>ddi
:inoremap <C-v> <Esc>pa

" Update
:nmap <M-u> :call Update()<CR><CR>

" make
map <F10> :M<CR>

nnoremap <c-Enter> o<Esc>k
nnoremap <s-Enter> O<Esc>j

nnoremap ;; ;

"/////////////////////////////////////////////////////////////////////////////
" Auto Command
"/////////////////////////////////////////////////////////////////////////////

" maximize on startup
function! Maximize_Window()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
au GUIEnter * call Maximize_Window()

autocmd InsertLeave * set imdisable
autocmd InsertEnter * set noimdisable

"autocmd FileType python set omnifunc=pythoncomplete#Complete


"/////////////////////////////////////////////////////////////////////////////
" asmarm
"/////////////////////////////////////////////////////////////////////////////
let asmsyntax='armasm'
let filetype_inc='armasm'


"/////////////////////////////////////////////////////////////////////////////
" NERD Tree
"/////////////////////////////////////////////////////////////////////////////
nmap <silent> <F5> :NERDTreeToggle<CR>
let g:NERDChristmasTree=1
let g:NERDTreeAutoCenter=1
let g:NERDTreeBookmarksFile=$HOME.'/.vim/NerdBookmarks.txt'
let g:NERDTreeMouseMode=2
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.pyc$', 'tags', '\.taghl$']

" bufkill bd's: really do not mess with NERDTree buffer
"nnoremap <silent> <backspace> :BD<cr>
"nnoremap <silent> <s-backspace> :BD!<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>


"/////////////////////////////////////////////////////////////////////////////
" NERD Commenter
"/////////////////////////////////////////////////////////////////////////////
let g:NERDRemoveExtraSpaces=1
let g:NERDSpaceDelims=1


"/////////////////////////////////////////////////////////////////////////////
" MiniBufExpl
"/////////////////////////////////////////////////////////////////////////////
let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplUseSingleClick=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplMaxSize=1
let g:miniBufExplorerMoreThanOne=1
let g:miniBufExplCycleArround=1
"let g:miniBufExplMapWindowNavVim=1
noremap <leader>h :MBEbp<CR>
noremap <leader>l :MBEbn<CR>


"/////////////////////////////////////////////////////////////////////////////
" Tagbar
"/////////////////////////////////////////////////////////////////////////////
nnoremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_singleclick=1


"/////////////////////////////////////////////////////////////////////////////
" YouCompleteMe
"/////////////////////////////////////////////////////////////////////////////
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_complete_in_comments = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/settings/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt=menu,longest


"/////////////////////////////////////////////////////////////////////////////
" TagHighlight
"/////////////////////////////////////////////////////////////////////////////
nnoremap <silent> <F12> :UpdateTypesFile<CR>


"/////////////////////////////////////////////////////////////////////////////
" Cscope
"/////////////////////////////////////////////////////////////////////////////
":set cscopequickfix=s-,c-,d-,i-,t-,e-
set cst
set csto=1

nmap <C-C>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-C>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-C>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-C>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-C><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-G> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-C> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-T> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-E> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-C><C-F> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-C><C-I> :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-C><C-D> :cs find d <C-R>=expand("<cword>")<CR><CR>


"/////////////////////////////////////////////////////////////////////////////
" CtrlP
"/////////////////////////////////////////////////////////////////////////////
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=15
let g:ctrlp_mruf_max=500


"/////////////////////////////////////////////////////////////////////////////
" EasyMotion
"/////////////////////////////////////////////////////////////////////////////
let g:EasyMotion_leader_key = 'm'


"/////////////////////////////////////////////////////////////////////////////
" UltiSnips
"/////////////////////////////////////////////////////////////////////////////
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetsDir="~/.vim/settings/UltiSnips"
let g:UltiSnipsSnippetDirectories=["settings/UltiSnips"]
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"/////////////////////////////////////////////////////////////////////////////
" PowerLine
"/////////////////////////////////////////////////////////////////////////////
if has ("gui_running")
	set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
	set guifont=Sauce\ Code\ Powerline
	let g:Powerline_symbols = 'fancy'
	set t_Co=256
	let g:Powerline_cache_enabled = 1
	let g:Powerline_cache_file='~/.vim/bundle/powerline/Powerline.cache'
endif


"/////////////////////////////////////////////////////////////////////////////
" Vim Bookmark
"/////////////////////////////////////////////////////////////////////////////
let g:vbookmark_bookmarkSaveFile = $HOME . '/.vim/.vimbookmark'
nnoremap <silent> <F2> :VbookmarkNext<CR>


"/////////////////////////////////////////////////////////////////////////////
" vimprj
"/////////////////////////////////////////////////////////////////////////////
let g:vimprj_changeCurDirIfVimprjFound=0

function! <SID>SetMainDefaults()
	" your default options goes here!
	set tags=./.vimprj/tags
endfunction

call <SID>SetMainDefaults()

" initialize vimprj plugin
call vimprj#init()

" define a hook
function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
   call <SID>SetMainDefaults()
endfunction


"/////////////////////////////////////////////////////////////////////////////
" man
"/////////////////////////////////////////////////////////////////////////////
:source $VIMRUNTIME/ftplugin/man.vim
nmap K :Man 3 <cword><CR>


"/////////////////////////////////////////////////////////////////////////////
" Pydiction
"/////////////////////////////////////////////////////////////////////////////
"let g:pydiction_location = $HOME . '/.vim/bundle/Pydiction/complete-dict'
"let g:pydiction_menu_height = 20
"let &dictionary = g:pydiction_location


"/////////////////////////////////////////////////////////////////////////////
" Vimwiki
"/////////////////////////////////////////////////////////////////////////////
let g:vimwiki_use_mouse=1
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.path_html = '~/vimwiki/html/'
let wiki.template_path = '~/vimwiki/'
let wiki.template_default = 'default'
let wiki.template_ext = '.tpl'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c'}
let g:vimwiki_list = [wiki]
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_folding = 'expr'
let g:vimwiki_html_header_numbering = 0
let g:vimwiki_list_ignore_newline = 0
nmap <silent> <leader>tt :VimwikiToggleListItem<cr>


"/////////////////////////////////////////////////////////////////////////////
" VimOrganizer
"/////////////////////////////////////////////////////////////////////////////
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org call org#SetOrgFileType()
let g:org_command_for_emacsclient = 'emacsclient'


"/////////////////////////////////////////////////////////////////////////////
" vim-golang
"/////////////////////////////////////////////////////////////////////////////
filetype off
filetype plugin indent off
set runtimepath+=$HOME/.vim/bundle/vim-golang
filetype plugin indent on
syntax on


"/////////////////////////////////////////////////////////////////////////////
" other settings
"/////////////////////////////////////////////////////////////////////////////



" 自动运行
"autocmd VimEnter * nested NERDTree
"autocmd VimEnter * nested MiniBufExplorer
"autocmd VimEnter * nested TagbarOpen
