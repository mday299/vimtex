function! toc#fold_level(lnum) " {{{1
    let line  = getline(a:lnum)
    let match_s1 = line =~# '^\w\+\s'
    let match_s2 = line =~# '^\w\+\.\w\+\s'
    let match_s3 = line =~# '^\w\+\.\w\+\.\w\+\s'

    if g:latex_toc_fold_levels >= 3
        if match_s3
            return ">3"
        endif
    endif

    if g:latex_toc_fold_levels >= 2
        if match_s2
            return ">2"
        endif
    endif

    if match_s1
        return ">1"
    endif

    " Don't fold options
    if line =~# '^\s*$'
        return 0
    endif

    " Return previous fold level
    return "="
endfunction

function! toc#fold_text() " {{{1
    let parts = matchlist(getline(v:foldstart), '^\(.*\)\t\(.*\)$')
    return printf('%-8s%-72s', parts[1], parts[2])
endfunction

" }}}1

" vim: fdm=marker
