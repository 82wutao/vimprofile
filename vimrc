
" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'

" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home

" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim


"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用 vi 兼容模式
set nocompatible
" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

let mapleader = '\'                         " 全局leader设置
let maplocalleader = '_'                    " 本地leader设置 这个leader用于那些只对某类文件 （如Python文件、HTML文件）而设置的映射

" 自动缩进
set autoindent
" 打开 C/C++ 语言缩进优化
set cindent
"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------
" 设置缩进宽度
set sw=4
" 设置 TAB 宽度
set ts=4
" 禁止展开 tab (noexpandtab)
set noet
" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4

augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	"au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END


" 设置 Backspace 键模式
" set backspace=2                             " 解决插入模式下delete/backspce键失效问题
set backspace=indent,eol,start              " 缩进位置”，“行结束符”，“段首”。这样设置可以使得 backspace 键在这三个特殊的位置也能进行回删动作。

" 关闭自动换行
set nowrap

" 设置分隔符可视
set list                                    " 开启对于制表符（tab）、行尾空格符（trail）、行结束符（eol）等等特殊符号的回显
set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:.,eol:$  " 空格等无效字符显示
" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac

set textwidth=120                           " 内容宽度
set linebreak                               " 遇到指定的符号才折行，单词内不折行"
"set breakat-=_
"set nolinebreak                            " 取消自定义折行
set whichwrap=b,s,h,l,<,>,[,]               " 行尾可右移到下行，行首左移到上行,b：退格，s：空格，hl：左右，<>：n/v模式下的左右，[]：i/r模式下的左右
set wrapmargin=1
"set sidescroll=1                            " 可以实现更加平滑的逐个字符扩展显示
"set sidescrolloff=15
"set scrolljump=5                            " 光标离开屏幕范围
"set scrolloff=8
set report=0                                " 如果删除或修改的行数超过了指定的值会报告，0：永远报告"


" 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeout
" 功能键超时检测 50 毫秒
set ttimeoutlen=50

" 显示匹配的括号
set showmatch
" 显示括号匹配的时间
set matchtime=2


set cmdheight=2                             " 命令行（在状态行下）的高度，默认为1，这里是2
" 显示光标位置
set ruler

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw

" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m


" set noerrorbells                            " dont beep
" set visualbell                              " 视觉上的bell代替声音
" set novisualbell                            " dont beep
set noeb
" 开启视觉bell，但设置了一个值，这个值是null，相当于禁用
set vb t_vb=


set wildmenu                                " 命令模式自动补全时的文件菜单
set wildmode=list:longest,full              " 命令模式自动补全时，匹配最长子串，列出文件
set history=1000                            " remember more commands and search history

set ttimeout                                " 完整的按键码的超时时间
set ttimeoutlen=800                         " 按下esc键后800ms就生效


"----------------------------------------------------------------------
" 备份设置
"----------------------------------------------------------------------

" 允许备份
set backup
" 保存时备份
set writebackup
" 备份文件地址，统一管理
set backupdir=~/.vim/tmp
" 备份文件扩展名
set backupext=.bak
" 禁用交换文件
set noswapfile
" 禁用 undo文件
set noundofile
" 创建目录，并且忽略可能出现的警告
silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------
" 搜索时忽略大小写
set ignorecase
" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase
" 高亮搜索内容
set hlsearch
" 查找输入时动态增量显示查找结果
set incsearch


"----------------------------------------------------------------------
" 编码设置
"----------------------------------------------------------------------
if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8
	" 文件默认编码
	set fileencoding=utf-8
	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif


"----------------------------------------------------------------------
" 允许 Vim 自带脚本根据文件类型自动设置缩进等
"----------------------------------------------------------------------
if has('autocmd')
	filetype plugin indent on
endif


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')
	syntax enable
	syntax on
endif

"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable
	" 代码折叠默认使用缩进
	set fdm=indent
	" 默认打开所有缩进
	set foldlevel=99
endif


"----------------------------------------------------------------------
" 文件搜索和补全时忽略下面扩展名
"----------------------------------------------------------------------
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android


"----------------------------------------------------------------------
" 有 tmux 何没有的功能键超时（毫秒）
"----------------------------------------------------------------------
if $TMUX != ''
	set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
	set ttimeoutlen=80
endif
"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

