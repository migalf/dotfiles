# Neovim config switcher - add to your .zshrc
function nvims() {
  local items=("default")
  local dirs=$(find ~/.config -maxdepth 1 -name "nvim-*" -type d 2>/dev/null | xargs -n 1 basename)

  while IFS= read -r dir; do
    [[ -n "$dir" ]] && items+=("$dir")
  done <<<"$dirs"

  local selected=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config > " --height=30% --layout=reverse --border)

  if [[ -z "$selected" ]]; then
    echo "No config selected"
    return 0
  fi

  if [[ "$selected" == "default" ]]; then
    nvim "$@"
  else
    NVIM_APPNAME="$selected" nvim "$@"
  fi
}
