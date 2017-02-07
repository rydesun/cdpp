cdpp() {
  if [[ ${PWD//[^\/]} = '/' ]]; then
    echo 'Please use "cd /"'
    return
  fi

  ## change to your favorite shortcuts, for example:
  #local key=({1..9})
  local key=(l k j f d s a)

  local cpath=$PWD
  declare -A idpath
  echo "$PWD"
  for i in ${key[@]}; do
    cpath=${cpath%/*}
    if [[ -z "$cpath" ]]; then
      break
    fi
    idpath[$i]=$cpath
    tput hpa ${#cpath}
    printf "\e[1;31m$i\e[0m"
  done
  echo

  read -s -n 1 id
  case ${!idpath[@]} in
    *$id*)
      eval cd ${idpath[$id]};;
  esac
}

alias c=cdpp
