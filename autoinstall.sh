# Instead of updating the README.md with manual install steps,
# Put all the requirements in this script.
# Try to automate everything within reason.
# Things that can't be automated, make me do manually
# by ALWAYS ALWAYS ALWAYS checking for them in this script.
# In this way, I can make sure my setup is never out of sync.
if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew tap thoughtbot/formulae
  brew install rcm bash-completion neovim python3 ag
  brew postinstall python3
fi

local ExpectedList=("python3" "rcup" "nvim" "pip3" "ag")
local i
local good="1"
for i in "${ExpectedList[@]}"
do
  echo -n "Looking for $i... "
  if [ -x "$(command -v $i)" ]; then
    echo "FOUND"
  else
    good="0"
    echo "MISSING"
  fi
done

if [ $good != "1" ]; then
  echo
  echo "prompt-autoinstall script FAILURE"
  echo "Install missing apps before continuing."
  return
fi

rcup

echo "Installing pip3 module neovim... "
pip3 install neovim

echo -n "Checking liquidprompt... "
if ! [[ -d ~/liquidprompt/ ]]; then
  echo "Not installed. Installing..."
  git clone https://github.com/nojhan/liquidprompt.git ~/liquidprompt/
else
  echo "FOUND"
fi

if [[ $(uname -r) =~ Microsoft$ ]]; then
  echo "You are running Windows Subsystem for Linux (WSL)"
  echo "Autocorrecting git newline problems"
  git config --global core.autocrlf true
fi

echo -n "Checking plug... "
if ! [[ -f ~/.local/share/nvim/site/autoload/plug.vim ]]; then
  echo "Not set up. Installing..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo
  echo "Now, we need to install the neovim plugins."
  echo "This will open neovim."
  echo "When finished, quit with :q"
  echo
  echo "Press enter when ready"
  read
  nvim -c "PlugInstall"
else
  echo "FOUND"
fi

echo
echo "prompt-autoinstall script SUCCESS"
