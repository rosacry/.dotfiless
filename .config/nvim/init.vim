"Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'amix/open_file_under_cursor.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim'
Plug 'preservim/nerdtree'
Plug 'thisisrandy/vim-outdated-plugins'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'aymericbeaumet/vim-symlink'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'Igorjan94/codeforces.vim'
call plug#end()

"-------------------------------------------------------------------------------------------

"Theme
set background=dark
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            ['zoom', 'githunks', 'gitbranch', 'readonly', 'filename', 'method']],
  \   'right': [['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'trailing', 'lineinfo'],
  \             ['percent'],
  \             ['fileformat', 'fileencoding', 'filetype']]
  \ },
  \ 'tabline': {
  \   'left': [['buffers']],
  \   'right': [['close']]
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_ok': 'lightline#ale#ok',
  \   'trailing': 'lightline#trailing_whitespace#component',
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \   'trailing': 'error',
  \   'buffers': 'tabsel'
  \ },
  \ 'component_function': {
  \   'zoom': 'zoom#statusline',
  \   'githunks': 'LightlineGitGutter',
  \   'gitbranch': 'Lightlinegit',
  \   'filename': 'LightlineFilename',
  \   'method': 'NearestMethodOrFunction'
  \ },
  \   'separator': {'left': '', 'right': ''},
  \   'subseparator': {'left': '', 'right': ''}
  \ }
let g:lightline#bufferline#enable_devicons  = 1
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#show_number      = 1
let g:lightline#bufferline#unicode_symbols  = 1
let g:lightline#trailing_whitespace#indicator = '•'

function! Lightlinegit()
    let l:branch = FugitiveHead()
    return l:branch ==# '' ? '' : ' ' . l:branch
endfunction

function! LightlineGitGutter()
  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
    return ''
  endif
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' [+]' : ''
  return filename . modified
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
if exists('+termguicolors') && ($TERM == "st-256color" || $TERM == "tmux-256color")
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
colorscheme nord

"-------------------------------------------------------------------------------------------

"Unbind Function Keys
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

"-------------------------------------------------------------------------------------------

"Formatting
set number relativenumber
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set noshowmode
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=yes
set wrap linebreak
set splitbelow
set cursorline
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

"-------------------------------------------------------------------------------------------

"Coc Settings
let g:coc_global_extensions = [
  \ 'coc-ccls',
  \ 'coc-clangd',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-pyright',
  \ 'coc-java',
  \ 'coc-jedi',
  \ 'coc-json'
  \ ]
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"-------------------------------------------------------------------------------------------

"Compiling and Running Commands
augroup JavaCompile
  autocmd!
  autocmd Filetype java set makeprg=javac\ %
augroup END
function Compile()
  if (&ft=='c' || &ft=='cpp')
    echo "Compiling..."
    :silent :make %<
    echo "Compiled"
  elseif (&ft=='java')
    echo "Compiling..."
    :silent :w | :silent :make
    echo "Compiled"
  endif
endfunction
function Execute()
    if (&ft=='c' || &ft=='cpp')
      echo "Executing..."
      :split term:// ./%<
    elseif (&ft=='java')
      echo "Executing..."
      :split term:// java -cp %:p:h %:t:r
    elseif (&ft=='python')
      echo "Executing..."
      :split term:// python3 %:r.py
  endif
endfunction

"-------------------------------------------------------------------------------------------

"Removing Trailing Whitespace
augroup TrailingWhitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

"Ale Settings
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

"-------------------------------------------------------------------------------------------

"NerdTree Settings
let NERDTreeShowHidden=1

"-------------------------------------------------------------------------------------------

"Copilot Settings
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


let g:copilot_filetypes = {
\ '*': v:false,
\ 'python': v:true,
\ 'cpp': v:true,
\ 'java': v:true,
\ 'vim': v:true,
\ }

"-------------------------------------------------------------------------------------------

"Git Gutter Settings
function! s:Git(args)
  :Git add .
  :Git commit -m args
  :Git push
endfunction

"-------------------------------------------------------------------------------------------

"Changes current directory to directory of file in buffer
augroup AutoChdir
  autocmd!
  autocmd BufEnter * if &buftype !=# 'terminal' | lchdir %:p:h | endif
augroup END


"-------------------------------------------------------------------------------------------

"Key Mappings

"show lines highlighted in visual mode
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"Insert empty new line without entering insert mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>


"-------------------------------------------------------------------------------------------

"Function mappings
nnoremap <F1> :Rename
nnoremap <F2> :Move
nnoremap <F3> :Wall
nnoremap <F4> :Remove
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :NERDTreeCWD<CR>
nnoremap <silent><F7> :call Compile()<CR>
nnoremap <silent><F8> :call Execute()<CR>
map <F9> :cnext<Return>
map <F10> :cnext<Return>
noremap <silent><F11> :call CopilotToggle(g:toggle)<CR>

"-------------------------------------------------------------------------------------------

"Non-key Mappings


"-------------------------------------------------------------------------------------------

"Plugin Key Mappings

"Coc Mappings
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gs :call <SID>show_documentation()<CR>
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB>
      \ pumvisible() ? "\<C-p>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

"Expand Region Mappings
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

"Accept Suggestion from Copilot
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
"-------------------------------------------------------------------------------------------

"Plugin Non-Key Mappings
command! -nargs=1 Gitt call s:Git(<f-args>)

"-------------------------------------------------------------------------------------------

"Misc Key Mappings
let g:multi_cursor_select_all_word_key = '<C-b>'
vnoremap y "*y
nnoremap yy "*yy
nnoremap <C-]> :vsp $MYVIMRC<CR>
