let g:go_fmt_command = "goimports"

set ts=4 sw=4
"set cursorcolumn
"set cursorline
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>

let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>

set nu
syntax on

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'easymotion/vim-easymotion'

nmap ss <Plug>(easymotion-s2)

call vundle#end()
filetype plugin indent on


"auth info
map <F4> :call TitleDet()<cr>
function AddTitle()
	call append(0,"# ******************************************************")
	call append(1,"# Author       : litianxiang")
	call append(2,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
	call append(3,"# Email        : crrealmadrid@hotmail.com")
	call append(4,"# Filename     : ".expand("%:t"))
	call append(5,"# ******************************************************")
	echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endf

function UpdateTitle()
	normal m'
	execute '/# Last modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
	normal ''
	normal mk
	execute '/# Filename/s@:.*$@\=":\t".expand("%:t")@'
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function TitleDet()
	let n=1
	while n < 10
		let line = getline(n)
		if line =~ '^\#\s*\S*Last\smodified\S*.*$'
			call UpdateTitle()
			return
		endif
		let n = n + 1
	endwhile
	call AddTitle()
endfunction
													    '