"----------------------------------------------------------------------
" 终端下允许 ALT，详见：http://www.skywind.me/blog/archives/2021
" 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
"----------------------------------------------------------------------
if has('nvim') == 0 && has('gui_running') == 0
	function! s:metacode(key)
		exec "set <M-".a:key.">=\e".a:key
	endfunc
	for i in range(10)
		call s:metacode(nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(nr2char(char2nr('a') + i))
		call s:metacode(nr2char(char2nr('A') + i))
	endfor
	for c in [',', '.', '/', ';', '{', '}']
		call s:metacode(c)
	endfor
	for c in ['?', ':', '-', '_', '+', '=', "'"]
		call s:metacode(c)
	endfor
endif


"----------------------------------------------------------------------
" 终端下功能键设置
"----------------------------------------------------------------------
function! s:key_escape(name, code)
	if has('nvim') == 0 && has('gui_running') == 0
		exec "set ".a:name."=\e".a:code
	endif
endfunc


"----------------------------------------------------------------------
" 功能键终端码矫正
"----------------------------------------------------------------------
call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')





"----------------------------------------------------------------------
" 配置微调
"----------------------------------------------------------------------

" 修正 ScureCRT/XShell 以及某些终端乱码问题，主要原因是不支持一些
" 终端控制命令，比如 cursor shaping 这类更改光标形状的 xterm 终端命令
" 会令一些支持 xterm 不完全的终端解析错误，显示为错误的字符，比如 q 字符
" 如果你确认你的终端支持，不会在一些不兼容的终端上运行该配置，可以注释
if has('nvim')
	set guicursor=
elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
	let g:termcap_guicursor = &guicursor
	let g:termcap_t_RS = &t_RS
	let g:termcap_t_SH = &t_SH
	set guicursor=
	set t_RS=
	set t_SH=
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup

	" 清除同组的历史 autocommand
	au!
	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s
	" markdown 允许自动换行
	au FileType markdown setlocal wrap
	" lisp 进行微调
	" temp au FileType lisp setlocal ts=8 sts=2 sw=2 et
	" scala 微调
	" temp au FileType scala setlocal sts=4 sw=4 noet
	" haskell 进行微调
	" temp au FileType haskell setlocal et
	" quickfix 隐藏行号
	au FileType qf setlocal nonumber

	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog
augroup END



"----------------------------------------------------------------------
" 显示设置
"----------------------------------------------------------------------
set title
" 总是显示标签栏
set showtabline=2

" 总是显示行号
set number
" 设置相对显示number instead of 'set nu'
"set relativenumber
set norelativenumber

" 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）
set signcolumn=yes
" 总是显示状态栏
set laststatus=2

set cursorline
set cursorcolumn                            " 突出显示当前列

" 设置显示制表符等隐藏字符
set list

" 右下角显示命令
set showcmd

" 插入模式在状态栏下面显示 -- INSERT --，
" 先注释掉，默认已经为真了，如果这里再设置一遍会影响 echodoc 插件
" set showmode

" 水平切割窗口时，默认在右边显示新窗口
set splitright

"----------------------------------------------------------------------
" 颜色主题：色彩文件位于 colors 目录中
"----------------------------------------------------------------------
" 设置黑色背景
set background=dark
" 允许 256 色
set t_Co=256
" 设置颜色主题，会在所有 runtimepaths 的 colors 目录寻找同名配置
color desert256


"----------------------------------------------------------------------
" 状态栏设置
"----------------------------------------------------------------------
set statusline=                                 " 清空状态了
set statusline+=\ %F                            " 文件名
set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
set statusline+=%=                              " 向右对齐
set statusline+=\ %y                            " 文件类型

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)


"----------------------------------------------------------------------
" 更改样式
"----------------------------------------------------------------------

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
	hi! SpellBad gui=undercurl guisp=red
	hi! SpellCap gui=undercurl guisp=blue
	hi! SpellRare gui=undercurl guisp=magenta
	hi! SpellRare gui=undercurl guisp=cyan
else
	hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
	hi! SpellCap term=underline cterm=underline
	hi! SpellRare term=underline cterm=underline
	hi! SpellLocal term=underline cterm=underline
endif

" 去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
	\ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray


"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏
"----------------------------------------------------------------------
if has('terminal') && exists(':terminal') == 2
	if exists('##TerminalOpen')
		augroup VimUnixTerminalGroup
			au!
			au TerminalOpen * setlocal nonumber signcolumn=no
		augroup END
	endif
endif


"----------------------------------------------------------------------
" quickfix 设置，隐藏行号
"----------------------------------------------------------------------
augroup VimInitStyle
	au!
	au FileType qf setlocal nonumber
augroup END


"----------------------------------------------------------------------
" 标签栏文字风格：默认为零，GUI 模式下空间大，按风格 3显示
" 0: filename.txt
" 2: 1 - filename.txt
" 3: [1] filename.txt
"----------------------------------------------------------------------
if has('gui_running')
	let g:config_vim_tab_style = 3
endif


"----------------------------------------------------------------------
" 终端下的 tabline
"----------------------------------------------------------------------
function! Vim_NeatTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by MyTabLabel()
		let s .= ' %{Vim_NeatTabLabel(' . (i + 1) . ')} '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999XX'
	endif

	return s
endfunc


"----------------------------------------------------------------------
" 需要显示到标签上的文件名
"----------------------------------------------------------------------
function! Vim_NeatBuffer(bufnr, fullname)
	let l:name = bufname(a:bufnr)
	if getbufvar(a:bufnr, '&modifiable')
		if l:name == ''
			return '[No Name]'
		else
			if a:fullname
				return fnamemodify(l:name, ':p')
			else
				let aname = fnamemodify(l:name, ':p')
				let sname = fnamemodify(aname, ':t')
				if sname == ''
					let test = fnamemodify(aname, ':h:t')
					if test != ''
						return '<'. test . '>'
					endif
				endif
				return sname
			endif
		endif
	else
		let l:buftype = getbufvar(a:bufnr, '&buftype')
		if l:buftype == 'quickfix'
			return '[Quickfix]'
		elseif l:name != ''
			if a:fullname
				return '-'.fnamemodify(l:name, ':p')
			else
				return '-'.fnamemodify(l:name, ':t')
			endif
		else
		endif
		return '[No Name]'
	endif
