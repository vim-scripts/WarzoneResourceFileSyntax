if exists("b:current_syntax")
  finish
endif

syn keyword wrfStatement directory file
syn keyword wrfTodo contained TODO FIXME XXX

" wrfCommentGroup allows adding matches for special things in comments
syn cluster wrfCommentGroup contains=wrfTodo

syn region wrfString start=+L\="+ skip=+\\\\\|\\"+ end=+"+
syn region wrfCommentL start="//" skip="\\$" end="$" keepend contains=@wrfCommentGroup,wrfCommentStartError
syn region wrfComment matchgroup=wrfCommentStart start="/\*" end="\*/" contains=@wrfCommentGroup,wrfCommentStartError
syn match wrfCommentError display "\*/"
syn match wrfCommentStartError display "/\*"me=e-1 contained

hi def link wrfCommentL wrfComment
hi def link wrfCommentStart wrfComment
hi def link wrfCommentError wrfError
hi def link wrfCommentStartError wrfError
hi def link wrfComment Comment
hi def link wrfError Error
hi def link wrfTodo Todo
hi def link wrfStatement Statement
hi def link wrfString String
