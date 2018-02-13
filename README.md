# dotfiles

This repo contains my dot files, useful configurations, and instructions on how these work.

## Usage

Uses [rcm](https://github.com/thoughtbot/rcm) to sync files from the `~/.dotfiles` directory.

Add a file or directory to be synced using `mkrc [filename]`

For instance, `mkrc ~/.bash_profile`

This places it in `~/.dotfiles`, which can be tracked in a repo.

If files in `~/.dotfiles` have changed, they can be installed on your system with `rcup`

## Installation

Easy peasy:
```
git clone https://github.com/leebradley/dotfiles ~/.dotfiles; \
 . ~/.dotfiles/autoinstall.sh; \
 echo "source ~/.bashrc.common" >> ~/.bashrc
```

Optionally install [FiraCode](https://github.com/tonsky/FiraCode) font. On linux:
```
sudo apt install fonts-firacode
```

### VIM bundles

All vim bundles are managed with [Plug](https://github.com/junegunn/vim-plug) in `~/.config/nvim/init.vim`

### iTerm2

1. Install iTerm2
2. Open `Preferences`
3. In the `General` tab, check `Load preferences from a custom folder or URL`
4. Set to `~/.iterm_profile` (You might have to press `CMD-G` at the file selector to type this in manually)

## That's all
Read more about dotfiles and rcm at [dotfiles.github.io](https://dotfiles.github.io/)
