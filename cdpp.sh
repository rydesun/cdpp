cdpp() {
  if [[ ${PWD//[^\/]} = '/' ]]; then
    echo 'Please use "cd /"'
    return
  fi

  ## change to your favorite shortcuts, for example:
  #local key=({1..9})
  local key=(l k j f d s a)

  while :; do
    local cpath=$PWD
    [[ $cpath =~ ^$HOME ]] && cpath=${cpath/$HOME/'~'}
    unset idpath
    declare -A idpath

    for i in ${key[@]}; do
      cpath=${cpath%/*}
      if [[ -z "$cpath" ]]; then
        break
      fi
      idpath[$i]=$cpath
    done

    local cols=$(tput cols)
    local leftlen=0
    local idn=$(( ${#idpath[@]} - 1 ))
    local idy=0

    while (( leftlen <= ${#PWD} )); do
      echo ${PWD:$leftlen:$cols}
      leftlen=$(( leftlen + cols ))
      while (( idn >= 0 )); do
        local id=${key[idn]}
        local idx=$(( ${#idpath[$id]} - idy * cols ))
        (( idx <= cols && idx >= 0 )) || break
        tput hpa $idx
        printf "\e[1;31m%s\e[0m" $id
        (( idn-- ))
      done
      (( idy++ ))
      echo
    done

    read -s -n 1 id
    case ${!idpath[@]} in
      *$id*)
        cd ${idpath[$id]};;
    esac

    [[ -n ${cpath} && ${cpath//[^\/]} != '/' ]] || break
  done
}

alias c=cdpp
