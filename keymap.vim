
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


"  模板"
"  shortcut
nnoremap fmt gg<S-v><S-g>=
nnoremap cc  I// <ESC> 
nnoremap xc  :.s/\/\/ //<CR>
nnoremap <A-k> dd 
" motion in line 
"   h/l char; 
"   w beingOfNextWord;W beginOfNextContinueChars
"   e endOfNextWord;  E endOfNextContinueChars"
"   b beginOfPreWord; B beginOfPreContinueChars
"   ^ beginOfCurLine; $ endOfCurLine
