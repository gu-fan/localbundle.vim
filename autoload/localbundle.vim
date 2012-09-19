"=============================================
"    Name: localbundle.vim
"    File: localbundle.vim
" Summary: move bundle into localbundle.
"  Author: Rykka G.F
"  Update: 2012-09-19
"=============================================
let s:cpo_save = &cpo
set cpo-=C

com! LocalBundle call localbundle#install()

fun! localbundle#init() "{{{
    if !exists('g:localbundle_dir')
        let g:localbundle_dir = expand('$HOME/.vim/localbundle')
    endif
    if !exists('g:localbundle_rtp')
        let g:localbundle_rtp = ''
    endif
    if filereadable(g:localbundle_dir."/autoload/vundle.vim")
        set rtp&
        exe 'set rtp^='.fnameescape(g:localbundle_rtp)
        exe 'set rtp^='.fnameescape(g:localbundle_dir)
        exe 'set rtp+='.fnameescape(g:localbundle_dir.'/after')
    endif
endfun "}}}

fun! s:log(msg) "{{{
    echo a:msg
endfun "}}}
fun! s:system(cmd) abort "{{{
  return system(a:cmd)
endfun "}}}
fun! localbundle#install() abort "{{{
    
    let local_dir = shellescape(g:localbundle_dir)
    if !exists("g:bundle_dir")
        let g:bundle_dir = expand('$HOME/.vim/bundle') 
    endif
    let bundle_dir = shellescape(g:bundle_dir)
    call s:log('')
    call s:log('Remove dir of localbundle')
    if has('win32') || has('win64')
        let cmd = "rd /S /Q ".local_dir
    else
        let cmd = "rm -rf ".local_dir
    endif
    let out = s:system(cmd)
    call s:log('$ '.cmd)
    call s:log('> '.out)

    call mkdir(g:localbundle_dir, "p")

    call s:log('')
    call s:log('copy to localbundle ')
    if has('win32') || has('win64')
        let dirs = split(glob(g:bundle_dir.'/*/'),'\n')
        for dir in dirs
            let cmd =   'xcopy /E /Y /C /I '.shellescape(dir."*").' '.local_dir
            let out = s:system(cmd)
            call s:log('$ '.cmd)
            call s:log('> '.out)
        endfor
    else
        let cmd = "cp -rnl ".bundle_dir."/*/* ".local_dir
        let out = s:system(cmd)
        call s:log('$ '.cmd)
        call s:log('> '.out)
    endif

    if 0 != v:shell_error
        return 'error'
    else
        return 'updated'
    end
endfun "}}}

let &cpo = s:cpo_save
unlet s:cpo_save