endfunc


"----------------------------------------------------------------------
" 标签栏文字，使用 [1] filename 的模式
"----------------------------------------------------------------------
function! Vim_NeatTabLabel(n)
	let l:buflist = tabpagebuflist(a:n)
	let l:winnr = tabpagewinnr(a:n)
	let l:bufnr = l:buflist[l:winnr - 1]
	let l:fname = Vim_NeatBuffer(l:bufnr, 0)
	let l:num = a:n
	let style = get(g:, 'config_vim_tab_style', 0)
	if style == 0
		return l:fname
	elseif style == 1
		return "[".l:num."] ".l:fname
	elseif style == 2
		return "".l:num." - ".l:fname
	endif
	if getbufvar(l:bufnr, '&modified')
		return "[".l:num."] ".l:fname." +"
	endif
	return "[".l:num."] ".l:fname
endfunc


"----------------------------------------------------------------------
" GUI 下的标签文字，使用 [1] filename 的模式
"----------------------------------------------------------------------
function! Vim_NeatGuiTabLabel()
	let l:num = v:lnum
	let l:buflist = tabpagebuflist(l:num)
	let l:winnr = tabpagewinnr(l:num)
	let l:bufnr = l:buflist[l:winnr - 1]
	let l:fname = Vim_NeatBuffer(l:bufnr, 0)
	let style = get(g:, 'config_vim_tab_style', 0)
	if style == 0
		return l:fname
	elseif style == 1
		return "[".l:num."] ".l:fname
	elseif style == 2
		return "".l:num." - ".l:fname
	endif
	if getbufvar(l:bufnr, '&modified')
		return "[".l:num."] ".l:fname." +"
	endif
	return "[".l:num."] ".l:fname
endfunc



"----------------------------------------------------------------------
" 设置 GUI 标签的 tips: 显示当前标签有哪些窗口
"----------------------------------------------------------------------
function! Vim_NeatGuiTabTip()
	let tip = ''
	let bufnrlist = tabpagebuflist(v:lnum)
	for bufnr in bufnrlist
		" separate buffer entries
		if tip != ''
			let tip .= " \n"
		endif
		" Add name of buffer
		let name = Vim_NeatBuffer(bufnr, 1)
		let tip .= name
		" add modified/modifiable flags
		if getbufvar(bufnr, "&modified")
			let tip .= ' [+]'
		endif
		if getbufvar(bufnr, "&modifiable")==0
			let tip .= ' [-]'
		endif
	endfor
	return tip
endfunc


"----------------------------------------------------------------------
" 标签栏最终设置
"----------------------------------------------------------------------
set tabline=%!Vim_NeatTabLine()
set guitablabel=%{Vim_NeatGuiTabLabel()}
set guitabtooltip=%{Vim_NeatGuiTabTip()}





"filetype off
"filetype plugin indent off
call plug#begin('~/.vim/plugged')                           " 在这里面输入安装的插件

" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'

" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
Plug 'mh21/errormarker.vim'
" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
Plug 'skywind3000/vim-preview'


" 支持库，给其他插件用的函数库
Plug 'xolox/vim-misc'


" About assistance

Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'


Plug 'farmergreg/vim-lastplace'                             " 重新打开文件时定位到上次关闭时的位置
Plug 'romainl/vim-cool'                                     " 当移动后取消所有search的高亮文本
Plug 'vim-scripts/TaskList.vim'                             " <leader>td 中转到TODO, XXX等关键词所在的行


Plug 'itchyny/vim-cursorword'                               " 给光标下的单词增加下滑线
Plug 'majutsushi/tagbar'                                    " 代码函数变量预览


Plug 'mhinz/vim-signify'                                    " Just for git, <leader>se <leader>sd <leader>st
""Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" About themes
" 一次性安装一大堆 colorscheme
"Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/khaki.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mavnn/mintty-colors-solarized'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'crusoexia/vim-dracula'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'                                   " cowsay and 数字键打开历史文件
"Plug 'Yggdroot/indentLine'                                  " 缩进层次性感线条
"Plug 'junegunn/vim-easy-align'

Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'                                 " 自动匹配成对字符如括号等


" About efficiency
Plug 'dense-analysis/ale'                                             " 代码静态检查，代码格式修正, 见配置并需要安装各语言依赖, 如flake8
""Plug 'vim-syntastic/syntastic'


" 提供 ctags/gtags 后台数据库自动更新功能
Plug 'ludovicchabant/vim-gutentags'

" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
Plug 'skywind3000/gutentags_plus'

Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

Plug 'tpope/vim-commentary'                                 " gcc 注释单行，gc 注释选中的行

