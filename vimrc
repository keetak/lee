execute pathogen#infect()
set nocompatible
set nu
set hlsearch
set showmatch
set ruler
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set cindent
set ts=4
set sw=4
set sts=4
" Theme (https://github.com/tanvirtin/monokai.nvim)
syntax on
filetype on
colorscheme molokai
set termguicolors

" <Key bindings>
nmap <C-f> *N
nmap 4 <C-w>W
nmap 6 <C-w>w
nmap , <C-o>
nmap . <C-i>
nmap <Del> <Esc><C-w>c
nmap <F11> :LHTags "<cword>"<CR>


" khorser/vim-mark-tools
nmap r <Plug>ToggleMarkAZ
nmap R :delmarks a-zA-Z0-9<CR>

" vim-clap (https://github.com/liuchengxu/vim-clap)
nmap 1 :Clap grep +no-cache ./
nmap 2 :Clap grep +no-cache<CR>
nmap 3 :Clap grep +no-cache ++query=<cword><CR>
nmap q :Clap quickfix +no-cache<CR>
"nmap ` :Clap command_history<CR>
nmap f :Clap blines +no-cache<CR>
nmap ' :Clap files ++finder=find +name-only<CR>
nmap ; :Clap filer<CR>
nmap l :Clap git_diff_files<CR>
nmap j :Clap jumps<CR>
nmap t <ESC> :delmarks a-z0-9<CR> :Clap marks +no-cache<CR>
nmap b :Clap buffers<CR>
let g:clap_layout = { 'relative': 'editor', 'width': '70%', 'height': '35%', 'row': '10%', 'col': '15%' }
let g:clap_provider_grep_delay = '500'
let g:clap_provider_grep_blink = [3, 1000]
let g:clap_preview_size = 8
let g:clap_preview_direction = 'UD'
let g:clap_preview_delay = '150'
let g:clap_enable_background_shadow = v:false
let g:clap_insert_mode_only = v:true
let g:clap_dispatcher_drop_cache = v:false
let g:clap_provider_grep_executable = 'rg'
let g:clap_force_matchfuzzy = 'Python'
let g:clap_provider_grep_opts = '-H --vimgrep --smart-case'

" vim-interstingwords (https://github.com/lfv89/vim-interestingwords)
let g:interestingWordsDefaultMappings = 0
nmap <silent> <SPACE> :call InterestingWords('n')<CR>
nmap <silent> <BS> :call UncolorAllWords()<CR> :noh<CR>
let g:interestingWordsGUIColors = ['#50fd50', '#dc4343', '#FF7F50', '#00a495', '#a184cb', '#ffa500', '#c9cc8c', '#8bb6cc', '#98ba90', '#FF11FF', '#8D876B', '#ffe4af', '#00FFFF', '#cc8c8c', '#1E90FF', '#dfd4e4']

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
