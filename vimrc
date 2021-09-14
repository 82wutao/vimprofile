" ----------------------
" For encoding
" ----------------------
" 不管文件的编码如何，不管如何显示和输入，Vim 内部使用的编码是 UTF-8；这是国际化支持的基础。
set encoding=utf-8
" set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 取决于实际的终端或 X Window 的设定。
" 举例来说，如果选择语言简体中文登录到 X Window，或者正在使用 CXTERM [10] 的话，那么该选项应被设为 GB2312；
" 如果使用缺省的语言（LANG=en_US.UTF-8）登录到 X Window，或者使用 PuTTY [11] 远程访问 Linux 机器、并且设定里的字符编码（配置中 Window-Translation）设为 UTF-8 的话，该选项就应该设为 utf-8。
" 从 Windows 下使用 PuTTY 远程连接 Linux 的请特别注意，测试表明，仅在使用 UTF-8 的情况下，PuTTY 才能可靠地支持中文的显示和输入（显示字体必须设成中文字体）。
" set termencoding
" set termencoding=utf-8

" 文件载入时，该选项被置为 Vim 认定的文件编码，因此，存储时文件的编码不会改变。
" 此处和下面 fileencodings 可使用的编码为 libiconv 支持的所有几百种编码（如果编译时包含了 iconv 特性的话），与中文相关的有 gb2312、gbk、gb18030、hz-gb-2312、iso-2022-cn、big5、cp936、cp950 等。
" 如果创建新文件，你又不希望使用 UTF-8 作为文件编码时，那么，你可能需要手工设定该选项，如“:set fileencoding=gb2312”。
" 需要注意的一点是，使用“set”来设定该选项的话会改变以后新建文件的缺省编码，而使用 “setlocal”的话则只影响当前文件（参考“:help setlocal”）。
" set fileencoding
" set fileencoding=utf-8

" Vim 会首先判断文件的开头是否是一个 Unicode [7] 的 BOM（byte order mark）字符 [8]，
" 是的话则把文件的其余内容解释成相应的 Unicode 序列；
" 否的话再试图把文件内容解释成 UTF-8 的序列；
" 再失败的话，则把文件解释为简体中文（chinese 是一个跨平台的简体中文字符集的别名，Linux 下相当于 gb2312 和 euc-cn；此处也可以根据需要以 gb2312、gbk 或 gb18030 等编码替代）。
" 需要注意的是，该顺序不能颠倒，并且在后面再添加其它编码如 big5、latin1 也是没有意义的，因为 Vim 不能识别 8 比特编码中的错误，因此这些编码后列的编码永远不会被用到。
" set fileencodings=ucs-bom,utf-8,chinese
" set fileencodings=ucs-bom,utf-8,cp936

" 把所有的“不明宽度”字符 [9]——指的是在 Unicode 字符集中某些同时在东西方语言中使用的字符，如省略号、破折号、书名号和全角引号，在西方文字中通常字符宽度等同于普通 ASCII 字符，而在东方文字中通常字符宽度等同于两倍的普通 ASCII 字符，因而其宽度“不明”——的宽度置为双倍字符宽度（中文字符宽度）。
" 此数值只在 encoding 设为 utf-8 或某一 Unicode 编码时才有效。
" 需要额外注意的是，如果你通过终端使用 Vim 的话，需要令终端也将这些字符显示为双宽度。
" 比如，XTERM [12] 的情况下应该使用选项“-cjk”，即使用命令“uxterm -cjk”来启动使用双宽度显示这些字符的 Unicode X 终端；
" 使用 PuTTY 远程连接的话则应在配置的 Window-Translation 中选中“Treat CJK ambiguous characters as wide”（参见图 3）。
"set ambiwidth=double

" set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" set termencoding=utf-8
" set encoding=utf-8

" -------------------------------------
" vim base setting
" -------------------------------------
let mapleader = '\'                         " 全局leader设置
let maplocalleader = '_'                    " 本地leader设置 这个leader用于那些只对某类文件 （如Python文件、HTML文件）而设置的映射

