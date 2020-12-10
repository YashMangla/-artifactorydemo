#rm -rf test.txt
#git rm test.txt
#echo "this is dummy1" >> test2.txt
#git add .
#git commit -m "sample test1"
#git push -origin main
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
	curl -u admin:admin -T $current_path "http://localhost/artifactory/artidemo/$i"
done
