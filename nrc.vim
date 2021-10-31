if has('multi_byte')
	" 内部工作编码
	set encoding=utf-8
	" 文件默认编码
	set fileencoding=utf-8
	" 打开文件时自动尝试下面顺序的编码
	set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

" basic
set nocompatible
set encoding=utf-8
set history=1000 "Vim 需要记住多少次历史操作。
set noerrorbells "出错时，不要发出响声。
set visualbell "出错时，发出视觉提示，通常是屏幕闪烁。

set lazyredraw                              " 延迟绘制（提升性能）
set winaltkeys=no                           " Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）

set formatoptions+=m                        " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B                        " 合并两行中文时，不在中间加空格
set ffs=unix,dos,mac                        " 文件换行符，默认使用 unix 换行符

" indent
"filetype plugin indent on         "Vim 就是会找 Python 的缩进规则~/.vim/indent/python.vim
set autoindent             "按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。
set expandtab              "由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格。
set softtabstop=4          "Tab 转为多少个空格。
set tabstop=4              "按下 Tab 键时，Vim 显示的空格数。
set shiftwidth=4           "在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数。



" effective
set autochdir "自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
set autoread "打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。

set scrolloff=5 "垂直滚动时，光标距离顶部/底部的位置（单位：行）。
set sidescrolloff=15 "水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用。

set wildmenu
set wildmode=longest:list,full "命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。

set showmatch                               " 显示匹配的括号
set matchtime=2                             " 显示括号匹配的时间

" layout
set title
set showtabline=2                           " 总是显示标签栏

set laststatus=2 "是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
" 这里就不设置了，airline 插件会覆盖
" set statusline=                                 " 清空状态了
" set statusline+=\ %F                            " 文件名
" set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
" set statusline+=%=                              " 向右对齐
" set statusline+=\ %y                            " 文件类型
" 
" " 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
" set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)

set ruler "在状态栏显示光标的当前位置（位于哪一行哪一列）。
set showmode

set showcmd
set cmdheight=2                             " 命令行（在状态行下）的高度，默认为1，这里是2

set display=lastline                        " 显示最后一行

set signcolumn=yes                          " 总是显示侧边栏（用于显示 mark/gitdiff/诊断信息）

set splitright   " 水平切割窗口时，默认在右边显示新窗口

" plugins
call plug#begin('~/.vim/plugged')                           " 在这里面输入安装的插件
Plug 'mhinz/vim-startify'                                   " cowsay and 数字键打开历史文件

Plug 'vim-scripts/khaki.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mavnn/mintty-colors-solarized'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'crusoexia/vim-dracula'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
""Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'                                 " 自动匹配成对字符如括号等
"Plug 'tpope/vim-commentary'                                 " gcc 注释单行，gc 注释选中的行
"Plug 'godlygeek/tabular', { 'on': 'Tabularize' }            " 表格对齐，使用命令 Tabularize
"Plug 'Yggdroot/indentLine'
Plug 'farmergreg/vim-lastplace'                             " 重新打开文件时定位到上次关闭时的位置

Plug 'chrisbra/vim-diff-enhanced'                           " Diff 增强，支持 histogram / patience 等更科学的 diff 算法

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips'                                     " 代码片段 配合vim-snippets and coc-nvim
Plug 'honza/vim-snippets'                                   " ctrl+j, ctrl+k, 输入代码片段的关键字后, 使用这两个快捷键前进后退

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } "写python语言的各种操作, 见配置a
"Plug 'yssource/python.vim'                                  " python 推荐：****
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}                      " for html coding

" 6 error tip
Plug 'dense-analysis/ale'                                             " 代码静态检查，代码格式修正, 见配置并需要安装各语言依赖, 如flake8
Plug 'mh21/errormarker.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }      " C++ 语法高亮增强，支持 11/14/17 标准

