execute pathogen#infect('~/my-settings/bundle/{}')

set nocompatible
set hlsearch
set showmatch
set ruler
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set cursorline

"set cindent
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set noexpandtab
set bs=indent,eol,start

" Theme (https://github.com/tanvirtin/monokai.nvim)
syntax on
filetype on
colorscheme molokai
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
highlight clear CursorLine
highlight CursorLine gui=underline cterm=underline

" <Key bindings>
nmap <C-f> *N
nmap 4 <C-w>W
nmap 6 <C-w>w
nmap , <C-o>
nmap . <C-i>
nmap <Del> <Esc><C-w>c
nmap <F9> :exe 'tj' expand('<cword>')<CR>
nmap + <C-w>><C-w>>
nmap - <c-w><<c-w><

" TagFinder https://github.com/AndrewRadev/tagfinder.vim
runtime plugin/tagfinder.vim
DefineTagFinder Tag
DefineTagFinder Tjs c,s
DefineTagFinder Tjf c,f
DefineTagFinder Tjv c,v
DefineTagFinder Tjm c,m

" vim-clap (https://github.com/liuchengxu/vim-clap)
nmap <F5> :Clap live_grep ./<CR>
nmap <F6> :Clap live_grep ++query=<cword><CR>
nmap <S-f> :Clap blines +no-cache ++query=<cword><CR>
nmap ' :Clap files +no-cache +name-only<CR>
nmap ; :Clap filer +no-cache<CR>
nmap l :Clap git_diff_files<CR>
nmap j :Clap jumps<CR>
nmap t <ESC> :delmarks a-z0-9<CR> :Clap marks +no-cache<CR>
nmap <C-b> :Clap buffers +no-cache<CR>
let g:clap_layout =
\	{ 'relative': 'editor',
\	   	'width': '49%',
\		'height': '90%',
\		'row': '10%',
\		'col': '2%'
\  	}
let g:clap_enable_background_shadow = v:false
let g:clap_insert_mode_only = v:true
let g:clap_dispatcher_drop_cache = v:false
let g:clap_provider_live_grep_executable = 'rg'
let g:clap_provider_live_grep_opts = '-H --vimgrep'
let g:clap_fuzzy_match_hl_groups = [[118 , '#87ff00'] ,]

" vim-interstingwords (https://github.com/lfv89/vim-interestingwords)
let g:interestingWordsDefaultMappings = 0
nmap <silent> <SPACE> :call InterestingWords('n')<CR>
nmap <silent> <BS>  :noh<CR> :call UncolorAllWords()<CR>
let g:interestingWordsGUIColors =
\	['#E45756',
\	'#F58518',
\	'#F6F926',
\	'#B6E880',
\	'#2ED9FF',
\	'#4C78A8',
\	'#AB63FA',
\	'#FF97FF']

" Highlight the search results
highlight Search term=reverse ctermfg=7 ctermbg=9 guifg=white guibg=Red

let g:linuxsty_patterns = [ "/linux/", "/kernel/" ]
