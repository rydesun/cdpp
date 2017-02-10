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

  for i in ${key[@]}; do
    cpath=${cpath%/*}
    if [[ -z "$cpath" ]]; then
      break
    fi
    idpath[$i]=$cpath
  done

  cols=$(tput cols)
  leftlen=0
  idn=$(( ${#idpath[@]} - 1 ))
  idy=0

while (( $leftlen <= ${#PWD} )); do
  echo ${PWD:$leftlen:$cols}
  leftlen=$(( leftlen + cols ))
  while (( idn >= 0 )); do
    id=${key[idn]}
    idx=$(( ${#idpath[$id]} - idy * cols ))
    (( idx <= cols && idx >= 0 )) || break
    tput hpa $idx
    printf "\e[1;31m$id\e[0m"
    (( idn-- ))
  done
  (( idy++ ))
  echo
done

  read -s -n 1 id
  case ${!idpath[@]} in
    *$id*)
      eval cd ${idpath[$id]};;
  esac
}

alias c=cdpp
