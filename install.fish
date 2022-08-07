#!/usr/bin/fish

# Install packages from pacman, AUR, PyPi, Flathub
yay -S --needed --noconfirm $(cat pkglist.txt)
flatpak install $(cat flatpaks.txt)
pip install yt-dlp black black[jupyter] bpython numpy pandas requests matplotlib

# Set fish as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells # NEED CONFIRMATION
chsh -s $(which fish)

# Fish theme
git clone 'https://github.com/catppuccin/fish'
mv fish/conf.d/frappe.fish ~/.config/fish/conf.d
rm -rf fish
source ~/.config/fish/config.fish

# Kitty theme
kitty +kitten themes --reload-in=all Catppuccin-Frappe

# VSCode extensions
for ext in $(cat .config/vscode/extensions.txt)
    code --install-extension $ext
end

# Micro theme
git clone 'https://github.com/catppuccin/micro'
mkdir -p ~/.config/micro/colorschemes
mv micro/src/* ~/.config/micro/colorschemes
rm -rf micro

# Micro plugins
for plugin in "fish" "go" "quoter" "editorconfig"
    micro -plugin install $plugin
end

# SimpleFox
git clone 'https://github.com/migueravila/SimpleFox'
mv SimpleFox/chrome/* ~/.mozilla/firefox/*.dev*/chrome
rm -rf SimpleFox

# Install fonts
./.config/fonts/install.fish

# Firefox config
./.config/firefox/setup.py
