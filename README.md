# dotfiles

This repo contains my dot files and instructions on how I set them up.

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

## That's all
Read more about dotfiles and rcm at [dotfiles.github.io](https://dotfiles.github.io/)
