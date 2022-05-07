
" NOTES

" :CocList extensions - all extensions of coc, including formatter
" extensions:
" coc-eslint - statically analyzes your code to quickly find problems
" coc-jedi - python intellisense
" coc-pairs - when typing symbol pairs it'll bring up the end of the pair
" coc-pyright - Pyright is a fast type checker meant for large Python source bases. It can run in a “watch” mode and performs fast incremental updates when files are modified.
" coc-tsserver - a node executable that encapsulates the TypeScript compiler and language services
" coc-java - language support for java
" coc-json - language support for json
" coc-prettier - formats script (fork from vscode)
" coc-snippets - snippets for coc


" Commands
" :so % (or file name) to source file
" :PlugClean clean plugins that were installed but not used anymore
" :PlugInstall to install plugins :)
" :PlugUpdate to update Plugins :D
" :CocCommand java.clean.workspace
" Notes and helpful commands
" :set wrap linebreak
" :WC is writing a compiling
" gd -> while hovering over a function shows where it came from ctrl-o brings
" you back
" Command-k brings up the definition of the functions
" F2 to rename
":CocInstall :CocUninstall :CocList extensions
"Use :CocList snippets to open snippets list.
"Use :CocCommand snippets.editSnippets to edit user snippet of current filetype.
"Use :CocConfig
"Use :CocCommand snippets.openSnippetFiles to open snippet files of current filetype.
"Use :CocCommand workspace.showOutput snippets
"Use :CocCommand java.clean.workspace if you get a [coc.nvim] The "java"

" Link of the many plugins I have : https://github.com/amix/vimrc
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

"Conquer of of Complete (Snippet and text editing support)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"File system explorer for vim - browse complete directory hierarchies
"Plug 'scrooloose/nerdtree'
"showing git status flags
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Show git diff in sign column, meaning it shows which lines have been added, motified, or removed
"Look into more when u not noob >:(
Plug 'airblade/vim-gitgutter'

"Full path file finder for vim
"Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

"Advanced commenting plugin (look into more when not noob)
"Plug 'scrooloose/nerdcommenter'

" post install (yarn install | npm install) then load plugin only for editing supported files
"Formatter
"Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

"When combined with a set of tmux key bindings, the plugin will allow you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
Plug 'christoomey/vim-tmux-navigator'

"Color Scheme
Plug 'projekt0n/github-nvim-theme'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

"snippets for various programming languages
Plug 'honza/vim-snippets'
"A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'
"Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim? Either way, it's "so awesome, it should be illegal". That's why it's called Fugitive. Really only use if for the status bar in vim :)
Plug 'tpope/vim-fugitive'
"open a file using gf
Plug 'amix/open_file_under_cursor.vim'
"control functions and timers to run linters on the contents of text buffers and return errors as text is changed in Vim. This allows for displaying warnings and errors in files being edited in Vim before files have been saved back to a filesystem.
Plug 'dense-analysis/ale'
"allows you to visually select increasingly larger regions of text using the same key combination
Plug 'terryma/vim-expand-region'
"Sublime text style multiple selections for vim - pretty cool for recactoring
"C-b + c to recator all, C-n c to refactor one word, C-n + C-n + .. to get
"next word
Plug 'terryma/vim-multiple-cursors'
"EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs.
Plug 'editorconfig/editorconfig-vim'
"A vim plugin for working with git
Plug 'github/copilot.vim'
"a file system explorer for the Vim editor
Plug 'preservim/nerdtree'
"outdated pluggin detector
Plug 'semanser/vim-outdated-plugins'
"Vim sugar for the UNIX shell commands that need it the most"
Plug 'tpope/vim-eunuch'
" Initialize plugin system
call plug#end()

"inoremap maps keys that work only in the insert and replace modes
inoremap jk <ESC>
"nmap Displays normal mode maps
"nmap <C-n> :NERDTreeToggle<CR>
"vmap Displays visual and select mode maps
"vmap ++ <plug>NERDCommenterToggle
"nmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

"let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",
    "\ "Modified"  : "#d9bf91",
    "\ "Renamed"   : "#51C9FC",
    "\ "Untracked" : "#FCE77C",
    "\ "Unmerged"  : "#FC51E6",
    "\ "Dirty"     : "#FFBD61",
    "\ "Clean"     : "#87939A",
    "\ "Ignored"   : "#808080"
    "\ }


"let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
"noremap non-recursive version of map - non-recursive meaning means the mapping is only expanded once, and that result is applied/executed.
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"numbers on left side are relative to the current number
set number relativenumber

"smarttab a <TAB> key inserts indentation according to 'shiftwidth' at the beginning of the line, whereas 'tabstop' and 'softtabstop' are used elsewhere.
set smarttab
"cindent - C language indentation automatically
set cindent
"tabstop - how many columns of whitespace a \t is worth
set tabstop=2
"shiftwidth - how many columns of whitespace a "level of indentation" is worth
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
"In order to show the branch name in the statusline, install some plugins which provide the branch information. The vim-fugitive plugin is a famous plugin so let's integrate lightline.vim with it. If you don't like to install full git integration but just want to display the branch name in the statusline, you can use the vim-gitbranch plugin which provides gitbranch#name function.
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': 'When you see a good move, look for a better one'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set laststatus=2
set noshowmode
" Le Color Scheme :)
colorscheme github_dark
" sync open file with NERDTree
" " Check if NERDTree is open or active
"function! IsNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
"  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" coc config
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
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<Tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<S-Tab>'
" from readme
" if hidden is not set, TextEdit might fail.
"allows hidden buffers
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
"from default of 4000 to 100 so vim can update to git faster
"Note updatetime also controls the delay before vim writes its swap file (see :help updatetime).
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Coc may overwrite this :o
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"backspace aborts the completeme intellisense (coc may overwrite this)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
inoremap {<CR> {<CR>}<ESC>O
inoremap " ""<Esc>i
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
command WC w | make
"map maps a sequence of keys to execute another sequence of keys. This is recursive, meaning that the mapping is expanded to a result, then the result is expanded to another result, and so on.
map <F9> :make<Return> :copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
set wrap linebreak
"Ale - make sure to do pip3 install flake8
let g:ale_linters= {
 \   'python': ['flake8'],
 \   'cpp': ['cc', 'gcc', 'clang'],
 \}
"must manually run command autofake to delete unused imports
let g:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'python': ['autoimport' ,'black' , 'autopep8', 'isort' , 'reorder-python-imports' , 'yapf'],
 \}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" C++ lint thing I found on github lol
let g:ale_pattern_options = { '\.h$': { 'ale_linters': { 'cpp' : ['cc', 'gcc', 'clang'] } } }
let opts = '-std=c++17 -Wall -Wextra'
let g:ale_cpp_cc_options    = opts
let g:ale_cpp_gcc_options   = opts
let g:ale_cpp_clang_options = opts
"Customize the key mapping if you don't like the default.
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)
"chaged this from A-n, just easier for me personally
let g:multi_cursor_select_all_word_key = '<C-b>'
"Transparent lightline theme
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
"NerdTree commands press "?" to show help
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-w> :NERDTreeCWD<CR>
let NERDTreeShowHidden=1
"Rebinding "*y to y
noremap y "*y
"Switch between window splits
"wincmd is the vimscript equivalent to Ctrlw in normal mode.
"In normal mode when you change of window you can use Ctrlw + p to come back to the previous window.
"Opens file location when opening file with vim
autocmd BufEnter * lcd %:p:h
