rm -rf test1.txt
echo "this is a test2 file" >> test2.txt
git add .
git commit -m "updated test1 file"
git push - origin main
git status
git pull
hash=$(git log --pretty=format:'%h' -n 1)
echo $hash
folderstr=$(git diff-tree --no-commit-id --name-only -r $hash) # > /Users/diptripa/git-updated-files/difference.txt
#cat /Users/diptripa/git-updated-files/difference.txt
echo $folderstr
git status

for i in $folderstr
do 
	# get all the list of changed files
	#echo $i 
	current_path=$(pwd)"/"$i
	#echo $current_path
	#curl -u admin:admin -T $current_path "http://localhost/artifactory/artidemo/$i"
done
