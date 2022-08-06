import os

home = os.path.expanduser("~")
firefox_dir = os.listdir(f"{home}/.mozilla/firefox")
dev_edition = [s for s in firefox_dir if ".dev-edition" in s][0]

required = [
    '"toolkit.legacyUserProfileCustomizations.stylesheets"',
    '"layers.acceleration.force-enabled"',
    '"gfx.webrender.all"',
]

prefs_js = f"{home}/.mozilla/firefox/{dev_edition}/prefs.js"
preferences = []

with open(prefs_js, "r") as reader:
    preferences = [
        line.replace("false", "true")
        if '("' in line and line.split('"')[1] in required
        else line
        for line in reader.readlines()
    ]

preferences.append(
    'user_pref("browser.startup.homepage", "https://jorgeterence.github.io/Bento/");'
)

with open(prefs_js, "w") as writer:
    writer.write("".join(preferences))
