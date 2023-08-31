alias ls='exa --group-directories-first'
alias la='exa -a'
alias lt="exa --tree -D -L 2 -I 'ache|log|logs|node_modules|vendor'"
alias ltt="exa --tree -D -L 3 -I 'ache|log|logs|node_modules|vendor'"
alias lttt="exa --tree -D -L 4 -I 'ache|log|logs|node_modules|vendor'"
alias ltttt="exa --tree -D -L 5 -I 'ache|log|logs|node_modules|vendor'"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
starship init fish | source
