

"filetype off
"filetype plugin indent off
call plug#begin('~/.vim/plugged')                           " 在这里面输入安装的插件

" 支持库，给其他插件用的函数库
Plug 'xolox/vim-misc'

Plug 'mhinz/vim-startify'                                   " cowsay and 数字键打开历史文件
" style
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

" effictiv
" 1 file browsing
Plug 'preservim/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
""Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" 2 txt editing
Plug 'farmergreg/vim-lastplace'                             " 重新打开文件时定位到上次关闭时的位置
Plug 'mhinz/vim-signify'                                    " Just for git, <leader>se <leader>sd <leader>st
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'                                 " 自动匹配成对字符如括号等
Plug 'tpope/vim-commentary'                                 " gcc 注释单行，gc 注释选中的行
" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'Yggdroot/indentLine'

Plug 'SirVer/ultisnips'                                     " 代码片段 配合vim-snippets and coc-nvim
Plug 'honza/vim-snippets'                                   " ctrl+j, ctrl+k, 输入代码片段的关键字后, 使用这两个快捷键前进后退

" 3 diff comparing
" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'

" 4 code completing
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dgryski/vim-godef'
Plug 'buoto/gotests-vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } "写python语言的各种操作, 见配置a
Plug 'yssource/python.vim'                                  " python 推荐：****
" vim org-mode
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}                      " for html coding


" 6 error tip
Plug 'dense-analysis/ale'                                             " 代码静态检查，代码格式修正, 见配置并需要安装各语言依赖, 如flake8
" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
Plug 'mh21/errormarker.vim'
" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
Plug 'skywind3000/vim-preview'
" lua 语法高亮增强
Plug 'tbastos/vim-lua', { 'for': 'lua' }
" C++ 语法高亮增强，支持 11/14/17 标准
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
" 额外语法文件
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
" python 语法文件增强
Plug 'vim-python/python-syntax', { 'for': ['python'] }

" 5 symbol preview
Plug 'majutsushi/tagbar'                                    " 代码函数变量预览
" 提供 ctags/gtags 后台数据库自动更新功能
Plug 'ludovicchabant/vim-gutentags'
" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
Plug 'skywind3000/gutentags_plus'

" 7 cursor word focus
Plug 'itchyny/vim-cursorword'                               " 给光标下的单词增加下滑线

Plug 'romainl/vim-cool'                                     " 当移动后取消所有search的高亮文本
Plug 'vim-scripts/TaskList.vim'                             " <leader>td 中转到TODO, XXX等关键词所在的行

" About efficiency
""Plug 'vim-syntastic/syntastic'

call plug#end()

"syntax enable
"syntax on
"filetype on
"filetype plugin indent on


" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

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