scriptencoding utf-8
set nocompatible 
set shortmess+=c                            " 关闭欢迎页面

set showmatch                               " 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set matchtime=20                            " 高亮匹配时高亮时长单位时1/10 second"
"set showmode                               " 左下角显示当前 vim 模式
set showcmd                                 " 在屏幕右下角显示未完成的指令输入
set laststatus=2                            " 总是显示状态行。0：no show; 1:show just multiple windown; 2:always
set cmdheight=2                             " 命令行（在状态行下）的高度，默认为1，这里是2
set ruler                                   " 在状态行显示光标所在的行列

set t_Co=256

" set noerrorbells                            " dont beep
" set visualbell                              " 视觉上的bell代替声音 
" set novisualbell                            " dont beep
set noeb
set vb t_vb=                                " 开启视觉bell，但设置了一个值，这个值是null，相当于禁用 "

filetype indent on
" cinoptions （C 语言缩进的具体方式，请参考:help cinoptions-values）；
" paste （粘贴模式，会取消所有上述选项的影响来保证后面的操作——通常是从剪贴板粘贴代码——保持原有代码的风格；使用 nopaste 取消设置）。
set autoindent                              " autoindent （自动缩进，即每行的缩进值与上一行相等；使用 noautoindent 取消设置）；
" set cindent
set nocindent                               " cindent （使用 C 语言的缩进方式，根据特殊字符如“{”、“}”、“:”和语句是否结束等信息自动调整缩进；在编辑 C/C++ 等类型文件时会自动设定；使用 nocindent 取消设置）；
" set smartindent

set tabstop=4                               " tabstop（制表符的宽度）；
set expandtab                               " expandtab （是否在缩进和遇到 Tab 键时使用空格替代；使用 noexpandtab 取消设置）；
" set smarttab                                  " 根据文件中其他地方的缩进空格个数来确定一个 tab 是多少个空格
set softtabstop=4                           " softtabstop（软制表符宽度，设置为非零数值后使用 Tab 键和 Backspace 时光标移动的格数等于该数值，但实际插入的字符仍受 tabstop 和 expandtab 控制）；
set shiftwidth=4                            " 缩进的空格数
set shiftround
autocmd FileType c,java,cpp set ai et ts=4 sw=4 sts=4
autocmd FileType shell,bash,vim set ai et ts=4 sw=4 sts=4
autocmd FileType js,javascript,html,css,xml,vue set ai et ts=4 sw=4 sts=4
autocmd FileType python,py,go set ai et ts=4 sw=4 sts=4

set number                                  " 在当前行显示当前行数
"set relativenumber                          " 设置相对显示number instead of 'set nu'
set norelativenumber
set cursorline
set cursorcolumn                            " 突出显示当前列

set textwidth=120                           " 内容宽度
set wrap
"set nowrap                                      " 取消自动折行––超出屏幕范围的文本将不会被显示，你需要向句末移动光标，以使屏幕水平滚动，查看一行的完整内容。
set linebreak                               " 遇到指定的符号才折行，单词内不折行"
"set breakat-=_
"set nolinebreak                                " 取消自定义折行
set whichwrap=b,s,h,l,<,>,[,]               " 行尾可右移到下行，行首左移到上行,b：退格，s：空格，hl：左右，<>：n/v模式下的左右，[]：i/r模式下的左右
set wrapmargin=1
set nofoldenable                            " 代码折叠
" set nojoinspaces                          " 用J合并两行用一个空格隔开
set linespace=0                             " 行之间没有多余的空格

set sidescroll=1                            " 可以实现更加平滑的逐个字符扩展显示
set sidescrolloff=15
set scrolljump=5                            " 光标离开屏幕范围
set scrolloff=8

" -----------------------------------------
" For searching
" -----------------------------------------
set ignorecase                              " 无视大小写
set smartcase                               " Case insensitive searches become sensitive with capitals
set incsearch                               " 搜索时自动匹配
set hlsearch                                " 高亮搜索项
set iskeyword-=.                            " 让'.' 作为单词分割符
set iskeyword-=#                            " 让'#' 作为单词分割符
set iskeyword-=-                            " 让'-' 作为单词分割符

