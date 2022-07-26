if status is-interactive

    # Environment variables    
    set -gx BROWSER 'firefox'
    set -gx EDITOR 'micro'
    set -gx VISUAL 'code'
    set -gx TERM 'alacritty'
    set -gx MICRO_TRUECOLOR 1

    # Aliases
    alias cls="clear"
    alias py="python3"
    alias bpython="py -m bpython"
    alias bpy="bpython"
    alias kon="rm -rf"
    alias exa="exa -la --no-user --no-time --group-directories-first"

    # Remove greeting
    set fish_greeting

    # PATH
    set -a PATH $HOME/.cargo/bin
    set -a PATH $HOME/go/bin

    # Starship shell
    starship init fish | source
end
