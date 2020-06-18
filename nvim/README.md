# Neovim/Vim Configuration Files
## Installation
Steps (further explained below):
1. Copy the `init.vim` file to the correct location for either Neovim or Vim
2. Install Vundle Plugin Manager and Vim plugins
3. Follow optional installation steps as desired

### Neovim (RECOMMENDED)
```
git clone
mkdir -p ~/.config/nvim/
cp dotfiles/nvim/init.vim ~/.config/nvim/init.vim
```
### Vim
```
git clone
cp dotfiles/vim/init.vim ~/.vimrc
cp dotfiles/vim/.vim_plugins.vim ~/
```

### Vundle Plugin Manager
This is a mandatory prerequisite for usage of the this `init.vim`.

Install Vundle:
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Then open vim/nvim and run the following to install all of the plugins that
are used by this `init.vim`:
```
:PluginInstall
```
(Or from the command-line: `nvim -c ":PluginInstall"` or `vim -c ":PluginInstall"`)

### Themes and Appearance
#### Powerline
Install Powerline for slick bottom/top bars and fonts that are enabled in this `init.vim`.
The `vim-airline*` plugins and their configurations set in this `init.vim` require that
Powerline is installed, but vim will function fine without it (there will just be some
odd characters in the buffer and tab bars). Consult [Powerline - Installation on Linux](https://powerline.readthedocs.io/en/latest/installation/linux.html) and [Powerline Fonts](https://github.com/powerline/fonts) for the most up-to-date installation instructions. A summary is here for convenience but may be out of date:
```
pip install --user powerline-status
```
To install the fonts, do one of the following:

Debian/Ubuntu:
```
sudo apt-get install fonts-powerline
```
Fedora:
```
sudo dnf install powerline-fonts
```
Other:
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

### Markdown Viewing
Markdown viewing is an optional feature, and it requires another application to perform
the actual viewing of the markdown file. The options supported by this `init.vim` file are
`haroopad`, `google-chrome` and `chromium-browser`.

#### Haroopad
The following steps were used on CentOS7 and Fedora29:
```
wget https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.12.2_amd64.tar.gz
tar -zxvf haroopad-v0.12.2_amd64.tar.gz
tar -zxvf data.tar.gz
sudo cp -r ./usr /
tar zxf control.tar.gz
chmod 755 postinst
sudo ./postinst
```
The first time you open haroopad, click View->Mode->Viewer so that it will function only as a
Markdown preview tool, since Vim will of course be your editor.

#### Chrome
The other options for viewing markdown are `google-chrome` or `chromium-browser`, but you will
likely need to install a markdown-preview browser extension.

### Syntastic - Syntax Checker/Linter Installation
More information on Syntastic's usage, see [Syntastic](https://github.com/scrooloose/syntastic).
To use the syntastic plugin for Python syntax checking, install the `flake8` linter:

  For Python2.7:
  ```
  sudo apt-get install python-flake8
  pip install --user flake8
  ```
  
  For Python3:
  ```
  sudo apt-get install python3-flake8
  pip3 install --user flake8
  ```
## Vim Plugins
* [Vundle.vim](https://github.com/VundleVim/Vundle.vim)                      : Plugin Manager
* [neomake](https://github.com/neomake/neomake)                              : Run commands & plugin operations asynchronously
* [vim-fugitive](https://github.com/tpope/vim-fugitive)                      : See git branch and other git info in bottom bar
* [ctrlp.vim](https://github.com/kien/ctrlp.vim)                             : <C-p> for fuzzy-finding files - faster file jumping
* [vim-move](https://github.com/matze/vim-move)                              : Move selected text in visual mode with <A-h/j/k/l>
* [vim-sneak](https://github.com/justinmk/vim-sneak)                         : Smart movement
* [tagbar](https://github.com/majutsushi/tagbar)                             : Browse tags and structure of current file
* [seoul256.vim](https://github.com/junegunn/seoul256.vim)                   : Vim colorscheme
* [vim-bufferline](https://github.com/bling/vim-bufferline)                  : See list of buffers in the bottom bar
* [vim-airline](https://github.com/vim-airline/vim-airline)                  : buffer and tab bar styles/themes
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace) : Highlight trailing whitespace and simplify stripping it
* [tabular](https://github.com/godlygeek/tabular)                            : Align lines of text based on specified character
* [syntastic](https://github.com/scrooloose/syntastic)                       : Syntax checker - uses above mentioned neomake
* [jedi-vim](https://github.com/davidhalter/jedi-vim)                        : code completion using <C-p> in insert mode
* [ultisnips](https://github.com/SirVer/ultisnips)                           : code snippet engine
* [vim-snippets](https://github.com/honza/vim-snippets)                      : code snippets for various languages
* [vim-bitbake](https://github.com/kergoth/vim-bitbake)                      : Syntax highlighting for bitbake (bb) files