Plug 'SirVer/ultisnips'                                     " 代码片段 配合vim-snippets and coc-nvim
Plug 'honza/vim-snippets'                                   " ctrl+j, ctrl+k, 输入代码片段的关键字后, 使用这两个快捷键前进后退

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dgryski/vim-godef'
Plug 'buoto/gotests-vim'

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } "写python语言的各种操作, 见配置a
Plug 'yssource/python.vim'                                  " python 推荐：****

Plug 'rstacruz/sparkup', {'rtp': 'vim/'} 



" lua 语法高亮增强
Plug 'tbastos/vim-lua', { 'for': 'lua' }
" C++ 语法高亮增强，支持 11/14/17 标准
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
" 额外语法文件
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
" python 语法文件增强
Plug 'vim-python/python-syntax', { 'for': ['python'] }
" vim org-mode
Plug 'jceb/vim-orgmode', { 'for': 'org' }

call plug#end()

"syntax enable
"syntax on
"filetype on
"filetype plugin indent on

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc

" ------------------------------------------------
" For Signify see :help Signify
" ------------------------------------------------
" signify 调优
let g:signify_disable_by_default=1
let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change

" git 仓库使用 histogram 算法进行 diff
let g:signify_vcs_cmds = {
    \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
    \}

nnoremap <leader>se :SignifyEnable<CR>
nnoremap <leader>st :SignifyToggle<CR>
nnoremap <leader>sd :SignifyDiff<CR>

" 使用 <space>ha 清除 errormarker 标注的错误
noremap <silent><space>ha :RemoveErrorMarkers<cr>


" ------------------------------------------------
" For startify
" ------------------------------------------------
" 默认不显示 startify
let g:startify_disable_at_vimenter = 0
let g:startify_session_dir = '~/.vim/session'
let g:startify_change_to_dir = 0


" -----------------------------
" NERDTree
" -----------------------------
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

""当NERDTree为剩下的唯一窗口时自动关闭
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" setting about UI
let NERDTreeAutoCenter=1                                      " 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
"NERDTreeAutoCenterThreshold                          " 配合autocenter 使用
let NERDTreeWinSize=25                                      " 设置宽度
let NERDTreeQuitOnOpen=0                          " Close NERDTree when files was opened
" let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI = 1                                   " Start NERDTree in mini UI mode, no help lines
let NERDTreeDirArrows = 1
"let NERDTreeChDirMode = 2                                " Change current working directory on root directory in NERDTree
let NERDTreeChDirMode=0

let NERDTreeShowHidden=1                                    " 是否显示隐藏文件
" let NERDTreeShowLineNumbers=1                             " 显示行号
" let NERDTreeShowBookmarks=1                                 " 开启Nerdtree时自动显示Bookmarks
let NERDTreeMouseMode=2                                       " 1 doubleClick open; 2 click for dir, doubleClick for file; 3 click
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']    " 忽略一下文件的显示


let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"修改树的显示图标
let g:NERDTreeGitStatusIndicatorMapCustom ={
            \ "Modified"  : "Mdf",
            \ "Staged"    : "Stg",
            \ "Untracked" : "Utr",
            \ "Renamed"   : "Rnm",
            \ "Unmerged"  : "Umg",
            \ "Deleted"   : "Del",
            \ "Dirty"     : "Dty",
            \ "Clean"     : "Cln",
            \ 'Ignored'   : 'Ign',
            \ "Unknown"   : "Ukn"
            \ }

let g:NERDTreeGitStatusUseNerdFonts = 0 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 0  " a heavy feature may cost much more time. default: 0

let g:NERDTreeGitStatusUntrackedFilesMode = 'normal' " all is a heavy feature too. default: normal
"let g:NERDTreeGitStatusGitBinPath = '/your/file/path' " default: git (auto find in path)
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0 DO NOT enable this feature if you have also installed vim-devicons.

" --------------------------
" syntastic 配置
" --------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 5
"let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
"function! ToggleErrors()          " 设置每次w保存后语法检查
"    Errors
"endfunction
"autocmd WinEnter * if &buftype ==#'quickfix' && winnr('$') == 1 | quit |endif
"autocmd WinLeave * lclose

" ---------------------
" indentLine
" ---------------------
let g:indent_guides_size = 1
let g:indent_guides_level = 2


" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_powerline_fonts = 0
" let g:airline_exclude_preview = 1
" let g:airline_section_b = '%n'
" let g:airline_theme='deus'
" let g:airline#extensions#branch#enabled = 0
" let g:airline#extensions#syntastic#enabled = 0
" let g:airline#extensions#fugitiveline#enabled = 0
" let g:airline#extensions#csv#enabled = 0
" let g:airline#extensions#vimagit#enabled = 0

" airline设置"
let g:airline_theme='papercolor'                     " 设置主题
let g:airline_powerline_fonts = 1                    " 使用powerline打过补丁的字体
let g:airline#extensions#tabline#enabled = 1         " 开启tabline
let g:airline#extensions#tabline#left_sep = ' '      " tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'  " tabline中未激活buffer两端的分隔字符    
let g:airline#extensions#tabline#buffer_nr_show = 1  " tabline中buffer显示编号
let g:airline#extensions#tabline#formatter = 'default'    
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 '
            \}
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline_skip_empty_sections = 1

" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['pom.xml','.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)              " 检测 ~/.cache/tags 不存在就新建
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 使用 universal-ctags 的话需要下面这行，请反注释
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 默认禁用自动生成
let g:gutentags_modules = []
" 如果有 ctags 可执行就允许动态生成 ctags 文件
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
" 如果有 gtags 可执行就允许动态生成 gtags 数据库
if executable('gtags') && executable('gtags-cscope')
	let g:gutentags_modules += ['gtags_cscope']
endif


" 禁止 gutentags 自动链接 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 0


" ------------------------------------------------
" For ale
" normal下sp, sn跳转到上一个，下一个错误，lc关闭或者打开错误列表
" more see :help ale
" ------------------------------------------------ 
let g:ale_sign_column_always = 0 
"let g:ale_sign_column_always = 1

"let g:ale_set_highlights = 0
let g:ale_set_highlights = 1
let g:ale_change_sign_column_color = 0
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta


"自定义error和warning图标
"let g:ale_sign_error = "EE"
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%]  %code% : %s'

" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1 "打开quitfix对话框 
" Set this if you want to.
" This can be useful if you are combining ALE with some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0
"let g:ale_list_vertical = 1


"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK'] "在vim自带的状态栏中整合ale
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()} "设置状态栏显示的内容

"如果你有使用airline的话，会发现airline默认也能显示ale相关的symbol，error对应的是”E”，warning对应的是”W”，
"如果你想把自定义的error和warning图标整合到airline的话，
"需要修改~/.vim/plugged/vim-airline/autoload/airline/extensions/ale.vim这个文件，方法是打开上面提到的ale.vim文件，找到下面这两句并注释掉
"let s:error_symbol = get(g:, 'airline#extensions#ale#error_symbol', 'E:')
"let s:warning_symbol = get(g:, 'airline#extensions#ale#warning_symbol', 'W:')
"然后再添加下面这两句就可以了
"let s:error_symbol = get(g:, 'airline#extensions#ale#error_symbol', '✗ ')
"let s:warning_symbol = get(g:, 'airline#extensions#ale#warning_symbol', '⚡ ')



"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp  <Plug>(ale_previous_wrap)
nmap sn  <Plug>(ale_next_wrap)
        
nmap <Leader>at :ALEToggle<CR>        "<Leader>s触发/关闭语法检查
nmap <Leader>ad :ALEDetail<CR>         "<Leader>d查看错误或警告的详细信息


let g:ale_linters_explicit = 1                        "除g:ale_linters指定，其他不可用
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500

" 设定检测的时机：normal 模式文字改变，或者离开 insert模式
" 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
let g:ale_lint_on_save =0                 "default this is 1,if u only wish lint on save  turn off following
let g:ale_lint_on_text_changed = 'normal' " Write this in your vimrc file            another option:   never
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0         " if you don't want linters to run on opening a file



" *****How can I configure my C or C++ project?
" 项目结构不同，编译容易，编译参数不容易
"The structure of C and C++ projects varies wildly from project to project, with many different build tools being used for building them, and many different formats for project configuration files. 
" ALE can run compilers easily, but ALE cannot easily detect which compiler flags to use.

"Some tools and build configurations can generate compile_commands.json files. 
"The cppcheck, clangcheck, clangtidy and cquery linters can read these files for automatically determining the appropriate compiler flags to use.

" For linting with compilers like gcc and clang, and with other tools, you will need to tell ALE which compiler flags to use yourself. 
" You can use different options for different projects with the g:ale_pattern_options setting. Consult the documentation for that setting for more information. 
" b:ale_linters can be used to select which tools you want to run, say if you want to use only gcc for one project, and only clang for another.

"ALE will attempt to parse compile_commands.json files to discover compiler flags to use when linting code. See :help g:ale_c_parse_compile_commands for more information. 
"See Clang's documentation for compile_commands.json files. You should strongly consider generating them in your builds, which is easy to do with CMake.

"You can also configure ALE to automatically run make -n to run dry runs on Makefiles to discover compiler flags. 
" This can execute arbitrary code, so the option is disabled by default. See :help g:ale_c_parse_makefile.

"You may also configure buffer-local settings for linters with project-specific vimrc files. local_vimrc can be used for executing local vimrc files which can be shared in your project.

" 编辑不同文件类型需要的语法检查器
let g:ale_linters = {
            \   'c': [ 'gcc', 'cppcheck'],
            \   'cpp': ['gcc', 'cppcheck'],
            \   'python': ['pylint'],
            \   'bash': ['shellcheck'],
            \   'go': ['golint','go build', 'gofmt'],
            \   'java': ['javac'],
            \   'javascript': ['eslint'],
            \}
