
 "__  __         ___       _ _         _           
"|  \/  |_   _  |_ _|_ __ (_) |___   _(_)_ __ ___  
"| |\/| | | | |  | || '_ \| | __\ \ / / | '_ ` _ \ 
"| |  | | |_| |  | || | | | | |_ \ V /| | | | | | |
"|_|  |_|\__, | |___|_| |_|_|\__(_)_/ |_|_| |_| |_|
        "|___/                                     



" change my leader key to <space>
let mapleader=" "




" =====Plug===== "

call plug#begin('~/.config/nvim/plugged')
" vim功能强化
Plug 'lilydjwg/fcitx.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/switch.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'voldikss/vim-translator'
Plug 'junegunn/vim-peekaboo'

" HTML
Plug 'mattn/emmet-vim'

" 代码片段
Plug 'honza/vim-snippets'

" 美化
Plug 'vim-airline/vim-airline-themes'
Plug 'lfv89/vim-interestingwords'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-python/python-syntax'
Plug 'itchyny/vim-cursorword'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'

" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tmhedberg/SimpylFold'
Plug 'vim-python/python-syntax'

" Go
Plug 'fatih/vim-go', { 'tag': '*' }

" 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.vim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()


" far "
map <C-p>fw :Farf<cr>
map <C-p>cw :Farr<cr>
map <C-f>d :Fardo<cr>


" tagbar "
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Chapter',
        \ 'i:Section',
        \ 'k:Paragraph',
        \ 'j:Subparagraph'
    \ ]
\ }


" vimpy "
let g:vimpy_prompt_resolve = 1
let g:vimpy_remove_unused = 1


" python "
let g:SimpylFold_docstring_preview = 1
"nmap <silent> <space>rn :Semshi rename<CR>
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiVariable        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
let g:python_highlight_all = 1


" airline "
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#show_buffers = "unique_tail"
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '


" toc "
map to :Toc<cr>


" Translate "
nmap T <Plug>TranslateW
vmap T <Plug>TranslateWV
nmap <silent> tr <Plug>TranslateR
vmap <silent> tr <Plug>TranslateRV


" tagbar "
map ta :TagbarToggle<cr>


" ipdb "
autocmd Filetype python inoremap debug __import__('ipdb').set_trace()
autocmd Filetype python noremap nd <esc>/__import__('ipdb').set_trace()<cr>dd


" HTML "
autocmd Filetype html inoremap ,b <esc>@ki


" FZF "
map <C-p>f~ :Files ~<cr>
map <C-p>f\ :Files /<cr>
map <C-p>f :Files <cr>
map <C-p>w :Ag<cr>
map <C-p>b :Buffers<cr>
map <C-p>l :Lines<cr>
map <C-p>h :History<cr>
let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }


" NERDTree "
nmap ne :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store', 'tags', '\idea$', '.gitignore']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeShowlineNumber=1
let NERDTreeDirArrows=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


" emmet "
autocmd FileType html,css EmmetInstal
let g:user_emmet_install_global = 0
let g:user_emmet_expandabbr_key = '<c-q>'
let g:user_emmet_leader_key = '<Tab>'
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key='Z'


" undotree "
map U :UndotreeToggle<CR>


" go "
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2

" coc "
map yh :CocList yank<CR>
let g:coc_global_extensions = ['coc-python', 'coc-go', 'coc-syntax', 'coc-pairs', 'coc-emmet', 'coc-vimlsp', 'coc-css', 'coc-json', 'coc-snippets', 'coc-html', 'coc-tsserver', 'coc-yank', 'coc-word', 'coc-eslint', 'coc-bookmark', 'coc-todolist']
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=100
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-n>" :
      \ coc#refresh()
inoremap <expr><C-u> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> D :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
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
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nmap \ :CocCommand<cr>
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <Tab> <Plug>(coc-snippets-expand-jump)


" markdown "
let g:table_mode_corner = '|'
let g:table_mode_delimiter = ' '
let g:mkdp_path_to_chrome = "google-chrome-stable"
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
map <leader>s :MarkdownPreviewStop<CR>


" gruvbox "
colorscheme gruvbox

