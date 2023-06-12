# Introduction
This is the config I use on my own personal computer and is very keyboard oriented.
Since Ubuntu is the distro I tend to use the most, the commands are adapted to it.
It should not be too difficult to adapt them to Arch distros.

*This is still a work in progress, I am planning to add some screenshots and tmux configs*

## Basic setup
The main tools I use for my workflow are `nvim`, `i3` and `kitty`.

# First steps after installing Ubuntu
## Install main utilities

```bash
sudo apt update && sudo apt upgrade 
sudo apt install curl git blueman keepassxc kitty zsh dmenu
sudo snap install brave
sudo snap install --beta nvim --classic
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Some zsh shaenanigans
First, install the infamous Oh My Zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Then install starship (you will need a nerd font enabled on `kitty`, I for one like `FireCode`) and some omz plugins
```bash
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> .config/zsh/config  # An external file that will be sourced at the end of .zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Make some defaults
    - Make `kitty` the default terminal emulator `sudo update-alternatives --config x-terminal-emulator`
    - Make `vi` the default terminal editor `sudo update-alternatives --config editor`
    - Make `zsh` the default shell `chsh -s $(which zsh)`

## Install programming stuff
```bash
sudo apt install python-is-python3 pip
curl -sSL https://install.python-poetry.org | python3 -
sudo apt install nodejs npm
curl https://sh.rustup.rs -sSf | sh
```

## Install nice rust utilities
```bash
sudo apt install bat exa ripgrep fd-find zoxide
echo 'eval "$(zoxide init zsh)"' >> $HOME/.config/zsh/config
sudo snap install procs
cargo install du-dust
cargo install broot
cargo install tokei
cargo install tealdeer && tldr --update
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.7.1/bottom_0.7.1_amd64.deb && sudo dpkg -i bottom_0.7.1_amd64.deb
```

## Install i3
```bash
sudo apt install i3
mkdir $HOME/.config/i3status
cp /etc/i3status.conf $HOME/.config/i3status/config
```

# Configuring

Now that we're done installing stuff, we can go to the configuration part.
I would first recommend that you create a `~/.config/nvim/init.lua` containing just `use 'wbthomason/packer.nvim'`, source it with `:so` and run `PackerSync` to confirm it works correctly (this file will be overwritten later on)
Now you may use my `.dotfiles` git bare repo to start with my configs

Tip: Remap caps lock key to escape, as modal editor users, we need escape a lot more than we need that very strange keym and it's much closer than the actual escape key.
