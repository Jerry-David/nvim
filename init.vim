 "__  __         ___       _ _         _           
"|  \/  |_   _  |_ _|_ __ (_) |___   _(_)_ __ ___  
"| |\/| | | | |  | || '_ \| | __\ \ / / | '_ ` _ \ 
"| |  | | |_| |  | || | | | | |_ \ V /| | | | | | |
"|_|  |_|\__, | |___|_| |_|_|\__(_)_/ |_|_| |_| |_|
        "|___/                                     




" change my leader key to <space>
let mapleader=" "




" =====Plug===== "

call plug#begin('/home/jerry/.config/nvim/plugged')
" vim功能强化
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'lilydjwg/fcitx.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/switch.vim'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'voldikss/vim-translator'
Plug 'junegunn/vim-peekaboo'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 't9md/vim-choosewin'
Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }
Plug 'gcmt/wildfire.vim'
Plug 'vim-scripts/restore_view.vim'

" HTML
Plug 'mattn/emmet-vim'
Plug 'skammer/vim-css-color'
Plug 'lepture/vim-jinja'

" 代码片段
Plug 'honza/vim-snippets'

" 美化
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/vim-cursorword'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vwxyutarooo/nerdtree-devicons-syntax', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'

" Python
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'mgedmin/python-imports.vim'

" Go
Plug 'fatih/vim-go', { 'tag': '*', 'for': 'go' }

" 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" markdown
Plug 'godlygeek/tabular', { 'for': 'markdown'}
Plug 'plasticboy/vim-markdown', { 'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()


" 加载插件配置
source ~/.config/nvim/plug_settings.vim


" =====Plug END===== "


" =====Function===== "

function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }
  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&winhl', 'Normal:Pmenu')
  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction


function! s:LastTab()
    let tab=tabpagenr()
    tabnext
    execute "tabmove ".tabpagenr('$')
    execute "tabn ".tab
endfunction


func! Run()
    exec "w"
    if &filetype == 'python'
        set splitright
        :sp
        :term run_python %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'html'
        set splitright
        :sp
        :term google-chrome-stable %
    elseif &filetype == 'go'
        set splitright
        :sp
        :term go run %
    elseif &filetype == 'cpp'
        set splitright
        :sp
        :term compile %
    endif
endfunc


" =====Function END====="



" =====settings===== "

inoremap ,, <Esc>I
inoremap .. <Esc>A
inoremap {% {%  %}<left><left><left>

noremap +y "+y
noremap +p "+p
noremap <c-u> <c-i>
noremap cw z=

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let b:haveRemappedT=1
let s:oldmap=maparg('T', 'n')
let g:deus_termcolors=256
let g:neoterm_autoscroll=1

language message zh_CN.UTF-8

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.utf-8
set showtabline=2
set t_Co=256
set termguicolors
set number
set relativenumber "相对行号
set cursorline "高亮光标所在行
set wrap "超行换行
set showcmd
set wildmenu "命令行补全
set hlsearch "搜索高亮
set incsearch "智能查找
set ignorecase
set list
set smartcase
set updatetime=1
set autochdir
set lazyredraw
set listchars=tab:>-,trail:·
set mouse=a
set scrolloff=5
set backspace=2
set smartindent
set noswapfile
set modifiable
set textwidth=100
set autoindent "智能缩进
set background=dark
set shiftwidth=4
set tabstop=4
set expandtab "替换制表符为空格

map W :w<CR>
map Q :q<CR>
map <leader>q :qa<CR>
map <leader>w :wa<CR>
map c<left> <c-w>t<c-w>H
map c<right> <c-w>t<c-w>H
map c<up> <c-w>t<c-w>K
map c<down> <c-w>t<c-w>K
map cr <c-w>r
map . $
map , ^
map ' %
map r :call Run()<CR>
map msp<right> :set splitright<CR>:vsplit<CR>
map msp<left> :set nosplitright<CR>:vsplit<CR>
map msp<down> :set splitbelow<CR>:split<CR>
map msp<up> :set nosplitbelow<CR>:split<CR>
map mspl :set splitright<CR>:vsplit<CR>
map msph :set nosplitright<CR>:vsplit<CR>
map mspj :set splitbelow<CR>:split<CR>
map mspk :set nosplitbelow<CR>:split<CR>
map <Leader><right> <C-w>l
map <Leader><up> <C-w>k
map <Leader><down> <C-w>j
map <leader><left> <C-w>h
map wl <C-w>l
map wk <C-w>k
map wj <C-w>j
map wh <C-w>h
map csk :res -5<CR>
map csj :res +5<CR>
map csh :vertical resize+5<CR>
map csl :vertical resize-5<CR>
map <C-t> :tabe<CR>
map <S-down> 5j
map <S-up> 5k
map <C-left> 5h
map <C-right> 5l
map <S-j> 5j
map <S-k> 5k
map <S-h> 5h
map <S-l> 5l
map <leader><cr> o<esc>
map te :set nonumber<cr>:set norelativenumber<cr>:term<cr>
map <leader>lg :tabe<cr>:set nonumber<cr>:set norelativenumber<cr>:term lazygit<cr>
map <leader>t :call OpenFloatingWin()<CR>
map <leader>rc :e ~/.config/nvim/init.vim<cr>
map PY :sp<cr>:term ipython<cr>
map ; :
map / ?
map R :e<cr>
map RL :source $MYVIMRC<cr>
map noh :set nohlsearch<cr>
map figlet :r !figlet %<cr>

" 加载数字配置
source ~/.config/nvim/number.vim

nnoremap <C-j> :-tabnext<CR>
nnoremap <C-k> :+tabnext<CR>
nnoremap <leader><cr> o<esc>
nnoremap c+ <esc>/<++><CR>:noh<cr>v3ls

tnoremap <esc> <C-\><C-n>

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

autocmd TermOpen term://* startinsert 
autocmd Filetype markdown inoremap n1 # <cr><++><esc>ka
autocmd Filetype markdown inoremap n2 ## <cr><++><esc>ka
autocmd Filetype markdown inoremap n3 ### <cr><++><esc>ka
autocmd Filetype markdown inoremap n4 #### <cr><++><esc>ka
autocmd Filetype markdown inoremap n5 ##### <cr><++><esc>ka
autocmd Filetype markdown inoremap n6 ###### <cr><++><esc>ka
autocmd Filetype markdown inoremap c+ <esc>/<++><CR>:noh<cr>c4l
autocmd Filetype markdown inoremap ,i ** <++><esc>F*i
autocmd Filetype markdown inoremap ,b **** <++><esc>F*hi
autocmd Filetype markdown inoremap ,d ~~~~ <++><esc>F~hi
autocmd Filetype markdown inoremap ,p ![avatar](<++>) <++><esc>F(a
autocmd Filetype markdown inoremap ,a [](<++>) <++><esc>F[a
autocmd Filetype markdown inoremap ``` ```<cr><++><cr>```<esc>kkA
autocmd Filetype markdown inoremap -- <cr>---<cr>
autocmd FileType html set shiftwidth=4
autocmd FileType html set tabstop=4
autocmd Filetype html inoremap ,p &nbsp;
autocmd FileType jinja.html set shiftwidth=4
autocmd FileType jinja.html set tabstop=4
autocmd Filetype jinja.html inoremap ,p &nbsp;
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType cpp set shiftwidth=2
autocmd FileType cpp set tabstop=2
autocmd FileType cpp nmap debug :!g++ % -g -o %<<CR>:packadd termdebug<CR>:Termdebug %<<CR>

exec "nohlsearch"

silent !mkdir -p ~/.config/nvim/tmp/backup 
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

" =====settings END===== "
