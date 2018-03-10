nnoremap k gk
nnoremap j gj

" remap arrow keys to resize
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

nnoremap <silent> + :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "vertical resize " . (winheight(0) * 2/3)<CR>

" Map ; to : to avoid mistakes
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>

" Map ; to : to avoid mistakes
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Tab navigatin mappings
" map tn <Esc>:enew<CR>
" map tx <Esc>:bprevious<CR>:bdelete #<CR>
" map tl <Esc>:bnext<CR>
" map th <Esc>:bprevious<CR>

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear search highlights
noremap <silent><leader>/ :nohls<CR>

" fold html tag
nnoremap <leader>ft Vatzf

" deoplete kb
inoremap <expr><Tab> pumvisible() ? "\<C-R>" : "\<tab>"

" open a new vertical split
nnoremap <leader>w <C-w>v<C-w>l

" Show buffer list
nnoremap <leader>b :ls<CR>:buffer<Space>

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_move_highlight = 0

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap s <Plug>(easymotion-sn)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" tmux nav
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" airline idx tab nav
" nmap t1 <Plug>AirlineSelectTab1
" nmap t2 <Plug>AirlineSelectTab2
" nmap t3 <Plug>AirlineSelectTab3
" nmap t4 <Plug>AirlineSelectTab4
" nmap t5 <Plug>AirlineSelectTab5
" nmap t6 <Plug>AirlineSelectTab6
" nmap t7 <Plug>AirlineSelectTab7
" nmap t8 <Plug>AirlineSelectTab8
" nmap t9 <Plug>AirlineSelectTab9

" make c-r smart on autocomplete
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
