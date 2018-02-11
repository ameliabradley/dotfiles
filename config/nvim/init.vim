" 
" NOTE: Read through for installation instructions
" Only compatible with neovim
" :PlugInstall first time neovim is started up
"
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-github-dashboard'

" Adds Asynchronous autocomplete
" Required python3 to be installed
" Must run :UpdateRemotePlugins on first launch
" Ctrl-N / Ctrl-P for next / previous autocomplete items
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Provides real-time error handling and gutter
" Also provides the best prettier formatting (:ALEFix prettier)
Plug 'w0rp/ale'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fix_on_save = 1

" Add typescript engine
" Must run `yarn global install typescript`
Plug 'mhartington/nvim-typescript'
map <C-]> :TSDefPreview<CR>

" Add typescript syntax highlighting
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

" Adds Prettier plugin
" Trigger with :Neoformat prettier
" (Prefer the ale formatter for JS, as it respect prettier configs)
Plug 'sbdchd/neoformat'

" Adds CTRL-p search for files
Plug 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra' " Default directory to search from
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

" If a file is already open, open it again in a new pane instead of switching to the existing pane
let g:ctrlp_switch_buffer = 'et'

" The Silver Searcher
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" Load NERDTree only when explicitly toggled
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Add much better support for tmux
Plug 'christoomey/vim-tmux-navigator'
nmap <bs> :<c-u>TmuxNavigateLeft<cr>

" Enable project-specific ".nvimrc" files
set exrc

" Don't run insecure commands in vimrc unless owned by me
set secure

call plug#end()

set sts=2 ts=2 sw=2 et ai
