" Set php linter as make program (Can be called using :make)
setlocal makeprg=php\ -l
" Map <leader>L to the lint a php file
nnoremap <buffer> <leader>l :make %<CR>
" Allow vim to parse the error output and jump to the correct error line
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Set php manual page as default keyword program while the keyword to search
" for is selected by the cursor
setlocal keywordprg=pman

let g:syntastic_phpcs_conf=" --standard=PSR2 "
let  g:syntastic_php_phpcs_args = "--report=csv --standard=PSR2"

let g:php_source_prefixes = ['src/main/php/', 'src/main/', 'src/', 'lib/', 'test/phpunit/', 'test/', 'test/integration/']

func! PathToNamespace(path)
    let l:path = a:path
    for l:prefix in g:php_source_prefixes
        if stridx(l:path, l:prefix) == 0
            let l:path = strpart(l:path, strlen(l:prefix))
            break
        endif
    endfor
    return substitute(l:path, '/', '\\', 'g')
endfunc

" Completion for PHP keywords
set dictionary+=~/.vim/ftplugin/php/keywords.txt

" Completion types to use (current buffer, other window buffers, invisible
" buffers, included files and keywords)
setlocal complete=.,w,b,i,k
