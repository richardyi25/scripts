" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()
"filetype plugin indent on
filetype indent on

"Color scheme
syntax enable
"let g:solarized_termcolors=256
"set t_Co=16
set background=dark
colorscheme solarized

"Spellcheck
" NOTE: This must go under the colorscheme settings
" which overwrite these settings
"set spell spelllang=en_ca
highlight SpellBad cterm=underline
highlight SpellCap cterm=underline
highlight SpellLocal cterm=underline
highlight SpellRare cterm=underline
"runtime spell/cleanadd.vim

"General Behaviour
"filetype indent on
set nu
set guifont=Monospace\ 16
set linespace=1
set tabstop=4
set shiftwidth=4
set nowrap " this changes all the time
set linebreak
set showbreak=>>>\ 
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
set so=2

"Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :q<CR>
nnoremap gj gT
nnoremap gk gt
nnoremap gml :execute "tabmove" tabpagenr() - 2 <CR>
nnoremap gmr :execute "tabmove" tabpagenr() + 1<CR>
nnoremap <C-PageUp> <C-B>
nnoremap <C-PageDown> <C-F>
nnoremap yt :tabnew %:t<CR>

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
nnoremap <C-J> <C-w>+
nnoremap <C-K> <C-w>-

"Compile/Run
"nnoremap gb :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -O3 -g -std=c++17 -Wno-sign-compare -Wno-unused-result -Wall -Wextra -Wpedantic -Wshadow -Wchkp -fsanitize=address -D LOCAL %:r.cpp -o %:r 2>&1 \| tee %:r.cerr && printf "\n================\n   Running...\n================\n" && time ./%:r < %:r.in > %:r.out 2> %:r.err && printf "\n\n\n\n"<CR>
autocmd BufRead sol.cpp nnoremap gb :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -O2 -g -std=c++17 -Wno-sign-compare -Wno-unused-result -Wall -Wextra -Wpedantic -Wshadow -Wchkp -fsanitize=address -fsanitize=undefined -D LOCAL sol.cpp -o sol 2>&1 \| tee comp.log && printf "\n================\n   Running...\n================\n" && time ./sol < in.txt > out.txt 2> err.log && printf "\n\n\n\n"<CR>
nnoremap gc :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -O2 -g -std=c++17 -Wall -Wextra -Wpedantic -Wshadow -Wchkp -Wno-unused-result -D LOCAL gen.cpp -o gen 2>&1 \| tee g_comp.log && printf "\n================\n   Running...\n================\n" && time ./gen < g_in.txt > in.txt 2> g_err.log && printf "\n\n\n\n"<CR>
nnoremap gs :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -O3 -g -std=c++17 -Wno-sign-compare -Wno-unused-result -Wall -Wextra -Wpedantic -Wshadow -Wchkp -fsanitize=address -D LOCAL slow.cpp -o slow 2>&1 \| tee s_comp.log && printf "\n================\n   Running...\n================\n" && time ./slow < in.txt > s_out.txt 2> s_err.log && printf "\n\n\n\n"<CR>:!diff <(nl out.txt) <(nl s_out.txt) > diff.txt<CR>