set mouse=a                                 " 启动鼠标所有模式，但是右键功能不可用, 可以保证鼠标滚屏在当前屏幕内
set mousehide                               " 输入文件时隐藏鼠标
set selection=exclusive
set selectmode=mouse                        " mouse,key

" [n|c|v|i][nore]map"
" [n|c|v|i]unmap"
" [n|c|v|i]mapclear"

" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash 
set virtualedit=onemore                     " 光标可以移到当行最后一个字符之后
set hidden                                  " 切换文件不保存，隐藏
" set confirm                               " 退出前验证
" set spell                                 " 拼写检查

set nobackup
set nowritebackup                           " 不写入备份文件
""set backupdir=~/.vim/.backup//
set noswapfile
""set directory=~/.vim/.swap//
""set updatecount=100
""set updatetime=10000                      " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set undofile
set undolevels=1000                         " use many muchos levels of undo
set undodir=~/.vim/.undo//                  " 需要mkdir这个目录

set autochdir
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
set autoread
set autowrite                               " Automatically save before commands like :next and :make

set report=0                                " 如果删除或修改的行数超过了指定的值会报告，0：永远报告"
set backspace=2                             " 解决插入模式下delete/backspce键失效问题
set backspace=indent,eol,start              " 缩进位置”，“行结束符”，“段首”。这样设置可以使得 backspace 键在这三个特殊的位置也能进行回删动作。
set list                                    " 开启对于制表符（tab）、行尾空格符（trail）、行结束符（eol）等等特殊符号的回显
set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:.,eol:$  " 空格等无效字符显示

set complete=                               " 自动补全默认将在以下来源中查找关键字：
" set complete=.,w,b,u,t,i
" 在当前缓冲区中进行查找；
" 在其他窗口中进行查找；
" 在其他已载入的缓冲区中进行查找；
" 在没有载入缓冲区的文件中进行查找；
" 在当前的标签（tags）列表进行查找；
" 在由当前文件（如#include）包含进来的头文件中进行查找。

set wildmenu                                " 命令模式自动补全时的文件菜单
set wildmode=list:longest,full              " 命令模式自动补全时，匹配最长子串，列出文件
set history=1000                            " remember more commands and search history

set ttimeout                                " 完整的按键码的超时时间
set ttimeoutlen=800                         " 按下esc键后800ms就生效"

map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>   " fc查找冲突的地方uuuu
nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR> " ff 查找光标后的单词位置，列出选择项
nmap <leader>v :so $MYVIMRC<CR>


" 1 terminal
set title                                   " change the terminal's title

" 2 tab
map <leader>et :tabe %%

" 3 window
set splitright                              " 用vsplit新建窗口，让新的放右边
set splitbelow                              " 用split新建窗口，让新的放下面
nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%



" 4 buffer
" 映射切换buffer的键位"
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer"
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" 5 file

" 6 edit
" 恢复光标最后编辑位置
au BufWinLeave *.py,*.go,*.h,*.c,*.hpp,*.cpp,*.css,*.html,*.js,*.ts,*php,*.md mkview
au BufWinEnter *.py,*.go,*.h,*.c,*.hpp,*.cpp,*.css,*.html,*.js,*.ts,*php,*.md silent loadview



" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" 屏幕左移和右移
map zl zL
map zh zH

filetype off 
filetype plugin indent off


call plug#begin('~/.vim/plugged')                           " 在这里面输入安装的插件

Plug 'junegunn/vim-plug'                                    " for :hlep vim-plug

" About assistance
Plug 'preservim/nerdtree'
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
Plug 'Yggdroot/indentLine'                                  " 缩进层次性感线条
Plug 'junegunn/vim-easy-align'

Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'                                 " 自动匹配成对字符如括号等


