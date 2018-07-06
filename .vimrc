"set spell spelllang=en_ca

"Color scheme
syntax enable
let g:solarized_termtrans=1
set background=light
colorscheme solarized

"General Behaviour
filetype indent on
set nu
set guifont=Monospace\ 16
set linespace=1
set tabstop=4
set shiftwidth=4
set nowrap
set noic
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch
set ic
set autoread
set showcmd
set remap
set guioptions=
set wak=no
set backspace=indent,eol,start
set so=10 "experimenting

"Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :q<CR>
nnoremap gj gT
nnoremap gk gt
nnoremap gml :execute "tabmove" tabpagenr() - 2 <CR>
nnoremap gmr :execute "tabmove" tabpagenr() + 1<CR>

"Splitting
nnoremap ge <C-w><C-w>
"nnoremap gr <C-w><C-r>
nnoremap fl <C-w><C-l>
nnoremap fh <C-w><C-h>
nnoremap fj <C-w><C-j>
nnoremap fk <C-w><C-k>
set splitbelow
set splitright
nnoremap <C-H> <C-w><
nnoremap <C-L> <C-w>>
nnoremap <C-Up> <C-w>-
nnoremap <C-Down> <C-w>+

"Compile/Run
nnoremap gb :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>
"nnoremap go :!time python %:r.py < %:r.in > %:r.out<CR>
"inoremap <F5> <Esc>:w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -g -std=c++17 -Wall -Wextra -Wno-unused-result -D LOCAL -O2 %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>i
nnoremap gc :w<CR>:!time g++ -std=c++14 -Wall -Wno-unused-result -O2 %:r.cc -o %:r_gen<CR>:!time ./%:r_gen > %:r.in<CR>
nmap gq gc<CR>gb
"Screw Java
"nmap fj :!time javac -d out/ *.java<CR>:!java -cp out %:r<CR>
inoremap <F6> <Esc>:!time javac -d out/ *.java<CR>:!java -cp out %:r < %:r.in > %:r.out<CR>
nnoremap <F10> :!rm doc/*<CR>:!time javadoc -quiet -d doc/ -author -version -private *.java<CR>
"nnoremap <F11> :!pdflatex %:t && evince %:r.pdf<CR>
nnoremap gpr :!evince %:r.pdf<CR>
nnoremap gpc :!pdflatex --shell-escape %:t && evince %:r.pdf<CR>
nnoremap gp <Nop>

"NERDTree
map <C-f> :NERDTreeToggle<CR>

"Misc Bindings
nnoremap gs :so ~/.vimrc<CR>:e<CR>
nnoremap gn :noh<CR>
nnoremap Q <C-q>
nnoremap K <nop>
vnoremap K <nop>
"nnoremap <F3> :set background=dark<CR>
"nnoremap <F2> :set background=light<CR>
nnoremap gwl :set background=light<CR>
nnoremap gwd :set background=dark<CR>
nnoremap , "_
"nnoremap <F12> :set guifont=*<CR>
nnoremap gvb :tabnew ~/.bashrc<CR>
nnoremap gvv :tabnew ~/.vimrc<CR>
nnoremap gvt :tabnew ~/template.cpp<CR>
nnoremap gvg :tabnew ~/gen.cpp<CR>
nnoremap <Esc> :w<CR>
nnoremap grd :%s/\t\+d(".\+\n//g<CR>
"nmap gi <nop>
nmap gi :vsp %:r.err<CR>fh30<C-L>:tabnew %:r.in<CR>:vsp %:r.out<CR>:vsp %:r.err<CR>2fh:tabnew %:r.cc<CR>:tabnew %:r.cerr<CR>gk
"nmap gib :vsp %:r.in<cr>:vsp %:r.cerr<cr>fh:sp %:r.out<cr>fl:sp %:r.err<cr>fhfh:vert res 70<cr>fl:vert res 20<cr>fh
nnoremap gd /d("<CR>n
"noremap f `

"Autocomplete
inoremap {[ {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {{ {<CR>}<CR><Esc>kO
"inoremap ({[ ({<CR>});<Esc>O
"inoremap ({{ ({<CR>});<CR><Esc>kO

"inoremap ppp System.out.println

"MS behaviour
source $VIMRUNTIME/mswin.vim
behave mswin

imap <F12> <Esc>:!time javac -d out/ *.java<CR>:!java -cp out %:r<CR> i
