# If this is NOT an interactive shell (such as script or scp)
if ! [[ $- = *i* ]]; then
  # Don't bother. At all.
  return 1;
fi

# Enable terminal colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export HISTSIZE="GOTCHA"

# Other useful commands
alias ll="ls -la"
alias s="source ~/.bash_profile"

source ~/.bashrc

if [ -x "$(command -v nvim)" ]; then
  # So long and thanks for all the fish
  alias vim="nvim"
else
  echo "Neovim NOT installed! You should install neovim!"
fi

if [ -x "$(command -v docker)" ]; then
  alias dcu="docker-compose up -d"
  alias dcs="docker-compose stop"
fi

BASH_COMPLETION=/usr/share/bash-completion/bash_completion
if [[ "$OSTYPE" == "darwin"* ]]; then
  # I decided it doesn't make sense to reinstall this SDK outside of Android studio
  export ANDROID_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"

  if [ -x "$(command -v brew)" ]; then
    BASH_COMPLETION=$(brew --prefix)/etc/bash_completion
  else
    echo "brew is not installed"
  fi
fi

if [[ -f "$BASH_COMPLETION" ]]; then
  . "$BASH_COMPLETION"

  # Add GIT autocompletion in bash
  source ~/.git-completion.bash
else
  echo "Bash completion is not installed"
fi

# Map my computer names to super cool emoji
case `hostname` in
  MBLPPXNG8WL.local)
    export COMPUTER_TAG="🌶  ";;
  avocado)
    export COMPUTER_TAG="🥑  ";;
  *)
    export COMPUTER_TAG="`hostname` ";;
esac

# Fix strange errors that pop up when our locale is not set
# See: https://stackoverflow.com/questions/7165108/in-os-x-lion-lang-is-not-set-to-utf-8-how-to-fix-it
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"

# Backup prompt in case I want to run `prompt_off` and disable liquid prompt
export PS1="${COMPUTER_TAG}"

# Liquid prompt: Hide the username unless I'm another user
export LP_USER_ALWAYS=0

# Liquid prompt: Special variables
LP_PS1_PREFIX="\n"
LP_PS1_POSTFIX="\n${COMPUTER_TAG}"

source ~/liquidprompt/liquidprompt
