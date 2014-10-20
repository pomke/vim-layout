" Toggle 2 or 1 pane layout, supports reserving space for Tlist plugin
" map <F2> :call ToggleLayout()<CR>  

fun CheckInVerticalSplit()
    let current = winnr()
    :wincmd j
    if winnr() != current
        :wincmd p
        return 1
    endif
    :wincmd p
    :wincmd k
    if winnr() != current
        :wincmd p
        return 1
    endif
    :wincmd p
    return 0
endfun

fun ExpandIfSplitVertical()
    if CheckInVerticalSplit() == 1
        :resize 40
    endif
endfun

let g:layout = 0
fun ToggleLayout()
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        let extraSize = 40
    else
        let extraSize = 0
    endif
    if g:layout == 0
        :exec "winsize " 161 + extraSize " 45"
        :vs
        let g:layout = 1
    else
        :exec "winsize " 80 + extraSize " 45"
        if winnr('$') > 1
            :q
        endif
        let g:layout = 0
    endif
endfun
