#!/bin/sh

check_empty_files()
{
	_file="$1"
	[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }
	[ ! -f "$_file" ] && { echo "Error: $0 file not found."; exit 2; }
	 
	if [ -s "$_file" ] 
	then
		echo "$_file has some data."
		run_file_task "$_file"
	        # do something as file has data
	else
		echo "$_file is empty."
	        # do something as file is empty 
	fi
}



run_file_task()
{
	_file="$1"
	#tmp1= cat "$_file" | sed -n "14,14p"
	tmp1=$(cat "$_file" |grep "site" | sed "s/  //g" | sed "s/(//g" | sed "s/site=//g" | sed "s/ dc=/,/g" | sed "s/ hostType=/,/g" | sed "s/ hostOs=/,/g" | sed "s/ tool=/,/g" | sed "s/ \/t.*//g")
	#echo "site,dc,hostType,hostOs,tool" > sample1.csv
	echo "$tmp1" >> sample1.csv
}

checkout_new_data(){
	git pull
	hash=$(git log --pretty=format:'%h' -n 1)
	echo $hash
	folderstr=$(git diff-tree --no-commit-id --name-only -r $hash) # > /Users/diptripa/git-updated-files/difference.txt
	#cat /Users/diptripa/git-updated-files/difference.txt
	echo $folderstr
	#git status
	echo "site,dc,hostType,hostOs,tool" > sample1.csv
	for i in $folderstr
	do 
		# get all the list of changed files
		#echo $i 
		current_path=$(pwd)"/"$i
		#echo $current_path
		tmp1=$(echo "$current_path" | sed "s|\(.*\)/.*|\1|")
		echo $tmp1
		if [ -s "$current_path" ]
		then 
			echo $current_path
			curl -u admin:admin -T $current_path "http://localhost/artifactory/artidemo/$i"
			tmp2="$tmp1/run.sh"
			echo $tmp2
			check_empty_files $tmp2
		else 
			echo "this is else block"
			echo "$tmp1"
			echo "$tmp2"
		fi

	done
}

running_script(){
	checkout_new_data
}

running_script
#check_empty_files /Users/ymangla/test/artifactorydemo/run.sh