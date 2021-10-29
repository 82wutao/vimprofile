"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用 vi 兼容模式
set nocompatible
" Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set winaltkeys=no

" set noerrorbells                            " dont beep
" set visualbell                              " 视觉上的bell代替声音
" set novisualbell                            " dont beep
set noeb
set vb t_vb=                                " 开启视觉bell，但设置了一个值，这个值是null，相当于禁用

set lazyredraw                              " 延迟绘制（提升性能）

let mapleader = '\'                         " 全局leader设置
let maplocalleader = '_'                    " 本地leader设置 这个leader用于那些只对某类文件 （如Python文件、HTML文件）而设置的映射




" 设置 Backspace 键模式
" set backspace=2                             " 解决插入模式下delete/backspce键失效问题
set backspace=indent,eol,start              " 缩进位置”，“行结束符”，“段首”。这样设置可以使得 backspace 键在这三个特殊的位置也能进行回删动作。


" 设置分隔符可视
set list                                    " 开启对于制表符（tab）、行尾空格符（trail）、行结束符（eol）等等特殊符号的回显
set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:.,eol:$  " 空格等无效字符显示
" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<



" 缩进折行也可以看作样式，是编辑区内的样式，或者是编辑习惯
set textwidth=120                           " 内容宽度
set linebreak                               " 遇到指定的符号才折行，单词内不折行"

set formatoptions+=m                        " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B                        " 合并两行中文时，不在中间加空格
set ffs=unix,dos,mac                        " 文件换行符，默认使用 unix 换行符

"set breakat-=_
"set nolinebreak                            " 取消自定义折行
set whichwrap=b,s,h,l,<,>,[,]               " 行尾可右移到下行，行首左移到上行,b：退格，s：空格，hl：左右，<>：n/v模式下的左右，[]：i/r模式下的左右
set wrapmargin=1
"set sidescroll=1                            " 可以实现更加平滑的逐个字符扩展显示
"set sidescrolloff=15
"set scrolljump=5                            " 光标离开屏幕范围
"set scrolloff=8


set history=1000                            " remember more commands and search history
set report=0                                " 如果删除或修改的行数超过了指定的值会报告，0：永远报告"
set ttimeout                                " 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
set ttimeoutlen=500                         " 功能键超时检测 50 毫秒


set showmatch                               " 显示匹配的括号
set matchtime=2                             " 显示括号匹配的时间


set cmdheight=2                             " 命令行（在状态行下）的高度，默认为1，这里是2
set ruler                                   " 显示光标位置

set display=lastline                        " 显示最后一行



" 错误格式
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m

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
" 自动缩进
set autoindent
" 打开 C/C++ 语言缩进优化
set cindent
"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------
set expandtab
set smarttab

" 设置缩进宽度
set sw=4
" 设置 TAB 宽度
set ts=4
" 禁止展开 tab (noexpandtab)
"set noet
" 如果后面设置了 expandtab 那么展开 tab 为多少字符
set softtabstop=4

set lbr
set tw=500

set ai
set si
set wrap
" set nowrap

augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	"au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END
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


" 允许下方显示目录
set wildmenu                                " 命令模式自动补全时的文件菜单
set wildmode=list:longest,full              " 命令模式自动补全时，匹配最长子串，列出文件
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
" autocmd BufReadPost *
" 	\ if line("'\"") > 1 && line("'\"") <= line("$") |
" 	\	 exe "normal! g`\"" |
" 	\ endif
" 
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
