"=============================================
"    Name: localbundle.vim
"    File: localbundle.vim
" Summary: move bundle into localbundle.
"  Author: Rykka G.F
"  Update: 2012-12-19
"=============================================
let s:cpo_save = &cpo
set cpo-=C

com! LocalBundle call localbundle#install()

fun! localbundle#init() "{{{
    if !exists('g:localbundle_dir')
        let g:localbundle_dir = expand('$HOME/.vim/localbundle')
    else
        let g:localbundle_dir = expand(g:localbundle_dir)
    endif
    if filereadable(g:localbundle_dir."/autoload/vundle.vim")
        set rtp&
        exe 'set rtp^='.fnameescape(g:localbundle_dir)
        exe 'set rtp+='.fnameescape(g:localbundle_dir.'/after')
    endif
endfun "}}}

fun! localbundle#install() abort "{{{
    let g:localbundle_log = ""
    call s:log("Setup Runtime Path:")
    call localbundle#init()

    let local_dir = g:localbundle_dir

    if !exists("g:bundle_dir")
        let g:bundle_dir = expand('$HOME/.vim/bundle') 
    endif
    let bundle_dir = g:bundle_dir

    call s:log("\nRemove dir of localbundle:")
    if has('win32') || has('win64')
        let cmd = "rd /S /Q ".local_dir
    else
        let cmd = "rm -rf ".local_dir
    endif
    call s:log('> ' . s:system(cmd))

    call mkdir(g:localbundle_dir, "p")

    call s:log("\nCopy to localbundle dir: ")
    if has('win32') || has('win64')
        let dirs = split(glob(g:bundle_dir.'/*/'),'\n')
        for dir in dirs
            let cmd =   'xcopy /E /Y /C /I '.shellescape(dir."*").' '.local_dir
            call s:log('> ' . s:system(cmd))
        endfor
    else
        let opts = "-rn "
        if !has("mac")
            let opts .= " -l "
        endif
        let cmd = "cp ".opts.bundle_dir."/*/* ".local_dir
        let out = s:system(cmd)
        call s:log('> '.out)
    endif
    
    call s:log("Generating HelpTags:")
    call s:exec('helptags '.local_dir.'/doc')

    call s:log("Done. You can review the log by 'g:localbundle_log'")

endfun "}}}

fun! s:log(msg) "{{{
    if exists("*strftime")
        let time = strftime("%H:%M:%S ")
    else
        let time = ''
    endif
    let g:localbundle_log .= time . a:msg . "\n"
    echo a:msg
endfun "}}}
fun! s:exec(cmd) abort "{{{
    call s:log(a:cmd)
    sil exe a:cmd
endfun "}}}
fun! s:system(cmd) abort "{{{
    call s:log("$:".a:cmd)
    return system(a:cmd)
endfun "}}}
let &cpo = s:cpo_save
unlet s:cpo_save
