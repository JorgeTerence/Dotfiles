# Functions

function hyphenize
    echo $(string lower $argv | string replace ' ' '-')
end

function url
    echo $(string replace -a " " "%20" $argv)
end

# Regular Fonts

set fonts $(cat ~/dotfiles/fonts/fontlist.txt)

mkdir -p ~/.fonts
cd ~/.fonts

for font in $fonts
    set query $(hyphenize $font)
    echo "Downloading $font"
    curl -fLso "$query.zip" "https://www.fontsquirrel.com/fonts/download/$query"
end

echo "Finished first download\n"

for archive in $(ls | grep '.zip')
    echo "Extracting $archive"
    unzip -qo $archive
end

echo "\nCleaning up"

rm -f *.zip *.txt

# Nerd Font

set repo ryanoasis/nerd-fonts/raw/master/patched-fonts
set nerdfont "Fira Code"

for weight in Light Regular Retina Medium SemiBold Bold
    set fontjoin $(string replace ' ' '' $nerdfont)
    set fullname "$nerdfont $weight Nerd Font Complete.ttf"

    echo "Downloading $nerdfont $weight"
    curl -fLso "$fullname" $(url "https://github.com/$repo/$fontjoin/$weight/complete/$fullname")
end
