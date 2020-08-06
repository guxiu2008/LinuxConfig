set term=vt100
set ts=4
set sw=4
set fileencoding=cp936
set fileencodings=cp936
set encoding=cp936
set encoding=UTF-8
set autoindent
set showcmd
set nocompatible
set smartindent
set showmatch
set t_Co=8
set t_Sf=[1;3%p1%dm
set t_Sb=[1;4%p1%dm
map <C-J> :set filetype=cpp<CR>
set hls
set incsearch

set path=.,/usr/include,include,inc,../include,../inc
set path+=/usr/local/SRBC2.0/include

set tags+=tags;
set backspace=indent,start whichwrap+=<,>,[,]

if has("fname_case")
	au BufNewFile,BufRead *.cxx,*.c++,*.C,*.H,*.hh,*.hxx,*.hpp,*.moc,*.tcc,*.inl,*.pc,*.ecpp,*.lua  setf cpp
else
	au BufNewFile,BufRead *.cxx,*.c++,*.hh,*.hxx,*.hpp,*.moc,*.tcc,*.inl,*.pc,*.ecpp,*.lua  setf cpp
endif

noremap <space> :call ToggleFold()<CR>
function ToggleFold()
	if foldlevel('.') == 0
		normal! l
	else
		if foldclosed('.') < 0
			. foldclose!
		else
			. foldopen!
		endif
	endif
	echo
endfunction

syntax on
highlight String  ctermfg=magenta
highlight Comment ctermfg=cyan
highlight Macro   ctermfg=gray
highlight Include ctermfg=magenta

function FoldBrace() 
	if getline(v:lnum+1)[0] == '{' 
		return 1 
	endif 
	if getline(v:lnum) =~ '{' 
		return 1 
	endif 
	if getline(v:lnum)[0] =~ '}' 
		return '<1' 
	endif 
	return -1 
endfunction

if has("autocmd")
	autocmd FileType text setlocal textwidth=78
	autocmd FileType text set nocindent
	autocmd FileType html set formatoptions+=tl
	autocmd FileType css  set smartindent
	autocmd FileType html,css set noexpandtab tabstop=2
	autocmd FileType c,cpp,slang,esqlc set cindent
	autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
	autocmd BufEnter * :lcd %:p:h

	autocmd BufReadPost *.c,*.ec,*.cpp,*.hpp,*.ecpp,*.pc,*.ppc set foldexpr=FoldBrace()
	autocmd BufReadPost *.c,*.ec,*.cpp,*.hpp,*.ecpp,*.pc,*.ppc set foldmethod=expr
	autocmd BufReadPost *.c,*.ec,*.cpp,*.hpp,*.ecpp,*.pc,*.ppc set foldenable
endif 
highlight Comment ctermfg=cyan

map <C-K> gt
map <C-H> gT
map <Tab> gt
set delcombine
map Q gq
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif
colorscheme  desert

set ruler
set tabpagemax=50


"
"" taglist
"
let Tlist_Show_One_File=1    "Ö»ÏÔÊ¾µ±Ç°ÎÄ¼şµÄtags
let Tlist_WinWidth=40        "ÉèÖÃtaglist¿í¶È
let Tlist_Exit_OnlyWindow=1  "tagList´°¿ÚÊÇ×îºóÒ»¸ö´°¿Ú£¬ÔòÍË³öVim
let Tlist_Use_Right_Window=0 "ÔÚVim´°¿ÚÓÒ²àÏÔÊ¾taglist´°¿Ú
let Tlist_WinHeight = 100
let Tlist_WinWidth = 40
let Tlist_Auto_Open = 1      "Æô¶¯vimºó×Ô¶¯´ò¿ªtaglist´°¿Ú
let Tlist_Ctags_Cmd = '/usr/bin/ctags' "ÉèÖÃctagsÂ·¾¶
"ÒÔÏÂÁ½¸öÅäÖÃÊ¹vim×Ô¶¯ÏòÉÏµİ¹éÑ°ÕÒtags
set autochdir
set tags=tags;