""            \   'rust': [ 'cargo', 'rls', 'rustc' ],
""let g:ale_linters_ignore = {'python': ['pylint']}
""let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_fixers = {
            \   'python': ['autopep8', 'black', 'isort'],
            \   'javascript': ['eslint'],
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
"\   'rust': ['rustfmt'],

" 获取 pylint, flake8 的配置文件，在 vim-init/tools/conf 下面
function s:lintcfg(name)
	let conf = s:path('tools/conf/')
	let path1 = conf . a:name
	let path2 = expand('~/.vim/linter/'. a:name)
	if filereadable(path2)
		return path2
	endif
	return shellescape(filereadable(path2)? path2 : path1)
endfunc
" 设置 flake8/pylint 的参数
let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')
let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
let g:ale_python_pylint_options .= ' --disable=W'

let g:ale_c_gcc_options = '-Wall -O2 -std=c11'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_linters.text = ['textlint', 'write-good', 'languagetool']
" 如果没有 gcc 只有 clang 时（FreeBSD）
if executable('gcc') == 0 && executable('clang')
    let g:ale_linters.c += ['clang']
	let g:ale_linters.cpp += ['clang']
endif


" ALE supports jumping to the definition of words under your cursor with the :ALEGoToDefinition command using any enabled Language Server Protocol linters and tsserver.
" ALE supports finding references for words under your cursor with the :ALEFindReferences command using any enabled Language Server Protocol linters and tsserver.
" ALE supports "hover" information for printing brief information about symbols at the cursor taken from Language Server Protocol linters and tsserver with the ALEHover command.
"          Truncated information will be displayed when the cursor rests on a symbol by default, as long as there are no problems on the same line.

" ALE supports searching for workspace symbols via Language Server Protocol linters with the ALESymbolSearch command.
"          Search queries can be performed to find functions, types, and more which are similar to a given query string.

" **refator
" ALE supports renaming symbols in symbols in code such as variables or class names with the ALERename command.
" ALECodeAction will execute actions on the cursor or applied to a visual range selection, such as automatically fixing errors.


" 在 linux/mac 下降低语法检查程序的进程优先级（不要卡到前台进程）
if has('win32') == 0 && has('win64') == 0 && has('win32unix') == 0
	let g:ale_command_wrapper = 'nice -n5'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp 和 Ctrlp-funky(,fu)
let g:ctrlp_map = ''
" CTRL+p 打开文件模糊匹配
noremap <c-p> :CtrlP<cr>
" CTRL+n 打开最近访问过的文件的匹配
noremap <c-n> :CtrlPMRUFiles<cr>
" ALT+p 显示当前文件的函数列表
noremap <m-p> :CtrlPFunky<cr>
" ALT+n 匹配 buffer
noremap <m-n> :CtrlPBuffer<cr>

" 项目标志
let g:ctrlp_root_markers = ['.project', '.root', '.svn', '.git']
let g:ctrlp_working_path = 0
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
		  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
		  \ 'file': '\v\.(exe|so|dll|mp3|wav|sdf|suo|mht|pyc)$',
		  \ 'link': 'some_bad_symbolic_links',
		  \ }

if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
    " On Windows use "dir" as fallback command.
else
    let s:ctrlp_fallback = 'find %s -type f'
endif

if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': s:ctrlp_fallback
\ }
if isdirectory(expand("~/.vim/plugged/ctrlp-funky/"))
    " CtrlP extensions
    let g:ctrlp_extensions = ['funky']
    "funky
    nnoremap <leader>fu :CtrlPFunky<Cr>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}       "设置要自动配对的符号
let g:AutoPairs['<']='>'                                            "添加要自动配对的符号<>
let b:AutoPairs = g:AutoPairs                                       "设置要自动配对的符号，默认为g:AutoPairs，可以通过自动命令来对不同文件类型设置不同自动匹配对符号。
let g:AutoPairsShortcutToggle = '<M-p>'                             "设置插件打开/关闭的快捷键，默认为ALT+p。
let g:AutoPairsShortcutFastWrap = '<M-e>'                           "设置自动为文本添加圆括号的快捷键，默认为ALT+e。
let g:AutoPairsShortcutJump = '<M-n>'                               "设置调到下一层括号对的快捷键，默认为ALT+n。
let g:AutoPairsShortcutBackInsert = '<M-b>'                         "设置撤销飞行模式的快捷键，默认为ALT+b。
let g:AutoPairsMapBS = 1                                            "把BACKSPACE键映射为删除括号对和引号，默认为1。
let g:AutoPairsMapCh = 1                                            "把ctrl+h键映射为删除括号对和引号，默认为1。
let g:AutoPairsMapCR = 1                                            "把ENTER键映射为换行并缩进，默认为1。
let g:AutoPairsCenterLine = 1                                       "当g:AutoPairsMapCR为1时，且文本位于窗口底部时，自动移到窗口中间。
let g:AutoPairsMapSpace = 1                                         "把SPACE键映射为在括号两侧添加空格，默认为1。
let g:AutoPairsFlyMode = 0                                          "启用飞行模式，默认为0。
let g:AutoPairsMultilineClose = 1                                   "启用跳出多行括号对，默认为1，为0则只能跳出同一行的括号。

