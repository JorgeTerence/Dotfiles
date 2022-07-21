if status is-interactive

    # Environment variables    
    set -gx BROWSER 'firefox-developer-edition'
    set -gx EDITOR 'micro'
    set -gx VISUAL 'code'
    set -gx TERM 'kitty'
    set -gx MICRO_TRUECOLOR 1

    # Aliases
    thefuck --alias | source 
    alias cls="clear"
    alias py="python3"
    alias bpython="py -m bpython"
    alias bpy="bpython"
    alias kon="rm -rf"
    alias exa="exa -l --no-user --no-time --group-directories-first"

    # Remove greeting
    set fish_greeting

    # PATH
    set -a PATH $HOME/.cargo/bin
    set -a PATH $HOME/go/bin
    set -a PATH $HOME/anaconda3/bin

    # Starship shell
    starship init fish | source
end
