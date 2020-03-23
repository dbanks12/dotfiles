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
      Plugin 'kassio/neoterm' " Wrapper and utilities for neovim terminal

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Navigation
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'kien/ctrlp.vim' " <C-p> for fuzzy-finding files - faster file jumping
      "Plugin 'matze/vim-move' " Move selected text in visual mode with <A-h/j/k/l>
      Plugin 'justinmk/vim-sneak' " Smart movement
      Plugin 'majutsushi/tagbar' " Browse tags and structure of current file
      Plugin 'psliwka/vim-smoothie' " smooth scrolling

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

      Plugin 'kergoth/vim-bitbake'  " Syntax highlighting for bitbake (bb) files
      "Plugin 'suoto/vim-hdl'        " Syntax highlighting for VHDL

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Note taking
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      "Plugin 'vimwiki/vimwiki'      " Note taking tool
      Plugin 'junegunn/goyo.vim'    " Center text in page and get in the writing zone

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Utilities and System Info
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      Plugin 'itchyny/calendar.vim'

    " All of your Plugins must be added before the following line
  call vundle#end()            " required

  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on


  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Appearance/theme
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Unlike other plugin configurations which are at the end of this file,
    " the theme plug is configured here so that other configurations (cursor line
    " highlighting, background transparency) can override some of this theme's
    " defaults
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " seoul256.vim
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      colorscheme seoul256
      " Switch (default: dark)
      "set background=light

    " Override theme background and make it transparent
    hi Normal guibg=NONE ctermbg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuratons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Note: Many of these are recommended plugin configurations from github

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
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers = ['flake8']

    " leader command+function to toggle syntastic window (location list for errors)
      noremap <leader>sy <ESC>:call SyntasticToggle()<CR>

      let g:syntastic_is_open = 0
      function! SyntasticToggle()
      if g:syntastic_is_open == 1
          lclose
          let g:syntastic_is_open = 0
      else
          Errors
          let g:syntastic_is_open = 1
      endif
      endfunction


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

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " calendar
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
