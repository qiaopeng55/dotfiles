" Font
set guifont=Monaco:h17.00

" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" no transparency
set transparency=0

" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif

colorscheme synic

augroup mkd

  autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;

augroup END
