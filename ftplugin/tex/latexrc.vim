imap <buffer> <Leader>div <ESC>bywi\begin{<ESC>A}<ESC>o\end{<ESC>pa}<ESC>O
imap <buffer> <Leader>span <ESC>bywi\<ESC>A{}<ESC>i

imap <buffer> <Leader>fr \begin{frame}{}<ESC>o<ESC>o\end{frame}<ESC>kkA<LEFT>

imap <buffer> <Leader>tt \texttt{}<ESC>i
imap <buffer> <Leader>al \alert{}<ESC>i
imap <buffer> <Leader>st \structure{}<ESC>i

imap <buffer> <Leader>ul \begin{itemize}<ESC>o\end{itemize}<ESC>O<TAB>
imap <buffer> <Leader>UL \begin{outeri}<ESC>o\end{outeri}<ESC>O<TAB>
imap <buffer> <Leader>li \item 

"imap <buffer> <Leader>lst \lstinputlisting{}<ESC>i
imap <buffer> <Leader>lst \begin{qalisting}{}{}<ESC>o\end{qalisting}<ESC>O
imap <buffer> <Leader>img \includegraphics[width=.9\textwidth]{}<ESC>i

imap <buffer> <Leader>un <ESC>bywi\uncover<<ESC>A>{<ESC>o}<ESC>O
imap <buffer> <Leader>on <ESC>bywi\only<<ESC>A>{<ESC>o}<ESC>O
set textwidth=0
