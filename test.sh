
mycmd=$(git branch --show-current)
echo "current branch="$mycmd
rs="git ls-tree -r "
rs2=" --name-only"
mycmd2=$rs$mycmd$rs2
mycmd3=$($mycmd2)
flag=0
b=0
for i in ${mycmd3[*]}; do
  rs4="git diff "
  rs5=$rs4$i
  rs6=$($rs5)
  n=${#rs6}  
  res=$((n))
  if (($res >0)); then
    flag=1
fi
done
if (($flag ==1));then
    echo "Local Changes:True"
else
    echo "Local changes:False"
fi


commit_time=$(git log -1 --pretty=format:"%at")
current_time=$(date +%s)
difference=$((current_time - commit_time))


if [ $difference -lt 604800 ]; then
  echo "Recent Commit:True"
else
  echo "Recent Commit:False"
fi

author_info=$(git log -1 --pretty=format:"%aN")


if (( $author_info== deepm1298)); then
  echo "Blame Deep:True"
else
  echo "Blame Deep:False"
fi