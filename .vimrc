" Key bindings
" Tab : Toggles tagbar
map <Tab> :TagbarToggle<CR>
" Ctrl + Tab : Next tab
map <C-Tab> :tabnext<CR>
" Ctrl + Shift + Tab : Previous Tab
map <C-S-Tab> :tabprevious<CR>
nmap <C-n> :tabnew<CR>
" F6 : Toggle NERDTree
" nmap <F6> :NERDTreeToggle<CR>
" Ctrl + e: Go to next error
nmap <C-e> <Plug>(ale_next_wrap)
" Maps s + Direction to create a new split view.
map <A-j> :botright split<CR>
map <A-k> :topleft split<CR>
map <A-h> :topleft vsplit<CR>
map <A-l> :botright vsplit<CR>
" Maps Ctrl + Direction to move between split views.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Ctrl + t: Opens a new terminal on the bottom of the screen.
nmap <C-t> :term<CR>
" Ctrl + Shift + t: Opens a new terminal in a new tab.
nmap <C-S-t> :tab term<CR>
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" Opens the fuzzy finder.

" Terminal key bindings
" Esc : Sets the terminal into normal mode. It can be set back into terminal
" mode by pressing 'i'.
tmap <Esc> <C-\><C-n>


" Plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree' " File explorer
Plug 'airblade/vim-gitgutter' " Integrates git into the editor.
Plug 'vim-airline/vim-airline' " Better status line
Plug 'vim-airline/vim-airline-themes' " Themes for airline.
Plug 'sainnhe/sonokai' " My colourscheme.
Plug 'dense-analysis/ale' " Linting
Plug 'hugolgst/vimsence' " Discord rich presence so everyone can see what I'm editing in vim on Discord. 
Plug 'ryanoasis/vim-devicons' " Puts icons on the NERDTree and other places probably.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense thingy like vscode.
Plug 'bfrg/vim-cpp-modern' " C++ syntax highlighting.
"Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar' " It's like Code Outline in VS Code.
Plug 'Raimondi/delimitMate' " Autocompletes things like quotes, brackets, curly brackets, etc.
Plug 'frazrepo/vim-rainbow' " Rainbow brackets, parenthesis, etc.
Plug 'samsaga2/vim-z80' " Z80 Syntax highlighting.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Required by fzf.vim.
Plug 'junegunn/fzf.vim' " Fuzzy finder.

call plug#end()


" Misc
set number " Puts line numbers at the lefthand side of the editor.
"set background=dark " Makes the background dark.
set termguicolors " Enables colourschemes.
colorscheme sonokai " The colourscheme I use.   
set guifont=BlexMono\ Nerd\ Font\ 11 " guifont needed by vim-devicons NOTE: only works in gvim for some reason.
set guifontwide=Segoe\ UI\ Mono\ 11
set splitright " These two split definitions just set the default way vim splits vertically and horitzontaly.
set splitbelow

" coc
let g:coc_disable_startup_warning = 1

" sonokai
let g:sonokai_style = 'andromeda' " that previous statement of colourscheme actually only enabled the plugin which has a few colourschemes, so this statement sets the actual colourscheme.
let g:sonokai_enable_italic = 1 " Enables italics
let g:sonokai_disable_italic_comment = 1 " Disables italic comments.

" nerdtree
let NERDTreeShowHidden = 0 " Let's NERDTree show hidden files. Set it to 1 to have it show hidden files by default, otherwise it won't. Use Shift + i to toggle between enabled and disabled.

" airline
set laststatus=2 " IDK what this does but it's needed.
let g:airline_theme='sonokai' " Sets the theme for airline.
let g:airline_powerline_fonts=1 " Enables nice fonts.

" clang_complete
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang.so' " Tells coc where the compiler is.

" ale
let g:ale_linters = { 'cpp': ['clang'], 'java': ['javac'] } " Sets linter for C++.
let g:ale_sign_warning = '🚧' " Warning sign.
let g:ale_sign_error =  '🛑 ' " Error sign.

" Some code that is necessary for the linter.
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" vim-devicons
set encoding=UTF-8 " Sets the encoding so it displays properly.

" vim-rainbow
let g:rainbow_active = 1 
