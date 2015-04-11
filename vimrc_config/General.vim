"弹出菜单用tab补全
inoremap <expr><Esc> pumvisible()?"\<C-E>":"\<Esc>" 

"符号补全
inoremap () ()<Esc>i
inoremap {} {}<Left><Enter><Esc>O
inoremap <> <><Esc>i
inoremap "" ""<Esc>i
inoremap '' ''<Esc>i
inoremap [] []<Esc>i

"消除警告声
set vb t_vb=

"禁用vi模式
set nocompatible

"设置语法高亮
syntax enable
syntax on

"设置文件格式
set fileformats=dos,unix

"自动切换目录为当前编辑文件所在目录
au BufRead,BufNewFile,BufEnter * cd %:p:h

"Gvim配色方案
colorscheme molokai 
     
"设置 gVim 窗口初始位置及大小
"窗口启动时自动最大化
"au GUIEnter * simalt ~x
"指定窗口出现的位置，坐标原点在屏幕左上角
winpos 150 30
"winpos 100 10
"指定窗口大小，lines为高度，columns为宽度
set lines=30 columns=100
"set lines=38 columns=120

"启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

"去掉欢迎界面
set shortmess=atI                                                

"隐藏工具栏和菜单栏
set guioptions-=m   "菜单栏
set guioptions-=T   "工具栏
set guioptions+=r   "右侧滚动条
set guioptions-=L   "底部滚动条
map <silent> <c-F11> :
\if &guioptions =~# 'm' <Bar>
    \set guioptions-=m <Bar>
    \set guioptions-=T <Bar>
    \set guioptions+=r <Bar>
    \set guioptions-=L <Bar>
\else <Bar>
    \set guioptions+=m <Bar>
    \set guioptions+=T <Bar>
    \set guioptions+=r <Bar>
    \set guioptions+=L <Bar>
\endif<CR>

"设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir

"编码设置
"set enc=utf-8
let &termencoding=&encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set guifont=Consolas:h11
"set gfw=YaHei\ Consolas\ Hybrid:h11

"消除乱码
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"禁止生成临时文件
set nobackup

"搜索忽略大小写
set ignorecase 

"搜索逐字符高亮
set incsearch

"搜素时高亮显示被找到的文本
set hlsearch

"设置不自动折行
"set nowrap
set wrap

" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
set smarttab
set history=1024

"行内替换
set gdefault  

"始终显示行号 
set number    

"显示光标的坐标
set ruler

"高亮整行
set cursorline

"自动缩进
set noautoindent
set cindent
set smartindent

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"在任何模式下启用鼠标
set mouse=a    
                
"启用折叠
set nofoldenable 
"indent 折叠方式                                  
set foldmethod=indent
"启动vim时不要自动折叠代码
set foldlevel=100 
"用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


"启用状态栏信息
set laststatus=2   

"设置命令行的高度为2，默认为1                                
set cmdheight=2        
                              
"输入法设置
if has('multi_byte_ime')
	"未开启IME时光标背景色
	hi Cursor guifg=bg guibg=Yellow gui=NONE
	"开启IME时光标背景色
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	" 关闭Vim的自动切换IME输入法(插入模式和检索模式)
	set iminsert=0 imsearch=0
	" 插入模式输入法状态未被记录时，默认关闭IME
	"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"与Windows共享剪贴板
set clipboard+=unnamed

"保存文件前建立备份，保存成功后删除该备份
set writebackup     
                        
"编辑vimrc之后，重新加载
autocmd! bufwritepost _vimrc source $VIM/_vimrc

" 当文件在外部被修改，自动更新该文件
set autoread

"搜索模式里忽略大小写
set ignorecase  

" 编辑模式进行光标移动
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk


"自动语法检查
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"mm : 规范行首空格<cr>去除多余字符<cr>删除空白行<cr>规范行数
nmap mm :%s/\r//g<cr>

"ff : 前后补全
"vmap ff <Esc>`>i')?><Esc>`<i<?=$this->_('<Esc>
vmap ff "zdi<?=$this->_('<C-R>z');?><ESC>

"php缩进
"let PHP_autoformatcomment=1

"不同文件类型的缩进
"au FileType html,python,vim,javascript setl shiftwidth=2
"au FileType html,python,vim,javascript setl tabstop=2
"au FileType java,php setl shiftwidth=4
"au FileType java,php setl tabstop=4
