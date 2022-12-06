#!/usr/bin/fish

# First steps
sudo pacman -S base-devel yay --noconfirm
yay -S --needed --noconfirm $(cat pkglist.txt)
pip install yt-dlp black black[jupyter] bpython numpy pandas requests matplotlib

# Firefox stuff
# mkdir -p .mozilla/firefox/*default-release/chrome
# cp Dotfiles/.config/firefox/userStyle.css .mozilla/firefox/*default-release/chrome

# Set fish as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s $(which fish)

# Starship
curl -sS https://starship.rs/install.sh | sh

# Micro plugins
for plugin in "fish" "quoter" "editorconfig"
    micro -plugin install $plugin
end

# Install fonts
./.config/fonts/install.fish

# Firefox config
# ./.config/firefox/setup.py