Plug 'majutsushi/tagbar'                                    " 代码函数变量预览
Plug 'skywind3000/vim-preview'                              " 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
Plug 'ludovicchabant/vim-gutentags'                         " 提供 ctags/gtags 后台数据库自动更新功能
" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
Plug 'skywind3000/gutentags_plus'

Plug 'itchyny/vim-cursorword'                               " 给光标下的单词增加下滑线
Plug 'romainl/vim-cool'                                     " 当移动后取消所有search的高亮文本
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc

" ------------------------------------------------
" For startify
" ------------------------------------------------
let g:startify_disable_at_vimenter = 0                  " 默认不显示 startify
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

" ------------------------------------------------
" For Ctrlp And funky
" ------------------------------------------------
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
" \ ['black',       'SeaGreen3'],           " 不加入这行, 防止黑色括号出现, 很难识别
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ------------------------------------------------
" For AutoPairs
" ------------------------------------------------
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
" For airline
" ------------------------------------------------
let g:airline_theme='papercolor'                     " 设置主题
let g:airline_powerline_fonts = 0                    " 使用powerline打过补丁的字体
let g:airline#extensions#tabline#enabled = 1         " 开启tabline
let g:airline#extensions#tabline#left_sep = '*'      " tabline中当前buffer两端的分隔字符
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
let g:airline_skip_empty_sections = 0

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

let g:airline_symbols.linenr = " CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'ML' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "Dty"
let g:airline_symbols.crypt = "Crp"

" ------------------------------------------------
" For vim-cool
" ------------------------------------------------
let g:CoolTotalMatches = 1

" ------------------------------------------------
" For ultisnips and coc-ultisnips and vim-snippets
" 使用Ctrl+j, Ctrl+k 作为snippets时的跳转键 more see :help ultisnips and :help vim-snippets
" ------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]

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

" ------------------------------------------------
" For ale
" normal下sp, sn跳转到上一个，下一个错误，lc关闭或者打开错误列表
" ------------------------------------------------
" 设定检测的时机：normal 模式文字改变，或者离开 insert模式
" 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
let g:ale_lint_on_save =0                 "default this is 1,if u only wish lint on save  turn off following
let g:ale_lint_on_enter = 0               " if you don't want linters to run on opening a file
let g:ale_lint_on_text_changed = 'normal' " Write this in your vimrc file            another option:   never
let g:ale_lint_on_insert_leave = 1

let g:ale_linters_explicit = 1                        "除g:ale_linters指定，其他不可用
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500

"let g:ale_sign_column_always = 0
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1 "1/0
"let g:ale_set_highlights = 0
let g:ale_set_highlights = 1

"自定义error和warning图标
"let g:ale_sign_error = "EE"
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%]  %code% : %s'

" Write this in your vimrc file
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 1 "打开quitfix对话框
" Set this if you want to.
" This can be useful if you are combining ALE with some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0
"let g:ale_list_vertical = 1

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp  <Plug>(ale_previous_wrap)
nmap sn  <Plug>(ale_next_wrap)
nmap <Leader>at :ALEToggle<CR>        "<Leader>s触发/关闭语法检查
nmap <Leader>ad :ALEDetail<CR>         "<Leader>d查看错误或警告的详细信息

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
            \   'python': ['pylint', 'flake8'],
            \   'reStructuredText':['rstcheck'],
            \   'bash': ['shellcheck'],
            \   'go': ['golint','go build', 'gofmt'],
            \   'java': ['javac'],
            \   'javascript': ['eslint'],
            \}
