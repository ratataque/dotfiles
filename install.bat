echo "installation tah les fou ..."

rm -rf ~/.config/starship.toml
rm -rf ~/.config/tmux/tmux.conf
rm -rf ~/.config/nvim/lua/
rm -rf ~/.config/fish/

ln -s ~/projects/dotfiles/.config/nvim/lua/ ~/.config/nvim/
ln -s ~/projects/dotfiles/.config/tmux/tmux.conf ~/.config/tmux/
ln -s ~/projects/dotfiles/.config/fish/ ~/.config/
ln -s ~/projects/dotfiles/.config/starship.toml ~/.config/

echo "finito"
