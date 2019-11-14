#/bin/bash -eu


function main () {
  for f in .??*
  do
    [[ "$f" == ".git" ]] && continue 
    [[ "$f" == ".DS_Store" ]] && continue 
    echo "$f"
    ln -s ${f} ~/${f}
  done
}

main