" ------------------------------------------------
" For vim-cool
" ------------------------------------------------
let g:CoolTotalMatches = 1

" ------------------------------------------------
" For rainbow_parentheses.vim
" http://vimawesome.com/plugin/rainbow-parentheses-vim   花里胡哨的彩虹括号^_^
" http://www.wklken.me/posts/2015/06/07/vim-plugin-rainbowparentheses.html
" ------------------------------------------------
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" \ ['black',       'SeaGreen3'],           " 不加入这行, 防止黑色括号出现, 很难识别

" ------------------------------------------------
" For python-mode
" 使用python模式编写python代码，并禁用lint, flod, rope功能
" motion定义 [[, ]], [M, ]M 跳转到前后类，函数
" motion定义新文本对象 aM, aC, iM, iC, 如yaM,diC分表表示复制一个method, 删除一个Class
" 使用,r 运行当前python代码 (建议不要运行有输入的，或者超长时间超多输出的代码)
" more see :help pymode
" ------------------------------------------------
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_lint = 0
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_breakpoint = 0
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

autocmd BufEnter *.py set cc=81             " 打开py文件81行高亮





" ------------------------------------------------
"  For commentary
" ------------------------------------------------
autocmd FileType apache setlocal commentstring=#\ %s

" ------------------------------------------------
" For tagbar
" 使用 ,tt 打开或者关闭代码函数关键字等预览
" more see :help tagbar
" ------------------------------------------------
nnoremap <leader>tt :TagbarToggle<CR>
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                    \ 't' : 'ctype',
                    \ 'n' : 'ntype'
                    \ },
                    \ 'scope2kind' : {
                        \ 'ctype' : 't',
                        \ 'ntype' : 'n'
                        \ },
                        \ 'ctagsbin'  : 'gotags',
                        \ 'ctagsargs' : '-sort -silent'
                        \ }



" --------------------------------------------------------
" vim go
" ---------------------------------------------------------
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
""let g:go_version_warning = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

" -------------------------
"  gotests
" -------------------------
let g:gotests_bin = '/home/wutao/go/bin/gotests'

" ------------------------------------------------
" For TaskList.vim
" 使用 ,tl 快速浏览及跳转TODO, XXX等关键词所在的行
" more see :help TaskList
" ------------------------------------------------
nmap <leader>ls <Plug>TaskList


" ------------------------------------------------
" For ultisnips and coc-ultisnips and vim-snippets
" 使用Ctrl+j, Ctrl+k 作为snippets时的跳转键
" more see :help ultisnips and :help vim-snippets
" ------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
" ------------------------------------------------

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif



cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
com! FormatJSONPy2Utf8 %!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=2)"

" select last paste in visual mode, gv选择原始复制的文本, gb选择上一次粘贴的文本
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . ']`'


" ------------------------------------------------
" For themes
" 如果主题等写成前面效果不一致，那就写到最后面吧
" highlight Normal ctermbg=None 可以去除灰层
" higtlight clear SignColumn 可以使得SignColumn颜色主题与使用主题一致
" ------------------------------------------------

" -----------------
" color
" -----------------
set t_Co=256
set t_ut=                                   " 防止vim背景颜色错误
" 之前的高亮线太难看，重新制定颜色，这里的black和iterm2颜色配置中的black一样
hi CursorLine   cterm=NONE ctermbg=black guibg=black
hi CursorColumn   cterm=NONE ctermbg=black guibg=black
hi LineNr ctermbg=black
" -----------------
" theme
" -----------------
let g:PaperColor_Theme_Options = {
            \ 'theme':{
            \ 'default':{
            \ 'transparent_background':0,
            \ 'override':{},
            \ 'allow_bold':0,
            \ 'allow_italic':0,
            \ }
            \ },
            \ 'language':{
            \ 'python':{'highlight_builtins':1},
            \ 'cpp':{'highlight_standard_library':1},
            \ 'c':{'highlight_builtins':1},
            \ 'go':{'highlight_builtins':1},
            \ 'sh':{}
            \ }
            \ }

set termguicolors
set background=light
""colorscheme one
colorscheme PaperColor
highlight Normal ctermbg=None
highlight clear SignColumn


"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
" temp inoremap <c-a> <home>
" temp inoremap <c-e> <end>
" temp inoremap <c-d> <del>
" temp inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
" temp noremap <C-h> <left>
" temp noremap <C-j> <down>
" temp noremap <C-k> <up>
" temp noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
" temp cnoremap <c-h> <left>
" temp cnoremap <c-j> <down>
" temp cnoremap <c-k> <up>
" temp cnoremap <c-l> <right>
" temp cnoremap <c-a> <home>
" temp cnoremap <c-e> <end>
" temp cnoremap <c-f> <c-d>
" temp cnoremap <c-b> <left>
" temp cnoremap <c-d> <del>
" temp cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <leader>+数字键 切换tab
"----------------------------------------------------------------------
" temp noremap <silent><leader>1 1gt<cr>
" temp noremap <silent><leader>2 2gt<cr>
" temp noremap <silent><leader>3 3gt<cr>
" temp noremap <silent><leader>4 4gt<cr>
" temp noremap <silent><leader>5 5gt<cr>
" temp noremap <silent><leader>6 6gt<cr>
" temp noremap <silent><leader>7 7gt<cr>
" temp noremap <silent><leader>8 8gt<cr>
" temp noremap <silent><leader>9 9gt<cr>
" temp noremap <silent><leader>0 10gt<cr>


