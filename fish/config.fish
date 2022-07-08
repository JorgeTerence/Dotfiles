if status is-interactive

    # Environment variables    
    set -gx BROWSER 'firefox-developer-edition'
    set -gx EDITOR 'lite-xl'
    set -gx VISUAL 'code'
    set -gx TERM 'kitty'
    set -gx MICRO_TRUECOLOR 1

    # Aliases
    thefuck --alias | source 
    alias cls="clear"
    alias la="ls -la"
    alias py="python3"
    alias bpython="python3 -m bpython"
    alias bpy="python3 -m bpython"
    alias kon="rm -rf"

    # Remove greeting
    set fish_greeting

    # PATH
    set PATH -a $HOME/.cargo/bin
    set PATH -a $HOME/go/bin

    # Starship shell
    starship init fish | source
end
