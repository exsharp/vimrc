"更多插件见： http://vim-scripts.org/vim/scripts.html
filetype on
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')
"插件管理核心库
Bundle 'gmarik/vundle'
"激活插件与文件类型的依赖关系
filetype plugin indent on     " required!
"################################插件汇总#############################################
Bundle 'a.vim'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'The-NERD-tree'
Bundle 'winmanager'
Bundle 'cSyntaxAfter'
Bundle 'Mark--Karkat'
Bundle 'tpope/vim-surround'
Bundle 'repeat.vim'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'drmingdrmer/xptemplate'

"C语系插件
"Bundle 'code_complete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'DoxygenToolkit.vim'
Bundle 'OmniCppComplete'   
"Bundle 'Valloric/YouCompleteMe'

"Python补全
Bundle 'rkulla/pydiction'

"########插件设置##############################################

"Bundle 'a.vim'{
" 用于切换C/C++头文件
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
"}

"Bundle 'Lokaltog/vim-powerline'{
"状态栏插件，更好的状态栏效果  
"set guifont=PowerlineSymbols\ for\ Powerline
"set t_Co=256
"let g:Powerline_symbols = 'fancy'
"}

"Bundle 'fholgado/minibufexpl.vim'{        
"好像与 Vundle 插件有一些冲突
"快速浏览和操作Buffer
"主要用于同时打开多个文件并相与切换
" let g:miniBufExplMapWindowNavArrows = 1     "用Ctrl加方向键切换到上下左右的窗口中去
" let g:miniBufExplMapWindowNavVim = 1        "用<C-k,j,h,l>切换到上下左右的窗口中去
" let g:miniBufExplMapCTabSwitchBufs = 1      "功能增强（不过好像只有在Windows中才有用）
" <C-Tab> 向前循环切换到每个buffer上,并在但前窗口打开
" <C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开
" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
"}

"Bundle 'taglist.vim'{
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等
" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
nmap tl :TagbarClose<CR>:Tlist<CR>
let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=30                       "设置窗口宽度
let Tlist_Use_Right_Window=1                "在右侧窗口中显示
"}

"Bundle 'majutsushi/tagbar'{
" 相对 TagList 能更好的支持面向对象
" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nmap tb :TlistClose<CR>:TagbarToggle<CR>
let g:tagbar_width=30                       "设置窗口宽度
"let g:tagbar_left=1                         "在左侧窗口中显示
"}

"Bundle 'The-NERD-tree'{
"文件管理器
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
"A-t : 打开NERDTree
"map <silent> <C-t>   <ESC>:NERDTree<CR>
nmap nt :NERDTree<CR>
" 以打开NERDTree时的目录为工作目录
let NERDTreeChDirMode=1
"}

"Bundle 'winmanager'{
let g:NERDTree_title='NERD Tree'
let g:winManagerWindowLayout='NERDTree|TagList'
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
"nmap <F4> :WMToggle<cr> :q<cr>
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR> 
"}

"Bundle 'cSyntaxAfter'{
" 高亮括号与运算符等
au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
'}

"Bundle 'Mark--Karkat'{
" 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt
" }

"Bundle 'tpope/vim-surround'{
" 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt
"}

"Bundle 'repeat.vim'{
" 主要用"."命令来重复上次插件使用的命
"}

"Bundle 'scrooloose/syntastic'{
" 用于保存文件时查检语法
"}

"Bundle 'SuperTab'{
"只要在输入变量名或路径名等符号中途按Tab键，就能得到以前输入过的符号列表，并通过Tab键循环选择
let g:SuperTabDefaultCompletionType="context"
"}

"Bundle 'Shougo/neocomplcache.vim'{
" 关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。
let g:neocomplcache_enable_quick_match = 1
let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件
let g:neocomplcache_disable_auto_complete = 0 "不自动弹出补全列表
let g:neocomplcache_enable_auto_select = 0  "AutoComplPop like behavior.
"用SPACE自动选择当前的候选字，并附加一个空格
"inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() ."\<SPACE>" :"\<SPACE>"
"Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"}

"Bundle 'Shougo/neocomplete.vim'
"{
let g:neocomplete#enable_at_startup = 1    "vim启动时启用插件
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
"}

"Bundle 'drmingdrmer/xptemplate'
"{代码片段补全
" avoid key conflict
let g:SuperTabMappingForward = '<tab>'
" if nothing matched in xpt, try supertab
let g:xptemplate_fallback = '0'
" xpt uses <Tab> as trigger key
let g:xptemplate_key = '<c-Tab>'
" use <tab>/<S-tab> to navigate through pum. Optional
let g:xptemplate_pum_tab_nav = 1
" xpt triggers only when you typed whole name of a snippet. Optional
" let g:xptemplate_minimal_prefix = 'full'
"inoremap <expr><c-tab> pumvisible()?"\<C-E>\<C-Tab>":"\<c-tab>"
"}

"Bundle 'rkulla/pydiction'{
let g:pydiction_location = '$VIM/vimfiles/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20
"}

"Bundle 'mbbill/code_complete'{
"补全函数参数，插入代码片段
"}

"Bundle 'scrooloose/nerdcommenter'{
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
let NERDSpaceDelims = 1                     "在左注释符之后，右注释符之前留有空格
"}

"Bundle 'DoxygenToolkit.vim'{
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="zfliu"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
"}

"Bundle 'OmniCppComplete'{   
"实现C/C++语言自动补全,主要是指针
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem =  0
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest  "preview
"}

"YouCompleteMe{
let g:ycm_global_ycm_extra_conf = 'D:/Vim/vimfiles/bundle/YouCompleteMe/python/.ycm_extra_conf.py'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全            
let g:ycm_seed_identifiers_with_syntax=1
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
"}

"#######Ctags设置#######
"Ctags{
set tags=tags; 
set autochdir
nmap <F3> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>:TlistUpdate<CR><CR> 
imap <F3> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>:TlistUpdate<CR><CR>
set tags+=$VIM/tags/Mingw_tags
set tags+=$VIM/tags/VS_tags
set tags+=$VIM/tags/STL_tags
set tags+=$VIM/vimrc_config/tags
"set tags+=./tags " add current directory's generated tags file当前目录
"}