"----------------------------------------------------------------------
" ALT+N 切换 tab
"----------------------------------------------------------------------
" temp noremap <silent><m-1> :tabn 1<cr>
" temp noremap <silent><m-2> :tabn 2<cr>
" temp noremap <silent><m-3> :tabn 3<cr>
" temp noremap <silent><m-4> :tabn 4<cr>
" temp noremap <silent><m-5> :tabn 5<cr>
" temp noremap <silent><m-6> :tabn 6<cr>
" temp noremap <silent><m-7> :tabn 7<cr>
" temp noremap <silent><m-8> :tabn 8<cr>
" temp noremap <silent><m-9> :tabn 9<cr>
" temp noremap <silent><m-0> :tabn 10<cr>
" temp inoremap <silent><m-1> <ESC>:tabn 1<cr>
" temp inoremap <silent><m-2> <ESC>:tabn 2<cr>
" temp inoremap <silent><m-3> <ESC>:tabn 3<cr>
" temp inoremap <silent><m-4> <ESC>:tabn 4<cr>
" temp inoremap <silent><m-5> <ESC>:tabn 5<cr>
" temp inoremap <silent><m-6> <ESC>:tabn 6<cr>
" temp inoremap <silent><m-7> <ESC>:tabn 7<cr>
" temp inoremap <silent><m-8> <ESC>:tabn 8<cr>
" temp inoremap <silent><m-9> <ESC>:tabn 9<cr>
" temp inoremap <silent><m-0> <ESC>:tabn 10<cr>



"----------------------------------------------------------------------
" 缓存：插件 unimpaired 中定义了 [b, ]b 来切换缓存
"----------------------------------------------------------------------
" temp noremap <silent> <leader>bn :bn<cr>
" temp noremap <silent> <leader>bp :bp<cr>

"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>to :tabonly<cr>


" 左移 tab
function! Tab_MoveLeft()
	let l:tabnr = tabpagenr() - 2
	if l:tabnr >= 0
		exec 'tabmove '.l:tabnr
	endif
endfunc

" 右移 tab
function! Tab_MoveRight()
	let l:tabnr = tabpagenr() + 1
	if l:tabnr <= tabpagenr('$')
		exec 'tabmove '.l:tabnr
	endif
endfunc

noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>
noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>


"----------------------------------------------------------------------
" ALT 键移动增强
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
noremap <m-h> b
noremap <m-l> w
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转）
noremap <m-j> gj
noremap <m-k> gk
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

" 命令模式下的相同快捷
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>

" ALT+y 删除到行末
noremap <m-y> d$
inoremap <m-y> <c-\><c-o>d$


"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
	" vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
	" 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
	" 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
	set termwinkey=<c-_>
	tnoremap <m-H> <c-_>h
	tnoremap <m-L> <c-_>l
	tnoremap <m-J> <c-_>j
	tnoremap <m-K> <c-_>k
	tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
	" neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
	tnoremap <m-H> <c-\><c-n><c-w>h
	tnoremap <m-L> <c-\><c-n><c-w>l
	tnoremap <m-J> <c-\><c-n><c-w>j
	tnoremap <m-K> <c-\><c-n><c-w>k
	tnoremap <m-q> <c-\><c-n>
endif


" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>


"----------------------------------------------------------------------
" F2 在项目目录下 Grep 光标下单词，默认 C/C++/Py/Js ，扩展名自己扩充
" 支持 rg/grep/findstr ，其他类型可以自己扩充
" 不是在当前目录 grep，而是会去到当前文件所属的项目目录 project root
" 下面进行 grep，这样能方便的对相关项目进行搜索
"----------------------------------------------------------------------
if executable('rg')
	noremap <silent><F2> :AsyncRun! -cwd=<root> rg -n --no-heading
				\ --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim
				\ <C-R><C-W> "<root>" <cr>
elseif has('win32') || has('win64')
	noremap <silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>"
				\ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.js"
				\ "\%CD\%\*.vim"
				\ <cr>
else
	noremap <silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W>
				\ --include='*.h' --include='*.c*' --include='*.py'
				\ --include='*.js' --include='*.vim'
				\ '<root>' <cr>
endif

" set complete=.,w,b,u,t,i
" 在当前缓冲区中进行查找；
" 在其他窗口中进行查找；
" 在其他已载入的缓冲区中进行查找；
" 在没有载入缓冲区的文件中进行查找；
" 在当前的标签（tags）列表进行查找；
" 在由当前文件（如#include）包含进来的头文件中进行查找。


nnoremap fmt gg<S-v><S-g>=