"nnoremap gc :w<CR>:!printf "\033c" && printf "================\n  Compiling...\n================\n" && time g++ -O2 -g -std=c++14 -Wall -Wextra -Wpedantic -Wshadow -Wchkp -Wno-unused-result -D LOCAL %:r.cc -o %:r_gen && printf "\n================\n   Running...\n================\n" && time ./%:r_gen > %:r.in && printf "\n\n\n\n"<CR>
"nnoremap gc :w<CR>:!time g++ -std=c++14 -Wall -Wno-unused-result -O2 %:r.cc -o %:r_gen<CR>:!time ./%:r_gen > %:r.in<CR>
nmap gq gc<CR>gb
"Screw Java
"nmap fj :!time javac -d out/ *.java<CR>:!java -cp out %:r<CR>
inoremap <F6> <Esc>:!time javac -d out/ *.java<CR>:!java -cp out %:r < %:r.in > %:r.out<CR>
nnoremap <F10> :!rm doc/*<CR>:!time javadoc -quiet -d doc/ -author -version -private *.java<CR>
"nnoremap <F11> :!pdflatex %:t && evince %:r.pdf<CR>
"nnoremap gl :w<CR>:!evince %:r.pdf<CR>
"nnoremap gl :w<CR> :!printf "\033c" && pdflatex --shell-escape -halt-on-error %:t && evince %:r.pdf<CR>
nnoremap gp <Nop>

"NERDTree
"map <C-f> :NERDTreeToggle<CR>

"Misc Bindings
nnoremap grs :so ~/.vimrc<CR>:e<CR>
nnoremap gn :noh<CR>
":syntax sync fromstart<CR>
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
nnoremap gvs :tabnew ~/.vim/UltiSnips/tex.snippets<CR>
"nnoremap grh :syntax sync fromstart<CR>

" Saving behavior
nnoremap s :w<CR>
nnoremap S <NOP>

" Competitive setup
nnoremap grd :%s/.\+d(".\+\n//g<CR>
nnoremap gre :%s/nnoremap gd /d("<CR>n
nmap gi :vsp err.log<CR>fh30<C-L>:tabnew in.txt<CR>:sp comp.log<CR>ge5<C-J>:vsp out.txt<CR>:vsp err.log<CR>2fh:tabnew gen.cpp<CR>:vsp g_in.txt<CR>fh30<C-L>:tabnew g_in.txt<CR>:sp g_comp.log<CR>ge5<C-J>:vsp in.txt<CR>:vsp g_err.log<CR>2fh:tabnew slow.cpp<CR>:vsp s_err.log<CR>fh30<C-L>:tabnew in.txt<CR>:sp s_comp.log<CR>ge5<C-J>:vsp s_out.txt<CR>:vsp s_err.log<CR>2fhgk
" Contest mode (if no pre-written code is allowed)
"nmap gi :tabnew in.txt<CR>:tabnew out.txt<CR>:tabnew err.log<CR>:tabnew comp.log<CR>gk
if &diff
else
	autocmd BufRead sol.cpp nested normal gi
endif

"Autocomplete
inoremap {[ {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {{ {<CR>}<CR><Esc>kO
"inoremap ({[ ({<CR>});<Esc>O
"inoremap ({{ ({<CR>});<CR><Esc>kO

"inoremap ppp System.out.println

"MS behaviour stolen from $VIMRUNTIME/mswin.vim
vnoremap <C-C> "+y
map <C-V>		"+gP
if 1
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']
endif
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" Marktop syntax and autocompile
autocmd BufRead,BufNewFile *.mt set filetype=marktop
autocmd BufWritePost *.mt silent !marktop %:r.mt %:r.html

" Coq replacements
autocmd BufRead,BufNewFile *.v ab forall ∀
autocmd BufRead,BufNewFile *.v ab exists ∃
autocmd BufRead,BufNewFile *.v ab implies →
autocmd BufRead,BufNewFile *.v ab iff ↔
autocmd BufRead,BufNewFile *.v ab and ∧
autocmd BufRead,BufNewFile *.v ab or ∨
autocmd BufRead,BufNewFile *.v ab not ¬
autocmd BufRead,BufNewFile *.v ab neq ≠
autocmd BufRead,BufNewFile *.v ab leq ≤
autocmd BufRead,BufNewFile *.v ab geq ≥
autocmd BufRead,BufNewFile *.v ab null ∅
autocmd BufRead,BufNewFile *.v ab naturals ℕ
autocmd BufRead,BufNewFile *.v ab integers ℤ
autocmd BufRead,BufNewFile *.v ab belongs ∈
autocmd BufRead,BufNewFile *.v ab nbelongs ∉
autocmd BufRead,BufNewFile *.v ab subset ⊂
autocmd BufRead,BufNewFile *.v ab sum ∑
autocmd BufRead,BufNewFile *.v ab product ∏
autocmd BufRead,BufNewFile *.v ab lambda λ

" TeX autocompile
autocmd BufRead,BufNewFile *.tex set spell
autocmd BufRead,BufNewFile *.tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
autocmd BufRead,BufNewFile *.tex sp status.log
" Fix this later
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex wincmd -
autocmd BufRead,BufNewFile *.tex normal ge

" Experimentally compile twice for beamer stuff
autocmd BufRead *.tex nnoremap gb :w<CR>:!printf "\033c" && pdflatex --shell-escape -halt-on-error %:t > err.log 2>&1<CR><CR>:!~/latextool %:t err.log status.log<CR><CR>:!printf "\033c" && pdflatex --shell-escape -halt-on-error %:t > err.log 2>&1<CR><CR>:!~/latextool %:t err.log status.log<CR><CR>

" Scroll to the end when entering err.log (VERY EXPERIMENTAL)
autocmd BufEnter err.log normal G

" Racket compile
autocmd BufRead,BufNewFile *.rkt nnoremap gb :w<CR>:!printf "\033c" && printf "\n================\n   Running...\n================\n" && racket -l errortrace -t sol.rkt < in > out 2> err<CR>:!python ~/parse_trace.py %:p:h/err<CR><CR>


autocmd BufRead,BufNewFile sol.rkt sp out
autocmd BufRead,BufNewFile sol.rkt tabnew err
autocmd BufRead,BufNewFile sol.rkt normal gT
" autocmd BufRead,BufNewFile sol.rkt sp err
" autocmd BufRead,BufNewFile sol.rkt resize 1
" autocmd BufRead,BufNewFile sol.rkt wincmd k
" autocmd BufRead,BufNewFile sol.rkt vsp in
" autocmd BufRead,BufNewFile sol.rkt sp out
" autocmd BufRead,BufNewFile sol.rkt vertical resize -25

autocmd BufRead,BufNewFile *.tex filetype plugin indent on
autocmd BufRead,BufNewFile *.tex nnoremap gve :tabnew err.log<CR>

"autocmd BufWrite * if localtime() % 10 == 0 | let x = input("Vim Crashed. Press enter to continue") | wqa | endif

" For CS 245E
autocmd BufRead,BufNewFile *.rkt inoremap \lam λ
autocmd BufRead,BufNewFile *.rkt inoremap \and ∧
autocmd BufRead,BufNewFile *.rkt inoremap \or  ∨
autocmd BufRead,BufNewFile *.rkt inoremap \not ¬
autocmd BufRead,BufNewFile *.rkt inoremap \bot ⊥
autocmd BufRead,BufNewFile *.rkt inoremap \for ∀
autocmd BufRead,BufNewFile *.rkt inoremap \ex  ∃
