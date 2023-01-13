#Author: Deep Mehta

#Current Branch can be either in local,master,main or any of your choice.Thus i used  git command provided below
currentbranch=$(git branch --show-current)
#To print all the files under current branch repository we are splitting the git command to 3 parts .
echo "current branch="$currentbranch
part1="git ls-tree -r "
part2=" --name-only"
#We are merging all git command together to get all files under current repository to check whether they have been modified or not
res=$part1$currentbranch$part2
mycmd3=$($res)
#Flag =0 if there is no change after commiting current repository ir it will be changed to 1
flag=0
for i in ${mycmd3[*]}; do
#"git differ file name" will tell us what's the difference in each file.
  rs4="git diff "
  rs5=$rs4$i

  rs6=$($rs5)
  n=${#rs6}  
  #Typecasting string which is n to integer res.
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

#Since as specified we need to get  head commit for local repository that was authored in the last week (boolean) we converted timestamp to epoch.
commit_time=$(git log -1 --pretty=format:"%at")
#Current time will tell what's the current time in epoch.
current_time=$(date +%s)
#Difference will tell the timestamp between current time and commit time
difference=$((current_time - commit_time))

#604800 is epoch timestamp for 7 days so if difference >604800 then Recent Commit:False or else Recent Commit:True
if [ $difference -lt 604800 ]; then
  echo "Recent Commit:True"
else
  echo "Recent Commit:False"
fi
#author_info will get author user name who commited at the last.
author_info=$(git log -1 --pretty=format:"%aN")

#if author name matches with deepm1298 then we know we can blame Deep or else Deep can't be blamed.!
if (( $author_info== deepm1298)); then
  echo "Blame Deep:True"
else
  echo "Blame Deep:False"
fi
