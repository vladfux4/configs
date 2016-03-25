" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
set t_Co=256
syntax on
set number
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
let &path.="src/include,/usr/include/AL,"
execute pathogen#infect()
filetype plugin indent on
colorscheme gruvbox
set background=dark 
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_min_num_of_chars_for_completion = 3
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/qt5
set tags+=~/.vim/tags/opencv
"set completeopt-=preview
map <F4> :tabnew %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nnoremap <F2> :YcmCompleter GoToDeclaration<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarCurrentTag<CR>
nnoremap <F3> :YcmCompleter GoToDefinition<CR>
set wildmenu
set wildmode=longest:full,full
set makeprg=mkdir\ -p\ build;cd\ build;cmake\ ..;cd\ ..;make\ -C\ build/
command RR :!cd build;./$(cat ../CMakeLists.txt | grep project | sed 's/project(//g;s/^\(.*\).$/\1/');cd ..
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
nnoremap sw :vim <cword> *\| cw<CR>
