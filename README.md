# dotfiles

This repo contains my dot files, useful configurations, and instructions on how these work.

## Usage

Uses [rcm](https://github.com/thoughtbot/rcm) to sync files from the `~/.dotfiles` directory.

Add a file or directory to be synced using `mkrc [filename]`

For instance, `mkrc ~/.bash_profile`

This places it in `~/.dotfiles`, which can be tracked in a repo.

If files in `~/.dotfiles` have changed, they can be installed on your system with `rcup`

## Installation

Install [rcm](https://github.com/thoughtbot/rcm)

```
brew tap thoughtbot/formulae
brew install rcm
```

Install dotfiles
```
env RCRC=$HOME/dotfiles/rcrc rcup
```

Checkout this repo to dotfiles
```
git clone https://github.com/leebradley/dotfiles ~/.dotfiles
```

Install [liquidprompt](https://github.com/nojhan/liquidprompt)
```
git clone https://github.com/nojhan/liquidprompt.git ~/liquidprompt/
```

### VIM bundles

All vim bundles are installed using [Pathogen](https://github.com/tpope/vim-pathogen). Pathogen creates GIT repositories inside this repository's `.vim/bundles` directory. Bundles are listed here, but they must be installed manually.

Install [vim-powerline](https://github.com/Lokaltog/vim-powerline)
```
git clone https://github.com/Lokaltog/vim-powerline ~/.vim/bundle/vim-powerline
```

### Windows Subsystem for Linux

Make sure to change how Git handles line endings
```
git config --global core.autocrlf true
```

### iTerm2

1. Install iTerm2
2. Open `Preferences`
3. In the `General` tab, check `Load preferences from a custom folder or URL`
4. Set to `~/.iterm_profile` (You might have to press `CMD-G` at the file selector to type this in manually)

## That's all
Read more about dotfiles and rcm at [dotfiles.github.io](https://dotfiles.github.io/)
