import os
import subprocess

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])


mod = "mod4"
terminal = "kitty"

active = "#C192D1"
dimmed = "#2A2E3B"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html

    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    
    # Move windows
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset window sizes"),

    # Toggle window stacking.
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle window stacking"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Log out"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Apps
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Spawn app launcher"),
    Key([mod], "b", lazy.spawn("firefox-developer-edition"), desc="Spawn web browser"),
    Key([mod], "period", lazy.spawn("rofi -show emoji -modi emoji"), desc="Spawn emoji selector"),
]

groups = [
    Group("", matches=[Match(wm_class="kitty")]),
    Group("", matches=[Match(wm_class="code")]),
    Group("", matches=[Match(wm_class="firefoxdeveloperedition")]),
    Group(""),
    Group(""),
    Group(""),
    Group("漣"),
    Group(""),
]

for i, group in enumerate(groups, 1):
    keys.extend(
        [
            # Switch between groups
            Key([mod], str(i), lazy.group[group.name].toscreen(), desc=f"Switch to group {i}"),

            # Move window to group + switch to group
            Key([mod, "shift"], str(i), lazy.window.togroup(group.name, switch_group=True), desc=f"Switch to & move focused window to group {i}")
        ]
    )

layouts = [
    layout.Columns(border_on_single=True, border_focus="#777777", border_normal=dimmed, border_width=1, margin=15),
    layout.Max(),
    layout.Bsp(),
    layout.MonadTall(),
    layout.Tile(),
]

widget_defaults = {"font": "monospace", "fontsize": 14, "padding": 2}

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper_mode="fill",
        wallpaper="~/Pictures/wallpaper.png",
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="text",
                    this_current_screen_border=active,
                    active="#999999",
                    inactive=dimmed,
                    use_mouse_wheel=False,
                    padding=8
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Clock(format="%d-%m-%Y :: %H:%M"),
                widget.QuickExit(),
            ],
            30,
            background="#141217",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wl_input_rules = None
