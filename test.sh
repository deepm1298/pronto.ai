





mycmd=$(git branch --show-current)
echo "current branch="$mycmd

rs="git ls-tree -r "
rs2=" --name-only"
mycmd2=$rs$mycmd$rs2
mycmd3=$($mycmd2)
echo ${mycmd3[@]}