" About efficiency
Plug 'w0rp/ale'                                             " 代码静态检查，代码格式修正, 见配置并需要安装各语言依赖, 如flake8
" Plug 'dense-analysis/ale'                                 " 代码静态检查，代码格式修正, 见配置并需要安装各语言依赖, 如flake8
"Plug 'octol/vim-cpp-enhanced-highlight'
"
Plug 'scrooloose/syntastic'
Plug 'ludovicchabant/vim-gutentags'
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

call plug#end()

syntax enable
filetype plugin indent on
filetype on

" -----------------------------
" 文件树设置
" -----------------------------
" autocmd vimenter * NERDTree  "自动开启Nerdtree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

nnoremap <F3> :NERDTreeToggle<CR>                           " 开启/关闭nerdtree快捷键"
nmap <leader>t :NERDTreeToggle<CR>                          " 关闭NERDTree快捷键
nmap <leader>nt :NERDTreeFind<CR>


let NERDTreeAutoCenter=1
" let NERDTreeShowLineNumbers=1                             " 显示行号
let NERDTreeShowHidden=1                                    " 是否显示隐藏文件
" let NERDTreeShowBookmarks=1                                 " 开启Nerdtree时自动显示Bookmarks
let NERDTreeWinSize=25                                      " 设置宽度
let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=1
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']    " 忽略一下文件的显示
let g:nerdtree_tabs_open_on_console_startup=1               " 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_gui_startup=0
"修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
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

" Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" --------------------------
" syntastic 配置
" --------------------------
function! ToggleErrors()          " 设置每次w保存后语法检查
    Errors
endfunction
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
autocmd WinEnter * if &buftype ==#'quickfix' && winnr('$') == 1 | quit |endif
autocmd WinLeave * lclose

" ---------------------
" indentLine
" ---------------------
let g:indent_guides_size = 1
let g:indent_guides_level = 2


" airline设置"
let laststatus = 2                                   " 总是显示状态栏
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



" 设置字体 "
"set guifont=Powerline_Consolas:h14:cANSI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags
set tags=./.tags;,.tags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['pom.xml','.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags') " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
if !isdirectory(s:vim_tags)              " 检测 ~/.cache/tags 不存在就新建
	silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" ------------------------------------------------
" For ale
" 使用 flake8 做python3的代码检查，pylint检查太严格
" 使用 autopep8, yapf等做代码修正，快捷键定义为 ,pe
" normal下sp, sn跳转到上一个，下一个错误，lc关闭或者打开错误列表
" more see :help ale
" ------------------------------------------------ 
let g:ale_linters_explicit = 1                        "除g:ale_linters指定，其他不可用

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0

let g:ale_c_gcc_options = '-Wall -O2 -std=c11'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_set_hightlights = 1
let g:ale_change_sign_column_color = 0
let g:ale_sign_error = "EE"
let g:ale_sign_column_always = 0 

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta


let g:ale_linters = {
\   'cpp': ['cppcheck','clang','gcc'],
\   'c': ['cppcheck','clang', 'gcc'],
\   'python': ['flake8'],
\   'rust': [ 'cargo', 'rls', 'rustc' ],
\   'bash': ['shellcheck'],
\   'go': ['golint'],
\   'javascript': ['eslint'],
\}
let g:ale_linters_ignore = {'python': ['pylint']}
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_fixers = {
\   'python': ['autopep8', 'black', 'isort'],
\   'rust': ['rustfmt'],
\   'javascript': ['eslint'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_set_quickfix = 1
let g:ale_open_list = 1 "打开quitfix对话框 
 

nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
nnoremap <leader>at :ALEToggle<CR>
nnoremap <leader>af :ALEFix<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp 和 Ctrlp-funky(,fu)
if isdirectory(expand("~/.vim/plugged/ctrlp.vim/"))
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
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
" For Signify see :help Signify
" ------------------------------------------------
let g:signify_disable_by_default=1
nnoremap <leader>se :SignifyEnable<CR>
nnoremap <leader>st :SignifyToggle<CR>
nnoremap <leader>sd :SignifyDiff<CR>

" ------------------------------------------------
" For startify
" ------------------------------------------------
let g:startify_change_to_dir = 0

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
nmap <leader>tl <Plug>TaskList


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


