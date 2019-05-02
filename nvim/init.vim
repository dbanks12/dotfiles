"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugin List and required settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim

  call vundle#begin()
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Let Vundle manage Vundle, required
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'VundleVim/Vundle.vim' " Plugin Manager

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Core Plugins
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'neomake/neomake' " Run commands & plugin operations asynchronously
                               " This is especially useful for linters
      Plugin 'tpope/vim-fugitive' " See git branch and other git info in bottom bar

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Navigation
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'kien/ctrlp.vim' " <C-p> for fuzzy-finding files - faster file jumping
      "Plugin 'matze/vim-move' " Move selected text in visual mode with <A-h/j/k/l>
      Plugin 'justinmk/vim-sneak' " Smart movement
      Plugin 'majutsushi/tagbar' " Browse tags and structure of current file

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Themes and Appearance
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'junegunn/seoul256.vim' " Vim colorscheme
      Plugin 'bling/vim-bufferline' " See list of buffers in the bottom bar
      Plugin 'vim-airline/vim-airline' " buffer and tab bar styles/themes
      Plugin 'vim-airline/vim-airline-themes'

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Whitespace
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace and
                                              " simplify stripping it
      Plugin 'godlygeek/tabular' " Align lines of text based on specified character

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Code completion and syntax checking
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'scrooloose/syntastic' " Syntax checker - uses above mentioned neomake
                                    " to check files asynchronously
      Plugin 'davidhalter/jedi-vim' " code completion using <C-p> in insert mode
                                    " and goto-definition (<leader>d), etc.
      Plugin 'SirVer/ultisnips'     " code snippet engine
      Plugin 'honza/vim-snippets'   " code snippets for various languages

      Plugin 'kergoth/vim-bitbake' " Syntax highlighting for bitbake (bb) files

    " All of your Plugins must be added before the following line
  call vundle#end()            " required

  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Command completion
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Command completion in vim. Emulate bash completion where tab tries to
    " find match and if one is found, it completes, but if >1 are found,
    " list the options out on multiple tab presses (via wildmenu)
    set wildmode=longest,list
    set wildmenu

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Window management
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " When a window is quit, do not automatically resize remaining windows to
    " equally share the screen
    set noequalalways

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Line number, line highlighting
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Show the line number on the left, and make it relative to the current line
    set number
    set relativenumber
    " Highlighting with the mouse acts as Vim visual mode selections
    set mouse=a
    " highlight the current line
    set cursorline
    " Bold and brighten current line
    hi CursorLine term=underline cterm=underline cterm=bold guibg=Grey40

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Whitespace and Indentation
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Display these special characters to show the presence of various whitespace
    " characters
    set listchars=eol:⏎,tab:␉·,nbsp:⎵
    set list

    " Indentation rules per file-type
    " Make requires actual tabs, so set noexpand tab and tell vim to display tabs
    " using 8 columns for makefiles
    autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
    " For most files, expand tab-presses to use actual spaces and use a width of 4 spaces
    autocmd FileType markdown,md,py,python,txt,log,text set expandtab shiftwidth=4 softtabstop=4
    autocmd FileType c,cpp,java,js,verilog,cc,bash,sh,tcl set expandtab shiftwidth=4 softtabstop=4
    " For most files, expand tab-presses to use actual spaces and use a width of 2 spaces
    autocmd FileType vhd,vhdl,vim,lua,nginx,html,css,xhtml,xml set expandtab shiftwidth=2 softtabstop=2

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Indentation and Folding
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Disable automatic indentation when certain characters are types
    set indentexpr=""

    " Allow function/code-block folding (zR, zM)
    set foldmethod=syntax
    " Do not auto fold code blocks on file-open
    set nofoldenable

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Terminal mode settings
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Set the terminal mode scrollback
    " Terminal mode only exists in Neovim or Vim 8+
    if has('nvim')
      set scrollback=10000
    elseif v:version >= 800
      set termwinscroll=10000
    endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Undo & file history
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Allow more undos. Also allow undos even after a file has been closed+opened
    set undolevels=1000
    set undofile " Maintain undo history between sessions
    set undodir=~/.config/nvim/undodir


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Opening files from
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Force Vim to jump to the last position when reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New commands/bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Allow semicolon to be used like colon as command prefix
  nnoremap ; :

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Leader key binding
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let mapleader = " "
    " I use spacebar for leader

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Dot files (.vimrc/init.vim, .bashrc)
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Edit or source vimrc
    nnoremap <Leader>ev :e $MYVIMRC<CR>
    nnoremap <Leader>sv :so $MYVIMRC<CR>
    " Edit vimrc in new tab
    nnoremap <Leader>evt :tabedit $MYVIMRC<CR>

    " Edit or source bashrc
    nnoremap <Leader>eb :e $HOME/.bashrc<CR>
    nnoremap <Leader>sb :!source $HOME/.bashrc<CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Copying and pasting
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Copy and paste to system clipboard
    nnoremap <Leader>y "+y
    vnoremap <Leader>y "+y
    nnoremap <Leader>Y "+Y
    nnoremap <Leader>p "+p
    vnoremap <Leader>p "+p
    nnoremap <Leader>P "+P
    vnoremap <Leader>P "+P

    " Paste most recently yanked text
    nnoremap <Leader><Leader>p "0p
    vnoremap <Leader><Leader>p "0p
    nnoremap <Leader><Leader>P "0P
    vnoremap <Leader><Leader>P "0P

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Window and tab management
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Vertically expand/minimize current window
    nnoremap <Leader>+ <C-w>50+
    nnoremap <Leader>= <C-w>50+
    nnoremap <Leader>- <C-w>50-

    " Navigate and move tabs more easily
    nnoremap <Leader>tH   :tabfirst<CR>
    nnoremap <Leader>th   :tabprev<CR>
    nnoremap <Leader>tl   :tabnext<CR>
    nnoremap <Leader>tL   :tablast<CR>
    nnoremap <Leader>tn   :tabnew<CR>
    nnoremap <Leader>ttH  :tabmove 0<CR>
    nnoremap <Leader>tth  :tabmove -1<CR>
    nnoremap <Leader>ttl  :tabmove +1<CR>
    nnoremap <Leader>ttL  :tabmove <CR>
    nnoremap <Leader>tq   :tabclose<CR>
    nnoremap <Leader>ttt  :tabnew \| terminal<CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Utilities and System Information
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Get the current date and time
    nnoremap <Leader>'d :!date<CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Escape key
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Allow usage of Ctrl-[ instead of Esc
    vnoremap <C-[> <C-\><C-n>
    inoremap <C-[> <C-\><C-n>
    " Enforce double-Esc in terminal mode so Esc can be used for terminal shortcuts
    if has('nvim') || v:version >= 800
      " Terminal mode only exists in Neovim or Vim 8+
      tnoremap <Esc><Esc> <C-\><C-n>
    endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Terminal mode
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Create a terminal buffer in a small window at the bottom of the current one
    set splitbelow
    command! St :split | resize 15 | terminal

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Navigation
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Remap Ctrl-h/l to soft-start or end of line
    noremap <silent> <C-l> $
    noremap <silent> <C-h> :call FirstCharOrFirstCol()<cr>

    " Go to the first non-whitespace character of the line.
    " If already there, go to the true start of the line.
    function! FirstCharOrFirstCol()
        let current_col = virtcol('.')
        normal ^
        let first_char = virtcol('.')
        if current_col <= first_char
            normal 0
        endif
    endfunction<Paste>

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Arrow keys
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Disable arrow keys and force usage of 'hjkl' (uncomment to disable the keys)
    "nnoremap <Left> :echo "No left for you!"<CR>
    "vnoremap <Left> :<C-u>echo "No left for you!"<CR>
    "inoremap <Left> <C-o>:echo "No left for you!"<CR>
    "nnoremap <Right> :echo "No right for you!"<CR>
    "vnoremap <Right> :<C-u>echo "No right for you!"<CR>
    "inoremap <Right> <C-o>:echo "No right for you!"<CR>
    "nnoremap <Up> :echo "No up for you!"<CR>
    "vnoremap <Up> :<C-u>echo "No up for you!"<CR>
    "inoremap <Up> <C-o>:echo "No up for you!"<CR>
    "nnoremap <Down> :echo "No down for you!"<CR>
    "vnoremap <Down> :<C-u>echo "No down for you!"<CR>
    "inoremap <Down> <C-o>:echo "No down for you!"<CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Writing files
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Shortucut to write files - can be overridden per-filetype (e.g.  markdown, latex)
    nmap <Leader>w :w<CR>

    " :W to sudo write a file even if the user does not have write-permissions
    " This is useful when changes were made without realizing the file should've
    " been opened with sudo
    command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Markdown & Latex
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " <Leader>w writes and compiles a file (if applicable), and then displays the results

    if executable('pdflatex')
      " LaTeX: write file, compile with pdflatex
      if executable('evince')
        " Show PDF results in evince if evince is installed
        autocmd FileType tex,latex nnoremap <buffer> <Leader>w :w \| !pdflatex % \| !evince %:r.pdf &<CR>
      else
        autocmd FileType tex,latex nnoremap <buffer> <Leader>w :w \| !pdflatex %<CR>
      endif
    endif

    " Markdown: write file and display with haroopad, google-chrome, chromium-browser
    if executable('haroopad')
      autocmd FileType markdown nnoremap <buffer> <Leader>w :w \| !haroopad % &<CR>
    elseif executable('google-chrome')
      " If haroopad is not installed, use google-chrome
      autocmd FileType markdown nnoremap <buffer> <Leader>w :w \| !google-chrome % &<CR>
    elseif executable('chromium-browser')
      " Fall back on chromium-browser
      autocmd FileType markdown nnoremap <buffer> <Leader>w :w \| !chromium-browser % &<CR>
    elseif executable('chromium-browser')
    else
      autocmd FileType markdown nnoremap <buffer> <Leader>w :w \| echo "Install haroopad or google-chrome to preview Markdown"<CR>
    endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuratons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Note: Many of these are recommended plugin configurations from github

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " seoul256.vim
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    colorscheme seoul256
    " Switch (default: dark)
    "set background=light

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " vim-airline, vim-airline-themes
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Themes using airline+powerline for bottom bar and tagbar
    let g:airline_theme='zenburn'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " vim-better-whitespace
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Highlight trailing whitespace in red: 
    highlight ExtraWhitespace ctermbg=red

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " syntastic
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers = ['flake8']

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " vim-bufferline
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:bufferline_echo = 1
    " Put an asterisk next to files in bufferline that have unwritten changes
    let g:bufferline_modified = '*'
    let g:bufferline_show_bufnr = 1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " completor.vim
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:completor_clang_binary = '/usr/bin/clang'
    let g:completor_auto_trigger = 0

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " jedi-vim
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "let g:loaded_python_provider=1
    if has('python3')
      let g:jedi#force_py_version = 3
    endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " vim-sneak
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:sneak#label = 1

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " tagbar
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Open Tagbar on the right
    command! Tg TagbarOpenAutoClose
 
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ultisnips
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:ultisnipsjumpforwardtrigger="<tab>"
    let g:ultisnipsjumpbackwardtrigger="<s-tab>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