" 美化 "
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
"let g:rbpt_colorpairs = [
                        "\ ['brown',       'RoyalBlue3'],
                        "\ ['Darkblue',    'SeaGreen3'],
                        "\ ['darkgray',    'DarkOrchid3'],
                        "\ ['darkgreen',   'firebrick3'],
                        "\ ['darkcyan',    'RoyalBlue3'],
                        "\ ['darkred',     'SeaGreen3'],
                        "\ ['darkmagenta', 'DarkOrchid3'],
                        "\ ['brown',       'firebrick3'],
                        "\ ['gray',        'RoyalBlue3'],
                        "\ ['darkmagenta', 'DarkOrchid3'],
                        "\ ['Darkblue',    'firebrick3'],
                        "\ ['darkgreen',   'RoyalBlue3'],
                        "\ ['darkcyan',    'SeaGreen3'],
                        "\ ['darkred',     'DarkOrchid3'],
                        "\ ['red',         'firebrick3'],
                        "\ ]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
let s:colors = {
  \ 'brown'       : "905532",
  \ 'aqua'        : "3AFFDB",
  \ 'blue'        : "689FB6",
  \ 'darkBlue'    : "44788E",
  \ 'purple'      : "834F79",
  \ 'lightPurple' : "834F79",
  \ 'red'         : "AE403F",
  \ 'beige'       : "F5C06F",
  \ 'yellow'      : "F09F17",
  \ 'orange'      : "D4843E",
  \ 'darkOrange'  : "F16529",
  \ 'pink'        : "CB6F6F",
  \ 'salmon'      : "EE6E73",
  \ 'green'       : "8FAA54",
  \ 'lightGreen'  : "31B53E",
  \ 'white'       : "FFFFFF"
\ }

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
        :term python %
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
    endif
endfunc

" =====Function END====="



" =====settings===== "

inoremap <C-x> <C-x>s
inoremap <c-d> <C-\><C-n>:q<cr>

noremap +y "+y
noremap +p "+p
noremap <c-u> <c-i>
noremap cw z=

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let b:haveRemappedT=1
let s:oldmap=maparg('T', 'n')
let g:deus_termcolors=256
let g:neoterm_autoscroll=1
let $DOTVIM = expand('$HOME/.config/nvim')


language message zh_CN.UTF-8

set autoread
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.utf-8
set showtabline=2
set t_Co=256
set termguicolors
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set expandtab
set list
set smartcase
set updatetime=1
set autochdir
set lazyredraw
set shiftwidth=4
set tabstop=4
set listchars=tab:>-,trail:-
set mouse=a
set scrolloff=5
set backspace=2
set smartindent
set noswapfile
set modifiable
set textwidth=100
set expandtab
set autoindent
set background=dark

map W :w<CR>
map Q :q<CR>
map <leader>q :qa<CR>
map <leader>w :wa<CR>
map c+ <esc>/<++><CR>:noh<cr>v3lw
map c<left> <c-w>t<c-w>H
map c<right> <c-w>t<c-w>H
map c<up> <c-w>t<c-w>K
map c<down> <c-w>t<c-w>K
map cr <c-w>r
map . $
map r :call Run()<CR>
map <C-right> :set splitright<CR>:vsplit<CR>
map <C-left> :set nosplitright<CR>:vsplit<CR>
map <C-down> :set splitbelow<CR>:split<CR>
map <C-up> :set nosplitbelow<CR>:split<CR>
map <Leader><right> <C-w>l
map <Leader><up> <C-w>k
map <Leader><down> <C-w>j
map <leader><left> <C-w>h
"map <C-k> :res -5<CR>
"map <C-j> :res +5<CR>
"map <C-h> :vertical resize+5<CR>
"map <C-l> :vertical resize-5<CR>
map <C-t> :tabe<CR>
map <S-down> 5j
map <S-up> 5k
map <S-left> 5h
map <S-right> 5l
map <C-j> 5j
map <C-k> 5k
map <C-h> 5h
map <C-l> 5l
map <leader><cr> o<esc>
map te :set nonumber<cr>:set norelativenumber<cr>:term<cr>
map <leader>lg :tabe<cr>:set nonumber<cr>:set norelativenumber<cr>:term lazygit<cr>
map <leader>t :call OpenFloatingWin()<CR>
map <leader>rc :e ~/.config/nvim/init.vim<cr>
map py :sp<cr>:term ipython<cr>
map ; :
map / ?
map na 1
map ns 2
map nd 3
map nf 4
map ng 5
map nh 6
map nj 7
map nk 8
map nl 9
map R :e<cr>
map noh :set nohlsearch<cr>

nnoremap J :-tabnext<CR>
nnoremap K :+tabnext<CR>
nnoremap <leader><cr> o<esc>

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

autocmd TermOpen term://* startinsert 
autocmd BufReadPost * if line("'\"")>1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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

exec "nohlsearch"

silent !mkdir -p ~/.config/nvim/tmp/backup 
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

hi Normal guibg=NONE ctermbg=NONE

inoremap ++ <++>
" =====settings END===== "
