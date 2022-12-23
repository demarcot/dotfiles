** TCD Dotfiles **
Link repo to default locations
`ln -s ~code/dotfiles/.config/nvim ~/.config/nvim`
`ln -s ~code/dotfiles/.zshrc ~/.zshrc`
*NOTE: This doesn't work for Windows, different linking commands need to be done in PowerShell. (I'll add those commands at some point)

This Neovim config uses Packer, install it from [here](https://github.com/wbthomason/packer.nvim)
Then run `:PackerSync`

For Telescope, prob want to install [rg](https://github.com/BurntSushi/ripgrep#installation)
