alias cat='bat'
alias ls='exa --group-directories-first --icons'
alias la='exa -a --icons'
alias lt="exa --tree -D -L 2 -I 'ache|log|logs|node_modules|vendor' --icons"
alias ltt="exa --tree -D -L 3 -I 'ache|log|logs|node_modules|vendor' --icons" 
alias lttt="exa --tree -D -L 4 -I 'ache|log|logs|node_modules|vendor' --icons"
alias ltttt="exa --tree -D -L 5 -I 'ache|log|logs|node_modules|vendor' --icons"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function starship_transient_prompt_func
  starship module character
end

set VISUAL lvim
set EDITOR lvim
set fish_greeting
set -Ux ANDROID_HOME $HOME/Android/Sdk

starship init fish | source
enable_transience