""            \   'rust': [ 'cargo', 'rls', 'rustc' ],
""let g:ale_linters_ignore = {'python': ['pylint']}
""let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_fixers = {
            \   'python': [ 'autopep8' ],
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
let g:ale_python_pylint_options = '--rcfile='.s:lintcfg('pylint.conf')
let g:ale_python_pylint_options .= ' --disable=W'
""let g:ale_python_flake8_options = '--conf='.s:lintcfg('flake8.conf')

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

" ------------------------------------------------
" For errormarker
" ------------------------------------------------
" 使用 <space>ha 清除 errormarker 标注的错误
noremap <silent><space>ha :RemoveErrorMarkers<cr>

" ------------------------------------------------
" For tags and more
" ------------------------------------------------

let s:vim_tags = expand('~/.cache/tags') " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
if !isdirectory(s:vim_tags)              " 检测 ~/.cache/tags 不存在就新建
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_tagfile = '.tags' " 所生成的数据文件的名称
set tags=./.tags;,.tags " 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件 或者 Vim 当前目录包含 .tags 文件

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['pom.xml','.root', '.svn', '.git', '.hg', '.project']

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 使用 universal-ctags 的话需要下面这行，请反注释
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']


let g:gutentags_modules = []            " 默认禁用自动生成
if executable('ctags')                 " 如果有 ctags 可执行就允许动态生成 ctags 文件
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags') && executable('gtags-cscope') " 如果有 gtags 可执行就允许动态生成 gtags 数据库
	let g:gutentags_modules += ['gtags_cscope']
endif
let g:gutentags_auto_add_gtags_cscope = 0 " 禁止 gutentags 自动链接 gtags 数据库

" ------------------------------------------------
" For tagbar taglist的替代品，比taglist更适合c++使用，函数能够按类区分，支持按类折叠显示等，显示结果清晰简洁
" 使用 ,tt 打开或者关闭代码函数关键字等预览 
" ------------------------------------------------
nnoremap <leader>tt :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"let g:tagbar_type_cpp = {}
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

" ------------------------------------------------
" For vim-cool
" ------------------------------------------------
let g:CoolTotalMatches = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" style
set t_Co=256
set t_ut=                                   " 防止vim背景颜色错误

set number                 " line number
set norelativenumber       "其他行相对当前

set cursorline             "当前行高亮
set cursorcolumn                            " 突出显示当前列


set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m    " 错误格式

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

" 之前的高亮线太难看，重新制定颜色，这里的black和iterm2颜色配置中的black一样
hi CursorLine     cterm=NONE ctermbg=black guibg=black
hi CursorColumn   cterm=NONE ctermbg=black guibg=black

"去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE 
" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" 修正补全目录的色彩：默认太难看
hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray


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
"set background=dark                         " 设置黑色背景

"color desert256                             " 设置颜色主题，会在所有 runtimepaths 的 colors 目录寻找同名配置
colorscheme PaperColor
highlight Normal ctermbg=None
highlight clear SignColumn


" syntax
if has('syntax')
	syntax enable
	syntax on
endif


" txt show format
set textwidth=80           "设置行宽，即一行显示多少个字符
set wrap                   "自动折行，即太长的行分成几行显示。
set linebreak              "只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行。
set wrapmargin=2           "指定折行处与编辑窗口的右边缘之间空出的字符数。
set list                   "如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:.,eol:$  " 空格等无效字符显示.set listchars=tab:»■,trail:■

" search
set showmatch "光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。
set hlsearch "搜索时，高亮显示匹配结果。
set incsearch " 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
set ignorecase "搜索时忽略大小写。
set smartcase "如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。


" editing
set nospell spelllang=en_us "打开英语单词的拼写检查。
set nobackup "不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）。
set noswapfile "不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp。
set undofile "保留撤销历史。保留撤销历史。
" set backupdir=~/.vim/.backup//  "结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。
" set directory=~/.vim/.swp//     "结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。
" set undodir=~/.vim/.undo//      "结尾的//表示生成的文件名带有绝对路径，路径中用%替换目录分隔符，这样可以防止文件重名。

" set backup                       " 允许备份
" set writebackup                  " 保存时备份
" set backupdir=~/.vim/tmp         " 备份文件地址，统一管理
" set backupext=.bak               " 备份文件扩展名
" set noswapfile                   " 禁用交换文件
" set noundofile                   " 禁用 undo文件




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
" keymap
