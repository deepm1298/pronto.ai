for n in main master; do 
  b="$(git branch -r -l "origin/$n")"
  if [[ -n "$b" ]]; then
    git checkout "${b[0]##*/}"
    break # keep the first success
  fi 
done 