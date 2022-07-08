# Color scheme
git clone 'https://github.com/catppuccin/micro'
mkdir -p .config/micro/colorschemes
mv micro/src/* .config/micro/colorschemes
rm -rf micro

# Plugins
for plugin in fish go quoter "editorconfig":
    micro -plugin install $plugin
end
