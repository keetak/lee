execute pathogen#infect('~/my-settings/bundle/{}')
set nocompatible
set nu
set hlsearch
set showmatch
set ruler
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set cindent
set cursorline
set ts=4
set sw=4
set sts=4
set bs=indent,eol,start
" Theme (https://github.com/tanvirtin/monokai.nvim)
syntax on
filetype on
colorscheme molokai
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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

"TagFinder https://github.com/AndrewRadev/tagfinder.vim
runtime plugin/tagfinder.vim
DefineTagFinder Tag
DefineTagFinder Tjs c,s
DefineTagFinder Tjf c,f
DefineTagFinder Tjv c,v
DefineTagFinder Tjm c,m

nmap <F10> :exe 'Tjs' expand('<cword>')<CR> :copen <CR>
nmap <F11> :exe 'Tjf' expand('<cword>')<CR> :copen <CR>
nmap <F12> :exe 'Tjv' expand('<cword>')<CR> :copen <CR>

" vim-clap (https://github.com/liuchengxu/vim-clap)
"nmap <F5> :Clap grep <CR>
nmap <F5> :Clap grep ++query=<cword><CR>
nmap <F6> :Clap grep ./
"nmap q :Clap quickfix +no-cache<CR>
"nmap ` :Clap command_history<CR>
nmap f :Clap blines +no-cache<CR>
nmap ' :Clap files +no-cache +name-only<CR>
nmap ; :Clap filer +no-cache ++finder=rg<CR>
nmap l :Clap git_diff_files<CR>
nmap j :Clap jumps<CR>
nmap t <ESC> :delmarks a-z0-9<CR> :Clap marks +no-cache<CR>
nmap <C-b> :Clap buffers +no-cache<CR>
"let g:clap_layout = { 'relative': 'editor', 'width': '50%', 'height': '75%', 'row': '10%', 'col': '3%' }

"let g:clap_provider_grep_delay = '400'
"let g:clap_provider_grep_blink = [3, 1000]
"let g:clap_preview_size = 6
"let g:clap_preview_direction = 'UD'
"let g:clap_preview_delay = '150'
" let g:clap_enable_background_shadow = v:false
" let g:clap_insert_mode_only = v:true
"let g:clap_dispatcher_drop_cache = v:false
"let g:clap_provider_grep_executable = 'rg'
"let g:clap_force_matchfuzzy = 'Python'
"let g:clap_provider_grep_opts = '-H --vimgrep --smart-case'
" let g:clap_provider_grep_opts = '-H --vimgrep --word-regexp'

" vim-interstingwords (https://github.com/lfv89/vim-interestingwords)
let g:interestingWordsDefaultMappings = 0
nmap <silent> <SPACE> :call InterestingWords('n')<CR>
nmap <silent> <BS> :call UncolorAllWords()<CR>
let g:interestingWordsGUIColors = ['#E45756', '#F58518', '#F6F926', '#B6E880', '#2ED9FF', '#4C78A8', '#AB63FA', '#FF97FF']
" Highlight the search results
hi Search term=reverse ctermfg=7 ctermbg=9 guifg=white guibg=Red

" let g:floaterm_shell='bash'
" let g:floaterm_width = 0.8
" let g:floaterm_height = 0.6
" nnoremap   <silent>		`   :FloatermToggle<CR>
" tnoremap   <silent>   `   <C-\><C-n>:FloatermToggle<CR>

" Highlight trailing spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
