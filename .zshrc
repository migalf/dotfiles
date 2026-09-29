# Starship
eval "$(starship init zsh)"

# Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="$PATH:$(npm config get prefix)/bin"

alias oo="cd $HOME/obsidian/murrayhill"

# Create new obsidian note
on() {
  if [[ -z "$1" ]]; then
    echo "Usage: on \"Note Title\""
    return 1
  fi

  local notes_dir="$HOME/obsidian/murrayhill/notes"
  local title="$*"
  local date_str=$(date +%Y-%m-%d)
  local filename="${date_str}_${title// /_}.md"
  local filepath="${notes_dir}/${filename}"

  mkdir -p "$notes_dir"

  if [[ -e "$filepath" ]]; then
    echo "Note already exists: $filepath"
    return 1
  fi

  touch "$filepath"
  nvim "$filepath"
}

