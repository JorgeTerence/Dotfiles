# Before anything: Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

echo "installing scoop"
irm get.scoop.sh | iex

scoop install git

echo "updating scoop repository"
scoop bucket add extras games nerd-fonts versions java

echo "installing scoop packages"
cat scoop-packages.txt | scoop install

echo "installing nodejs"
winget install Schniz.fnm
fnm install 22

echo "installing bun"
irm bun.sh/install.ps1 | iex
