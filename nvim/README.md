# Neovim/Vim Configuration Files
## Installation
Steps:
1. Copy the `init.vim` to the correct location for either Neovim or Vim
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
```

### Vundle Plugin Manager
This is a mandatory prerequisite for usage of the this `init.vim`

Install Vundle:
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Then open vim/nvim and run the following to install all of the plugins that
are used by this `init.vim`:
```
:PluginInstall
```

### Themes and Appearance
#### Powerline
Install Powerline for slick bottom/top bars and fonts that are enabled in this `init.vim`.
The `vim-airline*` plugins and their configurations set in this `init.vim` require that
Powerline is installed, but vim will function fine without it (there will just be some
odd characters in the buffer and tab bars).

### Markdown Previewing
Markdown previewing is an optional feature, and it requires another application to perform
the actual previewing of the markdown file. The options supported by this `init.vim` file are
`haroopad`, `google-chrome` and `chromium-browser`.

#### Haroopad
The following steps were used on CentOS7 Fedora29:
```
$ wget https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.12.2_amd64.tar.gz
$ tar -zxvf haroopad-v0.12.2_amd64.tar.gz
$ tar -zxvf data.tar.gz
$ sudo cp -r ./usr /
$ tar zxf control.tar.gz
$ chmod 755 postinst
$ sudo ./postinst
```
The first time you open haroopad, click View->Mode->Viewer so that it will function only as a
Markdown preview tool, since Vim will of course be your editor.

#### Chrome
The other options for markdown viewing are google-chrome or chromium-browser, but you will
likely need to install a markdown-preview browser extension.

To use the syntastic plugin for Python syntax checking, install flake8:
  For Python2.7:
  ```
  $ sudo apt-get install python-flake8
  $ pip install --user flake8
  ```
  
  For Python3:
  ```
  $ sudo apt-get install python3-flake8
  $ pip3 install --user flake8
  ```
