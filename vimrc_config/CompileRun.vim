"  < 单文件编译、连接、运行配置 >
map <F5> :call CompileRun()<CR><CR>
func! CompileRun()
	exec "w"
    if (&filetype == 'c'||&filetype == 'cpp')
       	execute "call Do_OneFileMake()"
    elseif &filetype == 'python'
		execute "!python %"
    elseif &filetype == 'java' 
        execute "!javac %" 
        execute "!java %<"
	elseif &filetype == 'sh'
        :!%
    endif
endfunc


"map <F5> :call Do_OneFileMake()<CR>
function! Do_OneFileMake()
	if(has("win32") || has("win95") || has("win64") || has("win16"))
		let g:iswindows=1
	else
		let g:iswindows=0
	endif
	exe ":ccl"
	exe ":set fenc=utf-8"
	exe ":update"
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        if g:iswindows==1
            set makeprg=gcc\ -fexec-charset=GBK\ -o\ %<.exe\ %
							"-finput-charset=UTF-8\
        else
            set makeprg=gcc\ -o\ %<\ %
        endif
    elseif &filetype=="cpp"
        if g:iswindows==1
            set makeprg=g++\ -fexec-charset=GBK\ -o\ %<.exe\ %
							"-finput-charset=UTF-8\
        else
            set makeprg=g++\ -o\ %<\ %
        endif
    elseif &filetype=="cs"
        set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
    endif
    if(g:iswindows==1)
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'.exe','g')
        let toexename=outfilename
    else
        let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
        let toexename=outfilename
    endif
    if filereadable(outfilename)
        if(g:iswindows==1)
            let outdeletedsuccess=delete(getcwd()."\\".outfilename)
        else
            let outdeletedsuccess=delete("./".outfilename)
        endif
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    execute "normal :"
    if filereadable(outfilename)
        if(g:iswindows==1)
            execute "!".toexename
        else
            execute "!./".toexename
        endif
		else
			execute "copen"
    endif
    "execute "copen"
endfunction

"C,C++调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb %<"
endfunc

"进行make的设置
map <F6> :call Do_make()<CR>
map <c-F6> :silent make clean<CR>
function! Do_make()
    set makeprg=make
    execute "silent make"
    execute "copen"
endfunction

function! CheckPythonSyntax() 
    let mp = &makeprg 
    let ef = &errorformat 
    let exeFile = expand("%:t") 
    setlocal makeprg=python\ -u 
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
    silent make % 
    copen 
    let &makeprg     = mp 
    let &errorformat = ef 
endfunction
