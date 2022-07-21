# Install packages from pacman, AUR, PyPi, Flathub
yay -S --needed $(cat pkglist.txt)
flatpak install $(cat flatpaks.txt)
pip install yt-dlp bpython

# Set FISH as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s $(which fish)

# FISH Catppuccin theme
curl -fLso ~/.config/fish/conf.d/frappe.fish 'https://raw.githubusercontent.com/catppuccin/fish/main/conf.d/frappe.fish'
source ~/.config/config.fish

# Kitty Catppuccin theme
mkdir -p ~/.config/kitty/themes
curl -fLso ~/.config/kitty/themes/frappe.conf 'https://raw.githubusercontent.com/catppuccin/kitty/main/frappe.conf'
kitty +kitten themes --reload-in=all Catppuccin-Frappe

# VSCode extensions
for ext in $(cat vscode/extensions.txt)
    code --install-extension $ext
end

# Micro Catppuccin theme
git clone 'https://github.com/catppuccin/micro'
mkdir -p .config/micro/colorschemes
mv micro/src/* .config/micro/colorschemes
rm -rf micro

# Micro plugins
for plugin in "fish" "go" "quoter" "editorconfig"
    micro -plugin install $plugin
end

# SimpleFox Userstyle for Firefox Developer Edition
git clone 'https://github.com/migueravila/SimpleFox'
mv SimpleFox/chrome/* ~/.mozilla/firefox/*.dev*/chrome
rm -rf SimpleFox
