_path_prepend() {
  [[ -d "$1" ]] || return 0
  case ":$PATH:" in
    *":$1:"*) return 0 ;;
  esac
  path=("$1" $path)
}

_path_append() {
  [[ -d "$1" ]] || return 0
  case ":$PATH:" in
    *":$1:"*) return 0 ;;
  esac
  path+=("$1")
}
