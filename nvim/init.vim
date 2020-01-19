" Import plugins if they exist
if glob("~/.vim_plugins.vim")!=#""
  source ~/.vim_plugins.vim
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set laststatus=2
    set statusline=%!getcwd()

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
    " highlight the current line and column
    set cursorline
    set cursorcolumn
    " Bold and brighten current line
    hi CursorLine term=underline cterm=underline cterm=bold

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Whitespace and Indentation
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Display these special characters to show the presence of various whitespace
    " characters
    scriptencoding utf-8 " utf-8 encoding to enable these special chars
    "set listchars=eol:⏎,tab:␉·,nbsp:⎵
    set listchars=eol:$,tab:>.,nbsp:_
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
    if exists(':tnoremap')
      if has('nvim')
        set scrollback=10000
      elseif v:version >= 800
        set termwinscroll=10000
      endif
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
    nnoremap <Leader>tev :tabedit $MYVIMRC<CR>

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
  " Editing text
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    nnoremap <Leader>O  O<esc>j
    nnoremap <Leader>o  o<esc>k

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Buffer, window and tab management
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " List buffers and set up the command to switch to a different buffer
    nnoremap <leader>b :buffers<CR>:buffer<space>

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
    nnoremap <Leader>tmH  :tabmove 0<CR>
    nnoremap <Leader>tmh  :tabmove -1<CR>
    nnoremap <Leader>tml  :tabmove +1<CR>
    nnoremap <Leader>tmL  :tabmove <CR>
    nnoremap <Leader>tq   :tabclose<CR>
    nnoremap <Leader>te   :tabedit<Space>

    nnoremap <Leader>t;   :tabfirst<CR>
    nnoremap <Leader>tm;  :tabmove 0<CR>
    if exists(':tnoremap')
      " TODO: enable these mappings only if neoterm is installed
      nnoremap <Leader>tt  :tabnew \| tabmove 0 \| Tnew<CR>
      " else use this:
      "nnoremap <Leader>tt  :tabnew \| tabmove 0 \| terminal<CR>
    endif

    if !exists('g:lasttab')
      let g:lasttab = 1
    endif
    nmap <Leader>tp :exe "tabn ".g:lasttab<CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Utilities and System Information
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Print the current date and time
    nnoremap <Leader>'d :!date<CR>
    " Insert the current date and time at the cursor
    nnoremap <Leader>,d "=strftime('%c')<C-M>p<CR>
    vnoremap <Leader>,d "=strftime('%c')<C-M>p<CR>

    " Print the current working directory
    nnoremap <Leader>'p :pwd<CR>
    " Insert the current working directory at the cursor
    nnoremap <Leader>,p "=getcwd()<C-M>p<CR>
    vnoremap <Leader>,p "=getcwd()<C-M>p<CR>

    " Change directory to the path currently under the cursor, and place the
    " 'cd <path>' in the unnamed register to easily cd there in terminal mode
    " as well
    nnoremap <Leader>cd :let @@ = "cd <C-r><C-f>;" \| cd <C-r><C-f><CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Escape key
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Allow usage of Ctrl-[ instead of Esc
    vnoremap <C-[> <C-\><C-n>
    inoremap <C-[> <C-\><C-n>
    " Enforce double-Esc in terminal mode so Esc can be used for terminal shortcuts
    if exists(':tnoremap') && (has('nvim') || v:version >= 800)
      " Terminal mode only exists in Neovim or Vim 8+
      tnoremap <Esc><Esc> <C-\><C-n>
    endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Terminal mode
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Create a terminal buffer in a small window at the bottom of the current one
    if exists(':tnoremap')
      set splitbelow
      command! St :split | resize 15 | terminal
    endif

    " use neoterm plugin
    " TODO: enable these mappings only if neoterm is installed
    " Send a text object to terminal
    nmap gx  <Plug>(neoterm-repl-send)
    " Send selected contents to terminal in visual mode
    vmap gx  <Plug>(neoterm-repl-send)
    vmap <C-j>  <Plug>(neoterm-repl-send)
    " Send current line to terminal
    nmap gxx <Plug>(neoterm-repl-send-line)
    nmap gfx :TREPLSendFile<cr>

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

    "inoremap <BS> <nop>
    "inoremap <Del> <nop>
    "nnoremap <Del> <nop>
    " Train yourself not to hold j,k (and maybe even h,l)
    "noremap jj <nop>
    "noremap kk <nop>
    "noremap hh <nop>
    "noremap ll <nop>


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Writing, Editing, Quitting files - Shortcuts
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Shortucut to write files - can be overridden per-filetype (e.g.  markdown, latex)
    nmap <Leader>w :w<CR>
    nmap <Leader>q :q<CR>
    nmap <Leader>z <C-z>
    nmap <Leader>e :e<Space>

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
        autocmd FileType tex,latex,plaintex nnoremap <buffer> <Leader>w :w \| execute '!pdflatex % && ( evince %:r.pdf & )'<CR>
      else
        autocmd FileType tex,latex,plaintex nnoremap <buffer> <Leader>w :w \| !pdflatex %<CR>
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
