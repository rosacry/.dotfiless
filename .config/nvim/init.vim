call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'projekt0n/github-nvim-theme'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim'
Plug 'preservim/nerdtree'
Plug 'semanser/vim-outdated-plugins'
Plug 'tpope/vim-eunuch'
call plug#end()
map! <F1> <nop>
map! <F2> <nop>
map! <F3> <nop>
map! <F4> <nop>
map! <F5> <nop>
map! <F6> <nop>
map! <F7> <nop>
map! <F8> <nop>
map! <F9> <nop>
map! <F10> <nop>
map! <F11> <nop>
map! <F12> <nop>
inoremap jk <ESC>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:prettier#autoformat = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
set number relativenumber
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
set laststatus=2
set noshowmode
colorscheme github_dark
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-pyright',
  \ 'coc-java',
  \ 'coc-jedi',
  \ 'coc-json',
  \ ]
let g:coc_snippet_next = '<Down>'
let g:coc_snippet_prev = '<Up>'
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
inoremap {<CR> {<CR>}<ESC>O
inoremap " ""<Esc>i
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
function CompileFileType()
  if (&ft=='c' || &ft=='cpp')
    echo "Compiling..."
    :silent :!g++ -o  %:r.out % -std=c++11<Return>
  elseif (&ft=='java')
    echo "Compiling..."
    :silent :w | :silent :make
  elseif (&ft=='python')
    echo "Compiling..."
    :silent :!python3 -m py_compile<Return>
  endif
endfunction
function CompileRunFileType()
  call CompileFileType()
  if (&ft=='c' || &ft=='cpp')
    :!./%:r.out
  elseif (&ft=='java')
    :!java -cp %:p:h %:t:r
  elseif (&ft=='python')
    :!python3 %:r.py
  endif
endfunction
nnoremap <silent> <F7> :call CompileRunFileType()<CR>
map <F8> :cprevious<Return>
map <F9> :cnext<Return>
set wrap linebreak
autocmd BufWritePre * :%s/\s\+$//e
let g:ale_linters= {
 \   'python': ['flake8'],
 \   'cpp': ['cc', 'gcc', 'clang'],
 \}
let g:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'python': ['autoflake' , 'autoimport' ,'black' , 'autopep8', 'isort' , 'reorder-python-imports' , 'yapf'],
 \}
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = { '\.h$': { 'ale_linters': { 'cpp' : ['cc', 'gcc', 'clang'] } } }
let opts = '-std=c++17 -Wall -Wextra'
let g:ale_cpp_cc_options    = opts
let g:ale_cpp_gcc_options   = opts
let g:ale_cpp_clang_options = opts
let g:ale_fix_on_save = 1
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
let g:multi_cursor_select_all_word_key = '<C-b>'
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :NERDTreeCWD<CR>
let NERDTreeShowHidden=1
noremap y "*y
noremap yy "*yy
autocmd BufEnter * lcd %:p:h
nnoremap <F1> :Rename
"nnoremap <F2> :Move
nnoremap <F3> :Wall
nnoremap <F4> :Remove
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:toggle = 0
function CopilotToggle(toggle)
  if g:toggle == 0
    :Copilot enable
    let g:toggle = 1
    echo "Copilot Enabled"
  else
    :Copilot disable
    let g:toggle = 0
    echo "Copilot Disabled"
  endif
endfunction
noremap <silent><F10> :call CopilotToggle(g:toggle)<CR>
let g:copilot_filetypes = {
\ '*': v:false,
\ 'python': v:true,
\ 'cpp': v:true,
\ 'java': v:true,
\ 'vim': v:true,
\ }
function! s:Git(args)
  :Git add .
  :Git commit -m args
  :Git push
endfunction
command! -nargs=1 Gitt call s:Git(<f-args>)
nnoremap <F11> :PlugUpdate<Return>
nnoremap <F12> :source %<Return>
