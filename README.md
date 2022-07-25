# Jorge Terence's Dotfiles

_This projects uses [dotbot](https://github.com/anishathalye/dotbot)_

## Setup

```sh
git clone https://github.com/JorgeTerence/dotfiles
cd dotfiles

pip install dotbot
dotbot -c install.conf.yaml
```

## Firefox customization

Go to `about:config` or in the URL bar or edit `~/.mozilla/firefox/*.dev*/prefs.js` and set to `true`:
- `toolkit.legacyUserProfileCustomizations.stylesheets`
- `layers.acceleration.force-enabled`
- `gfx.webrender.all`

Should I do a script for this?
